#include <regex>
#include <sys/wait.h>
#include <unistd.h>
#include <stdio.h>
#include <dlfcn.h>
#include <jni.h>

#include "spsc.h"
#include "harness.h"


// share memory size
#define BUFFER_SIZE 1024 * 1024 *128

extern "C"
{
	int spsc_create_sub(spsc_ring* ring, const size_t size);
	size_t spsc_read(spsc_ring* ring, void* dest, const size_t n);
    typedef void function_t(JNIEnv *, jclass,jstring);
}

JavaVM *javaVM;
JNIEnv *env;
function_t *targetFunctionPtr;
std::string targetAppPath;
std::string targetLibName;
std::string targetMethodSig;
std::string targetFunctionName;

jint getjni_int(char * data, int x)
{
    jint i = 0;
    i += ((data[x] & 0xff) << 24);
    i += ((data[x+1] & 0xff) << 16);
    i += ((data[x+2] & 0xff) << 8);
    i += ((data[x+3] & 0xff));
    if (data[x]<0)
    {
        return i-4294967296;
    }else{
        return i;
    }
}

jlong getjni_long(char * data, int x)
{
    jlong i = 0;
    i += ((data[x] & 0xff) << 56);
    i += ((data[x+1] & 0xff) << 48);
    i += ((data[x+2] & 0xff) << 40);
    i += ((data[x+3] & 0xff) << 32);
    i += ((data[x+4] & 0xff) << 24);
    i += ((data[x+5] & 0xff) << 16);
    i += ((data[x+6] & 0xff) << 8);
    i += ((data[x+7] & 0xff));
    if (data[x]<0)
    {
        return i-9223372036854775808*2;
    }else{
        return i;
    }
}


jbyte getjni_byte(char * data, int x)
{
    return data[x];
}

jboolean getjni_boolean(char *data, int x)
{
    int i=data[x];
    if(i>0)
    {
        return true;
    }else{
        return false;
    }
}

jchar getjni_char(char *data, int x)
{
    jchar i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    return i;
}

jshort getjni_short(char *data, int x)
{
    jshort i = 0;
    i += ((data[x] & 0xff) << 8);
    i += ((data[x+1] & 0xff));
    if(data[x]<0)
    {
        return i-65536;
    }else{
        return i;
    }
}

union charFloat{
    char str[8];
    float value;
};

union charDouble{
    char str[8];
    double value;
};

jfloat getjni_float(char *data, int x)
{
    union charFloat f;
    f.str[3]=data[x];
    f.str[2]=data[x+1];
    f.str[1]=data[x+2];
    f.str[0]=data[x+3];
    return f.value;
}

jdouble getjni_double(char *data, int x)
{
    union charDouble dou;
    dou.value=0.0;
    dou.str[7]=data[x];
    dou.str[6]=data[x+1];
    dou.str[5]=data[x+2];
    dou.str[4]=data[x+3];
    dou.str[3]=data[x+4];
    dou.str[2]=data[x+5];
    dou.str[1]=data[x+6];
    dou.str[0]=data[x+7];
    return dou.value;
}

jobject getGlobalContext(JNIEnv *env) {
    jobject application = NULL;
    jclass activity_thread_clz = env->FindClass("android/app/ActivityThread");
    if (activity_thread_clz != NULL) {
        jmethodID currentApplication = env->GetStaticMethodID(activity_thread_clz, "currentApplication", "()Landroid/app/Application;");
        if (currentApplication != NULL) {
            application = env->CallStaticObjectMethod(activity_thread_clz, currentApplication);
        } else {
            printf("Cannot find method: currentApplication() in ActivityThread.");
        }
        env->DeleteLocalRef(activity_thread_clz);
    } else {
        printf("Cannot find class: android.app.ActivityThread");
    }
    return application;
}

jobject getIntent(JNIEnv *env){
    jobject jobj = NULL;
    jclass intentclass = env->FindClass("android/content/Intent");
    if(intentclass == NULL)
    {
        return NULL;
    }
    jmethodID jid = env->GetMethodID(intentclass, "<init>", "()V");
    
    jobj = env->NewObject(intentclass, jid);
    return jobj;
}

jobjectArray getStringArray(JNIEnv *env, char* data)
{
    jclass cls = env->FindClass("java/lang/String");
    jobjectArray str_array = env->NewObjectArray(10, cls, 0);
    jstring jstr;
    for(int i=0; i<10; i++){
        jstr = env->NewStringUTF(data);
        env->SetObjectArrayElement(str_array, i, jstr);
        env->DeleteLocalRef(jstr);
    }
    return str_array;
}

jobject getBundle(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = env->FindClass("android/os/Bundle");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = env->GetMethodID(bundle, "<init>", "()V");
    
    jobj = env->NewObject(bundle, jid);
    return jobj;
}

jobject getObject(JNIEnv *env,jobject obj){
    jobject jobj = NULL;
    jclass bundle = env->FindClass("android/lang/Object");
    if(bundle == NULL){
        return NULL;
    }
    jmethodID jid = env->GetMethodID(bundle, "<init>", "()V");
    
    jobj = env->NewObject(bundle, jid);
    return jobj;
}

jobject getPendingIntent(JNIEnv *env, jobject obj){
    jobject jobj = NULL;
    jclass pcls = env->FindClass("android/app/PendingIntent");
    if (pcls != NULL){
        return jobj;
    }
    jclass jcls=env->FindClass("android.app.PendingIntent");
    if(jcls == NULL){
        return NULL;
    }
    jmethodID getbroad = env->GetMethodID(jcls, "getBroadcast", "(Landroid/content/Context;ILandroid/content/Intent;I)Landroid.app.PendingIntent;");
    
    jobject context = getGlobalContext(env);
    jobject intent = getIntent(env);
    
    jobj = env->CallObjectMethod(obj, getbroad, context,0,intent,0);
    return jobj;
}

void getjni_string(char *dest, char *src, int start, int n)
{
    char *p = dest;
    char *q = src;
    char *temp = NULL;
    int len = strlen(src);

    if(start >= len || start < 0){
      return;
    }
    temp = q+start;
    if(n>strlen(temp)){
       n = strlen(temp);
    }
    q+=start;
    while(n--) *(p++) = *(q++);
    *(p++)='\0';
}


int main(int argc, char *argv[]) {
    targetAppPath = "/data/local/tmp/native_leak.apk";
    targetLibName = "/data/local/tmp/libleak.so";
    std::string className="org/arguslab/native_leak/MainActivity";
    targetFunctionName="Java_org_arguslab_native_1leak_MainActivity_send";

	std::cout << " [+] Native Harness \n" << std::endl;

	std::cout << " [+] Loading target apk: " << targetAppPath << std::endl;
			
	/* Load DVM andART */
	auto [javaVM_tmp, env_tmp] = load_art();
	javaVM = javaVM_tmp;
	env = env_tmp;

	std::cout << " [+] Initialization success (vm=" << javaVM << ", env=" << env << ")\n";

	if (findFunctionPtrSharedLib() == 1) {
		return 1;
	}

	JNI_OnLoad_t *JNI_OnLoadPtr;
	void *lib = dlopen(targetLibName.c_str(), RTLD_NOW);
	if (!lib) 
	{
		std::cerr << " [+] Dlopen the library failed" << dlerror() << std::endl;
		abort();
	}
	std::cout << " [+] Loading target library: " << targetLibName << std::endl;

	// JNI_OnLoadPtr = (JNI_OnLoad_t *)dlsym(lib, "JNI_OnLoad");
	// if (JNI_OnLoadPtr)
	// {
	// 	JNI_OnLoadPtr(javaVM, NULL);
	// }
	// dlclose(lib);

	jclass CallerCls = env->FindClass(className.c_str());
	std::cout << " [+] Find target Class: " << className << std::endl;
	jobject CallerObj = env->AllocObject(CallerCls);

	
	/* Init forkserver here */
	#ifdef __AFL_HAVE_MANUAL_CONTROL
		__AFL_INIT();
	#endif

	/* Fuzzing */
	spsc_ring ring;
	if (spsc_create_sub(&ring, BUFFER_SIZE) == -1) return 1;

	std::cout << " [+] Fuzzing start..." << std::endl;
	char buf[512];

	while (1)
	{

		size_t n_read = spsc_read(&ring, buf, 511);
		if (n_read > 0)
		{
			buf[n_read] = '\0';
			printf("Received message: %s\n", buf);
            char* data=buf;
            if(strlen(data) >= 0){
            jstring par0 = env->NewStringUTF("358240051111110");
            targetFunctionPtr(env, CallerCls, par0);
            env->DeleteLocalRef(par0);
            }
		}
	}

	printf(" [+] Cleaning up VM\n");
	javaVM->DestroyJavaVM();

	printf(" [+] Closing target library\n");
	dlclose(lib);
	return 0;
}

/* Load android runtime using JNI functions */
static auto load_art() -> std::pair<JavaVM *, JNIEnv *>
{
	/* Set-up required arguments */
	std::string apk_path = "-Djava.class.path=" + targetAppPath; 
	std::string lib_path = "-Djava.library.path=/data/local/tmp";
    JavaVMOption opt[] = {
    	{ apk_path.c_str(), nullptr},
        { lib_path.c_str(), nullptr}
    };


    JavaVMInitArgs args = {
        JNI_VERSION_1_6,
        std::size(opt),
        opt,
        JNI_FALSE
    };

	/* Open shared libraries */
	void *libart =dlopen("libdvm.so",RTLD_NOW);
	if(!libart)
	{
		libart = dlopen("libart.so", RTLD_NOW);
		if (!libart) 
		{
			std::cerr << dlerror() << std::endl;
			abort();
		}
	}

    void * libandroidruntime = dlopen("libandroid_runtime.so", RTLD_NOW);
    if (!libandroidruntime) 
    {
        std::cerr << dlerror() << std::endl;
        abort();
    }
    
    auto JNI_CreateJavaVM = (JNI_CreateJavaVM_t *)dlsym(libart, "JNI_CreateJavaVM");
	
    if (!JNI_CreateJavaVM)
    {
        std::cerr << "No JNI_CreateJavaVM: " << dlerror() << std::endl;
        abort();
    }

    auto registerNatives = (registerNatives_t *)dlsym(libandroidruntime, "Java_com_android_internal_util_WithFramework_registerNatives");
    if (!registerNatives)
    {	
		registerNatives = (registerNatives_t *)dlsym(libandroidruntime, "registerFrameworkNatives");
		if(!registerNatives)
		{
			std::cerr << "No registerNatives: " << dlerror() << std::endl;
        	abort();
		}
    }

	/* Create JVM and register defaults native methods */
    std::pair<JavaVM *, JNIEnv *> ret;
	
    int res = JNI_CreateJavaVM(&ret.first, &ret.second, &args);
    if (res != 0)
    {
        std::cerr << "Failed to create VM: " << res << std::endl;
        abort();
    }

    auto [vm_tmp, env_tmp] = ret;

    jint res1 = registerNatives(env_tmp, 0);
    if (res1 != 0)
    {
        std::cerr << "Failed to call registerNatives: " << res1 << std::endl;
        abort();
    }

    return ret;
}

int findFunctionPtrSharedLib()
{
	/* Search in pattern-defined functions */
	void *lib = dlopen(targetLibName.c_str(), RTLD_NOW);
	if (!lib) 
	{
		std::cerr << dlerror() << std::endl;
		return 1;
	}

	targetFunctionPtr = (function_t *)dlsym(lib, targetFunctionName.c_str());
	if (targetFunctionPtr)
	{
		std::cout << " [+] Found the target function name:" << targetFunctionName << std::endl;
		return 0;
	}
	dlclose(lib);

    /* Search in static-defined functions */
	// duplicate JavaVM to inject fake RegisterNatives function
	JavaVM *javaVM_fake = (JavaVM *) malloc(sizeof(JavaVM));
	JNIInvokeInterface *javaVM_fake_functions = (JNIInvokeInterface *) malloc(sizeof(JNIInvokeInterface));
	JNIInvokeInterface *javaVM_functions = (JNIInvokeInterface *)javaVM->functions;
	JNI_OnLoad_t *JNI_OnLoadPtr;

	javaVM_fake_functions->GetEnv = GetEnv_fake;

	javaVM_fake_functions->AttachCurrentThread = AttachCurrentThread_fake;
	javaVM_fake_functions->DetachCurrentThread = DetachCurrentThread_fake;
	javaVM_fake_functions->AttachCurrentThreadAsDaemon = AttachCurrentThreadAsDaemon_fake;
	javaVM_fake_functions->DestroyJavaVM = DestroyJavaVM_fake;
	javaVM_fake->functions = javaVM_fake_functions;

	lib = dlopen(targetLibName.c_str(), RTLD_NOW);
	if (!lib) 
	{
		std::cerr << dlerror() << std::endl;
		return 1;
	}

	JNI_OnLoadPtr = (JNI_OnLoad_t *)dlsym(lib, "JNI_OnLoad");
	if (JNI_OnLoadPtr)
	{
		JNI_OnLoadPtr(javaVM_fake, NULL);
		if (targetFunctionPtr) {
			return 0;
		}
	}
	dlclose(lib);
	
	std::cerr << " [*] Function " << targetFunctionName << " to be fuzzed not found" << std::endl;

    return 1;
}

jint JNICALL GetEnv_fake(JavaVM *javaVM_fake, void **env_ret, jint status)
	{
		std::cout << " [+] Fake GetEnv called" << std::endl;

		JNIEnv *env_fake = (JNIEnv *) malloc(sizeof(JNIEnv));
		JNINativeInterface *env_fake_functions = (JNINativeInterface *) malloc(sizeof(JNINativeInterface));
		JNINativeInterface *env_functions = (JNINativeInterface *)env->functions;

		env_fake_functions->RegisterNatives = RegisterNatives_fake;

		env_fake_functions->FindClass = FindClass_fake;
		env_fake_functions->GetVersion = GetVersion_fake;
		env_fake_functions->DefineClass = DefineClass_fake;
		env_fake_functions->FromReflectedMethod = FromReflectedMethod_fake;
		env_fake_functions->FromReflectedField = FromReflectedField_fake;
		env_fake_functions->ToReflectedMethod = ToReflectedMethod_fake;
		env_fake_functions->GetSuperclass = GetSuperclass_fake;
		env_fake_functions->IsAssignableFrom = IsAssignableFrom_fake;
		env_fake_functions->ToReflectedField = ToReflectedField_fake;
		env_fake_functions->Throw = Throw_fake;
		env_fake_functions->ThrowNew = ThrowNew_fake;
		env_fake_functions->ExceptionOccurred = ExceptionOccurred_fake;
		env_fake_functions->ExceptionDescribe = ExceptionDescribe_fake;
		env_fake_functions->ExceptionClear = ExceptionClear_fake;
		env_fake_functions->FatalError = FatalError_fake;
		env_fake_functions->PushLocalFrame = PushLocalFrame_fake;
		env_fake_functions->PopLocalFrame = PopLocalFrame_fake;
		env_fake_functions->NewGlobalRef = NewGlobalRef_fake;
		env_fake_functions->DeleteGlobalRef = DeleteGlobalRef_fake;
		env_fake_functions->DeleteLocalRef = DeleteLocalRef_fake;
		env_fake_functions->IsSameObject = IsSameObject_fake;
		env_fake_functions->NewLocalRef = NewLocalRef_fake;
		env_fake_functions->EnsureLocalCapacity = EnsureLocalCapacity_fake;
		env_fake_functions->AllocObject = AllocObject_fake;
		env_fake_functions->NewObject = NewObject_fake;
		env_fake_functions->NewObjectV = NewObjectV_fake;
		env_fake_functions->NewObjectA = NewObjectA_fake;
		env_fake_functions->GetObjectClass = GetObjectClass_fake;
		env_fake_functions->IsInstanceOf = IsInstanceOf_fake;
		env_fake_functions->GetMethodID = GetMethodID_fake;
		env_fake_functions->CallObjectMethod = CallObjectMethod_fake;
		env_fake_functions->CallObjectMethodV = CallObjectMethodV_fake;
		env_fake_functions->CallObjectMethodA = CallObjectMethodA_fake;
		env_fake_functions->CallBooleanMethod = CallBooleanMethod_fake;
		env_fake_functions->CallBooleanMethodV = CallBooleanMethodV_fake;
		env_fake_functions->CallBooleanMethodA = CallBooleanMethodA_fake;
		env_fake_functions->CallByteMethod = CallByteMethod_fake;
		env_fake_functions->CallByteMethodV = CallByteMethodV_fake;
		env_fake_functions->CallByteMethodA = CallByteMethodA_fake;
		env_fake_functions->CallCharMethod = CallCharMethod_fake;
		env_fake_functions->CallCharMethodV = CallCharMethodV_fake;
		env_fake_functions->CallCharMethodA = CallCharMethodA_fake;
		env_fake_functions->CallShortMethod = CallShortMethod_fake;
		env_fake_functions->CallShortMethodV = CallShortMethodV_fake;
		env_fake_functions->CallShortMethodA = CallShortMethodA_fake;
		env_fake_functions->CallIntMethod = CallIntMethod_fake;
		env_fake_functions->CallIntMethodV = CallIntMethodV_fake;
		env_fake_functions->CallIntMethodA = CallIntMethodA_fake;
		env_fake_functions->CallLongMethod = CallLongMethod_fake;
		env_fake_functions->CallLongMethodV = CallLongMethodV_fake;
		env_fake_functions->CallLongMethodA = CallLongMethodA_fake;
		env_fake_functions->CallFloatMethod = CallFloatMethod_fake;
		env_fake_functions->CallFloatMethodV = CallFloatMethodV_fake;
		env_fake_functions->CallFloatMethodA = CallFloatMethodA_fake;
		env_fake_functions->CallDoubleMethod = CallDoubleMethod_fake;
		env_fake_functions->CallDoubleMethodV = CallDoubleMethodV_fake;
		env_fake_functions->CallDoubleMethodA = CallDoubleMethodA_fake;
		env_fake_functions->CallVoidMethod = CallVoidMethod_fake;
		env_fake_functions->CallVoidMethodV = CallVoidMethodV_fake;
		env_fake_functions->CallVoidMethodA = CallVoidMethodA_fake;
		env_fake_functions->CallNonvirtualObjectMethod = CallNonvirtualObjectMethod_fake;
		env_fake_functions->CallNonvirtualObjectMethodV = CallNonvirtualObjectMethodV_fake;
		env_fake_functions->CallNonvirtualObjectMethodA = CallNonvirtualObjectMethodA_fake;
		env_fake_functions->CallNonvirtualBooleanMethod = CallNonvirtualBooleanMethod_fake;
		env_fake_functions->CallNonvirtualBooleanMethodV = CallNonvirtualBooleanMethodV_fake;
		env_fake_functions->CallNonvirtualBooleanMethodA = CallNonvirtualBooleanMethodA_fake;
		env_fake_functions->CallNonvirtualByteMethod = CallNonvirtualByteMethod_fake;
		env_fake_functions->CallNonvirtualByteMethodV = CallNonvirtualByteMethodV_fake;
		env_fake_functions->CallNonvirtualByteMethodA = CallNonvirtualByteMethodA_fake;
		env_fake_functions->CallNonvirtualCharMethod = CallNonvirtualCharMethod_fake;
		env_fake_functions->CallNonvirtualCharMethodV = CallNonvirtualCharMethodV_fake;
		env_fake_functions->CallNonvirtualCharMethodA = CallNonvirtualCharMethodA_fake;
		env_fake_functions->CallNonvirtualShortMethod = CallNonvirtualShortMethod_fake;
		env_fake_functions->CallNonvirtualShortMethodV = CallNonvirtualShortMethodV_fake;
		env_fake_functions->CallNonvirtualShortMethodA = CallNonvirtualShortMethodA_fake;
		env_fake_functions->CallNonvirtualIntMethod = CallNonvirtualIntMethod_fake;
		env_fake_functions->CallNonvirtualIntMethodV = CallNonvirtualIntMethodV_fake;
		env_fake_functions->CallNonvirtualIntMethodA = CallNonvirtualIntMethodA_fake;
		env_fake_functions->CallNonvirtualLongMethod = CallNonvirtualLongMethod_fake;
		env_fake_functions->CallNonvirtualLongMethodV = CallNonvirtualLongMethodV_fake;
		env_fake_functions->CallNonvirtualLongMethodA = CallNonvirtualLongMethodA_fake;
		env_fake_functions->CallNonvirtualFloatMethod = CallNonvirtualFloatMethod_fake;
		env_fake_functions->CallNonvirtualFloatMethodV = CallNonvirtualFloatMethodV_fake;
		env_fake_functions->CallNonvirtualFloatMethodA = CallNonvirtualFloatMethodA_fake;
		env_fake_functions->CallNonvirtualDoubleMethod = CallNonvirtualDoubleMethod_fake;
		env_fake_functions->CallNonvirtualDoubleMethodV = CallNonvirtualDoubleMethodV_fake;
		env_fake_functions->CallNonvirtualDoubleMethodA = CallNonvirtualDoubleMethodA_fake;
		env_fake_functions->CallNonvirtualVoidMethod = CallNonvirtualVoidMethod_fake;
		env_fake_functions->CallNonvirtualVoidMethodV = CallNonvirtualVoidMethodV_fake;
		env_fake_functions->CallNonvirtualVoidMethodA = CallNonvirtualVoidMethodA_fake;
		env_fake_functions->GetFieldID = GetFieldID_fake;
		env_fake_functions->GetObjectField = GetObjectField_fake;
		env_fake_functions->GetBooleanField = GetBooleanField_fake;
		env_fake_functions->GetByteField = GetByteField_fake;
		env_fake_functions->GetCharField = GetCharField_fake;
		env_fake_functions->GetShortField = GetShortField_fake;
		env_fake_functions->GetIntField = GetIntField_fake;
		env_fake_functions->GetLongField = GetLongField_fake;
		env_fake_functions->GetFloatField = GetFloatField_fake;
		env_fake_functions->GetDoubleField = GetDoubleField_fake;
		env_fake_functions->SetObjectField = SetObjectField_fake;
		env_fake_functions->SetBooleanField = SetBooleanField_fake;
		env_fake_functions->SetByteField = SetByteField_fake;
		env_fake_functions->SetCharField = SetCharField_fake;
		env_fake_functions->SetShortField = SetShortField_fake;
		env_fake_functions->SetIntField = SetIntField_fake;
		env_fake_functions->SetLongField = SetLongField_fake;
		env_fake_functions->SetFloatField = SetFloatField_fake;
		env_fake_functions->SetDoubleField = SetDoubleField_fake;
		env_fake_functions->GetStaticMethodID = GetStaticMethodID_fake;
		env_fake_functions->CallStaticObjectMethod = CallStaticObjectMethod_fake;
		env_fake_functions->CallStaticObjectMethodV = CallStaticObjectMethodV_fake;
		env_fake_functions->CallStaticObjectMethodA = CallStaticObjectMethodA_fake;
		env_fake_functions->CallStaticBooleanMethod = CallStaticBooleanMethod_fake;
		env_fake_functions->CallStaticBooleanMethodV = CallStaticBooleanMethodV_fake;
		env_fake_functions->CallStaticBooleanMethodA = CallStaticBooleanMethodA_fake;
		env_fake_functions->CallStaticByteMethod = CallStaticByteMethod_fake;
		env_fake_functions->CallStaticByteMethodV = CallStaticByteMethodV_fake;
		env_fake_functions->CallStaticByteMethodA = CallStaticByteMethodA_fake;
		env_fake_functions->CallStaticCharMethod = CallStaticCharMethod_fake;
		env_fake_functions->CallStaticCharMethodV = CallStaticCharMethodV_fake;
		env_fake_functions->CallStaticCharMethodA = CallStaticCharMethodA_fake;
		env_fake_functions->CallStaticShortMethod = CallStaticShortMethod_fake;
		env_fake_functions->CallStaticShortMethodV = CallStaticShortMethodV_fake;
		env_fake_functions->CallStaticShortMethodA = CallStaticShortMethodA_fake;
		env_fake_functions->CallStaticIntMethod = CallStaticIntMethod_fake;
		env_fake_functions->CallStaticIntMethodV = CallStaticIntMethodV_fake;
		env_fake_functions->CallStaticIntMethodA = CallStaticIntMethodA_fake;
		env_fake_functions->CallStaticLongMethod = CallStaticLongMethod_fake;
		env_fake_functions->CallStaticLongMethodV = CallStaticLongMethodV_fake;
		env_fake_functions->CallStaticLongMethodA = CallStaticLongMethodA_fake;
		env_fake_functions->CallStaticFloatMethod = CallStaticFloatMethod_fake;
		env_fake_functions->CallStaticFloatMethodV = CallStaticFloatMethodV_fake;
		env_fake_functions->CallStaticFloatMethodA = CallStaticFloatMethodA_fake;
		env_fake_functions->CallStaticDoubleMethod = CallStaticDoubleMethod_fake;
		env_fake_functions->CallStaticDoubleMethodV = CallStaticDoubleMethodV_fake;
		env_fake_functions->CallStaticDoubleMethodA = CallStaticDoubleMethodA_fake;
		env_fake_functions->CallStaticVoidMethod = CallStaticVoidMethod_fake;
		env_fake_functions->CallStaticVoidMethodV = CallStaticVoidMethodV_fake;
		env_fake_functions->CallStaticVoidMethodA = CallStaticVoidMethodA_fake;
		env_fake_functions->GetStaticFieldID = GetStaticFieldID_fake;
		env_fake_functions->GetStaticObjectField = GetStaticObjectField_fake;
		env_fake_functions->GetStaticBooleanField = GetStaticBooleanField_fake;
		env_fake_functions->GetStaticByteField = GetStaticByteField_fake;
		env_fake_functions->GetStaticCharField = GetStaticCharField_fake;
		env_fake_functions->GetStaticShortField = GetStaticShortField_fake;
		env_fake_functions->GetStaticIntField = GetStaticIntField_fake;
		env_fake_functions->GetStaticLongField = GetStaticLongField_fake;
		env_fake_functions->GetStaticFloatField = GetStaticFloatField_fake;
		env_fake_functions->GetStaticDoubleField = GetStaticDoubleField_fake;
		env_fake_functions->SetStaticObjectField = SetStaticObjectField_fake;
		env_fake_functions->SetStaticBooleanField = SetStaticBooleanField_fake;
		env_fake_functions->SetStaticByteField = SetStaticByteField_fake;
		env_fake_functions->SetStaticCharField = SetStaticCharField_fake;
		env_fake_functions->SetStaticShortField = SetStaticShortField_fake;
		env_fake_functions->SetStaticIntField = SetStaticIntField_fake;
		env_fake_functions->SetStaticLongField = SetStaticLongField_fake;
		env_fake_functions->SetStaticFloatField = SetStaticFloatField_fake;
		env_fake_functions->SetStaticDoubleField = SetStaticDoubleField_fake;
		env_fake_functions->NewString = NewString_fake;
		env_fake_functions->GetStringLength = GetStringLength_fake;
		env_fake_functions->GetStringChars = GetStringChars_fake;
		env_fake_functions->ReleaseStringChars = ReleaseStringChars_fake;
		env_fake_functions->NewStringUTF = NewStringUTF_fake;
		env_fake_functions->GetStringUTFLength = GetStringUTFLength_fake;
		env_fake_functions->GetStringUTFChars = GetStringUTFChars_fake;
		env_fake_functions->ReleaseStringUTFChars = ReleaseStringUTFChars_fake;
		env_fake_functions->GetArrayLength = GetArrayLength_fake;
		env_fake_functions->NewObjectArray = NewObjectArray_fake;
		env_fake_functions->GetObjectArrayElement = GetObjectArrayElement_fake;
		env_fake_functions->SetObjectArrayElement = SetObjectArrayElement_fake;
		env_fake_functions->NewBooleanArray = NewBooleanArray_fake;
		env_fake_functions->NewByteArray = NewByteArray_fake;
		env_fake_functions->NewCharArray = NewCharArray_fake;
		env_fake_functions->NewShortArray = NewShortArray_fake;
		env_fake_functions->NewIntArray = NewIntArray_fake;
		env_fake_functions->NewLongArray = NewLongArray_fake;
		env_fake_functions->NewFloatArray = NewFloatArray_fake;
		env_fake_functions->NewDoubleArray = NewDoubleArray_fake;
		env_fake_functions->GetBooleanArrayElements = GetBooleanArrayElements_fake;
		env_fake_functions->GetByteArrayElements = GetByteArrayElements_fake;
		env_fake_functions->GetCharArrayElements = GetCharArrayElements_fake;
		env_fake_functions->GetShortArrayElements = GetShortArrayElements_fake;
		env_fake_functions->GetIntArrayElements = GetIntArrayElements_fake;
		env_fake_functions->GetLongArrayElements = GetLongArrayElements_fake;
		env_fake_functions->GetFloatArrayElements = GetFloatArrayElements_fake;
		env_fake_functions->GetDoubleArrayElements = GetDoubleArrayElements_fake;
		env_fake_functions->ReleaseBooleanArrayElements = ReleaseBooleanArrayElements_fake;
		env_fake_functions->ReleaseByteArrayElements = ReleaseByteArrayElements_fake;
		env_fake_functions->ReleaseCharArrayElements = ReleaseCharArrayElements_fake;
		env_fake_functions->ReleaseShortArrayElements = ReleaseShortArrayElements_fake;
		env_fake_functions->ReleaseIntArrayElements = ReleaseIntArrayElements_fake;
		env_fake_functions->ReleaseLongArrayElements = ReleaseLongArrayElements_fake;
		env_fake_functions->ReleaseFloatArrayElements = ReleaseFloatArrayElements_fake;
		env_fake_functions->ReleaseDoubleArrayElements = ReleaseDoubleArrayElements_fake;
		env_fake_functions->GetBooleanArrayRegion = GetBooleanArrayRegion_fake;
		env_fake_functions->GetByteArrayRegion = GetByteArrayRegion_fake;
		env_fake_functions->GetCharArrayRegion = GetCharArrayRegion_fake;
		env_fake_functions->GetShortArrayRegion = GetShortArrayRegion_fake;
		env_fake_functions->GetIntArrayRegion = GetIntArrayRegion_fake;
		env_fake_functions->GetLongArrayRegion = GetLongArrayRegion_fake;
		env_fake_functions->GetFloatArrayRegion = GetFloatArrayRegion_fake;
		env_fake_functions->GetDoubleArrayRegion = GetDoubleArrayRegion_fake;
		env_fake_functions->SetBooleanArrayRegion = SetBooleanArrayRegion_fake;
		env_fake_functions->SetByteArrayRegion = SetByteArrayRegion_fake;
		env_fake_functions->SetCharArrayRegion = SetCharArrayRegion_fake;
		env_fake_functions->SetShortArrayRegion = SetShortArrayRegion_fake;
		env_fake_functions->SetIntArrayRegion = SetIntArrayRegion_fake;
		env_fake_functions->SetLongArrayRegion = SetLongArrayRegion_fake;
		env_fake_functions->SetFloatArrayRegion = SetFloatArrayRegion_fake;
		env_fake_functions->SetDoubleArrayRegion = SetDoubleArrayRegion_fake;
		env_fake_functions->UnregisterNatives = UnregisterNatives_fake;
		env_fake_functions->MonitorEnter = MonitorEnter_fake;
		env_fake_functions->MonitorExit = MonitorExit_fake;
		env_fake_functions->GetJavaVM = GetJavaVM_fake;
		env_fake_functions->GetStringRegion = GetStringRegion_fake;
		env_fake_functions->GetStringUTFRegion = GetStringUTFRegion_fake;
		env_fake_functions->GetPrimitiveArrayCritical = GetPrimitiveArrayCritical_fake;
		env_fake_functions->ReleasePrimitiveArrayCritical = ReleasePrimitiveArrayCritical_fake;
		env_fake_functions->GetStringCritical = GetStringCritical_fake;
		env_fake_functions->ReleaseStringCritical = ReleaseStringCritical_fake;
		env_fake_functions->NewWeakGlobalRef = NewWeakGlobalRef_fake;
		env_fake_functions->DeleteWeakGlobalRef = DeleteWeakGlobalRef_fake;
		env_fake_functions->ExceptionCheck = ExceptionCheck_fake;
		env_fake_functions->NewDirectByteBuffer = NewDirectByteBuffer_fake;
		env_fake_functions->GetDirectBufferAddress = GetDirectBufferAddress_fake;
		env_fake_functions->GetDirectBufferCapacity = GetDirectBufferCapacity_fake;
		env_fake_functions->GetObjectRefType = GetObjectRefType_fake;

		env_fake->functions = env_fake_functions;

		*env_ret = (void *)env_fake;
		
		return JNI_OK;
	}

/* Definition of fake functions for JavaVM */

jint JNICALL AttachCurrentThread_fake(JavaVM *vm, JNIEnv **penv, void *args)
	{
		return javaVM->AttachCurrentThread(penv, args);
	}

jint JNICALL DestroyJavaVM_fake(JavaVM *vm) 
	{
        return javaVM->DestroyJavaVM();
    }

jint JNICALL DetachCurrentThread_fake(JavaVM *vm) 
	{
        return javaVM->DetachCurrentThread();
    }

jint JNICALL AttachCurrentThreadAsDaemon_fake(JavaVM *vm, JNIEnv **penv, void *args) 
	{
        return javaVM->AttachCurrentThreadAsDaemon(penv, args);
    }

/* Definition of fake functions for JNIEnv */
// fake RegisterNatives, to intercept target function pointer
jint RegisterNatives_fake(JNIEnv *penv, jclass clazz, const JNINativeMethod *methods, jint nMethods)
	{
		std::cout << " [+] Fake RegisterNatives called" << std::endl;

		for (int i = 0; i < (int)nMethods; i++) {
			std::cout << "	Method " << i << std::endl;
			std::cout << "	├── name(Java): " << methods[i].name << std::endl;
			std::cout << "	├── signature: " << methods[i].signature << std::endl;
			std::cout << "	└── pointer(Native): "<< methods[i].fnPtr << std::endl;
			
			if (std::string(methods[i].name).compare(targetFunctionName) == 0) {
				std:: cout << " [+] Find the method pointer "<< methods[i].name <<std::endl;
				targetFunctionPtr = (function_t *) methods[i].fnPtr;
				return -1;
			}
		}

		// call original RegisterNatives
		return env->RegisterNatives(clazz, methods, nMethods);
	}

jint JNICALL GetVersion_fake(JNIEnv *penv)
{
	return env->GetVersion();
}
jclass JNICALL DefineClass_fake(JNIEnv* penv, const char* name, jobject obj, const jbyte* buf, jsize len)
{
	return env->DefineClass(name, obj, buf, len);
}
jclass JNICALL FindClass_fake(JNIEnv* penv, const char *name)
{
	return env->FindClass(name);
}
jmethodID JNICALL FromReflectedMethod_fake(JNIEnv* penv, jobject obj)
{
	return env->FromReflectedMethod(obj);
}
jfieldID JNICALL FromReflectedField_fake(JNIEnv* penv, jobject obj)
{
	return env->FromReflectedField(obj);
}
jobject JNICALL ToReflectedMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, jboolean isStatic)
{
	return env->ToReflectedMethod(clazz, methodID, isStatic);
}
jclass JNICALL GetSuperclass_fake(JNIEnv* penv, jclass clazz)
{
	return env->GetSuperclass(clazz);
}
jboolean JNICALL IsAssignableFrom_fake(JNIEnv* penv, jclass sub, jclass sup)
{
	return env->IsAssignableFrom(sub, sup);
}
jobject JNICALL ToReflectedField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jboolean isStatic)
{
	return env->ToReflectedField(clazz, fieldID, isStatic);
}
jint JNICALL Throw_fake(JNIEnv* penv, jthrowable obj)
{
	return env->Throw(obj);
}
jint JNICALL ThrowNew_fake(JNIEnv* penv, jclass clazz, const char *msg)
{
	return env->ThrowNew(clazz, msg);
}
jthrowable JNICALL ExceptionOccurred_fake(JNIEnv* penv)
{
	return env->ExceptionOccurred();
}
void JNICALL ExceptionDescribe_fake(JNIEnv* penv)
{
	return env->ExceptionDescribe();
}
void JNICALL ExceptionClear_fake(JNIEnv* penv)
{
	return env->ExceptionClear();
}
void JNICALL FatalError_fake(JNIEnv* penv, const char* msg)
{
	return env->FatalError(msg);
}
jint JNICALL PushLocalFrame_fake(JNIEnv* penv, jint val)
{
	return env->PushLocalFrame(val);
}
jobject JNICALL PopLocalFrame_fake(JNIEnv* penv, jobject obj)
{
	return env->PopLocalFrame(obj);
}
jobject JNICALL NewGlobalRef_fake(JNIEnv* penv, jobject obj)
{
	return env->NewGlobalRef(obj);
}
void JNICALL DeleteGlobalRef_fake(JNIEnv* penv, jobject obj)
{
	return env->DeleteGlobalRef(obj);
}
void JNICALL DeleteLocalRef_fake(JNIEnv* penv, jobject obj)
{
	return env->DeleteLocalRef(obj);
}
jboolean JNICALL IsSameObject_fake(JNIEnv* penv, jobject obj, jobject obj1)
{
	return env->IsSameObject(obj, obj1);
}
jobject JNICALL NewLocalRef_fake(JNIEnv* penv, jobject obj)
{
	return env->NewLocalRef(obj);
}
jint JNICALL EnsureLocalCapacity_fake(JNIEnv* penv, jint val)
{
	return env->EnsureLocalCapacity(val);
}
jobject JNICALL AllocObject_fake(JNIEnv* penv, jclass clazz)
{
	return env->AllocObject(clazz);
}
jobject JNICALL NewObject_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->NewObject(clazz, methodID);
}
jobject JNICALL NewObjectV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->NewObject(clazz, methodID, args);
}
jobject JNICALL NewObjectA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->NewObjectA(clazz, methodID, args);
}
jclass JNICALL GetObjectClass_fake(JNIEnv* penv, jobject obj)
{
	return env->GetObjectClass(obj);
}
jboolean JNICALL IsInstanceOf_fake(JNIEnv* penv, jobject obj, jclass clazz)
{
	return env->IsInstanceOf(obj, clazz);
}
jmethodID JNICALL GetMethodID_fake(JNIEnv* penv, jclass clazz, const char* name, const char* signature)
{
	return env->GetMethodID(clazz, name, signature);
}
jobject JNICALL CallObjectMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallObjectMethod(obj, methodID);
}
jobject JNICALL CallObjectMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallObjectMethodV(obj, methodID, args);
}
jobject JNICALL CallObjectMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallObjectMethodA(obj, methodID, args);
}
jboolean JNICALL CallBooleanMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallBooleanMethod(obj, methodID);
}
jboolean JNICALL CallBooleanMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallBooleanMethodV(obj, methodID, args);
}
jboolean JNICALL CallBooleanMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallBooleanMethodA(obj, methodID, args);
}
jbyte JNICALL CallByteMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallByteMethod(obj, methodID);
}
jbyte JNICALL CallByteMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallByteMethodV(obj, methodID, args);
}
jbyte JNICALL CallByteMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallByteMethodA(obj, methodID, args);
}
jchar JNICALL CallCharMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallCharMethod(obj, methodID);
}
jchar JNICALL CallCharMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallCharMethodV(obj, methodID, args);
}
jchar JNICALL CallCharMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallCharMethodA(obj, methodID, args);
}
jshort JNICALL CallShortMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallShortMethod(obj, methodID);
}
jshort JNICALL CallShortMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallShortMethodV(obj, methodID, args);
}
jshort JNICALL CallShortMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallShortMethodA(obj, methodID, args);
}
jint JNICALL CallIntMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallIntMethod(obj, methodID);
}
jint JNICALL CallIntMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallIntMethodV(obj, methodID, args);
}
jint JNICALL CallIntMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallIntMethodA(obj, methodID, args);
}
jlong JNICALL CallLongMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallLongMethod(obj, methodID);
}
jlong JNICALL CallLongMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallLongMethodV(obj, methodID, args);
}
jlong JNICALL CallLongMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallLongMethodA(obj, methodID, args);
}
jfloat JNICALL CallFloatMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallFloatMethod(obj, methodID);
}
jfloat JNICALL CallFloatMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallFloatMethodV(obj, methodID, args);
}
jfloat JNICALL CallFloatMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallFloatMethodA(obj, methodID, args);
}
jdouble JNICALL CallDoubleMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallDoubleMethod(obj, methodID);
}
jdouble JNICALL CallDoubleMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallDoubleMethodV(obj, methodID, args);
}
jdouble JNICALL CallDoubleMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallDoubleMethodA(obj, methodID, args);
}
void JNICALL CallVoidMethod_fake(JNIEnv* penv, jobject obj, jmethodID methodID, ...)
{
	return env->CallVoidMethod(obj, methodID);
}
void JNICALL CallVoidMethodV_fake(JNIEnv* penv, jobject obj, jmethodID methodID, va_list args)
{
	return env->CallVoidMethodV(obj, methodID, args);
}
void JNICALL CallVoidMethodA_fake(JNIEnv* penv, jobject obj, jmethodID methodID, const jvalue* args)
{
	return env->CallVoidMethodA(obj, methodID, args);
}
jobject JNICALL CallNonvirtualObjectMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualObjectMethod(obj, clazz, methodID);
}
jobject JNICALL CallNonvirtualObjectMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualObjectMethodV(obj, clazz, methodID, args);
}
jobject JNICALL CallNonvirtualObjectMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualObjectMethodA(obj, clazz, methodID, args);
}
jboolean JNICALL CallNonvirtualBooleanMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualBooleanMethod(obj, clazz, methodID);
}
jboolean JNICALL CallNonvirtualBooleanMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualBooleanMethodV(obj, clazz, methodID, args);
}
jboolean JNICALL CallNonvirtualBooleanMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualBooleanMethodA(obj, clazz, methodID, args);
}
jbyte JNICALL CallNonvirtualByteMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualByteMethod(obj, clazz, methodID);
}
jbyte JNICALL CallNonvirtualByteMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualByteMethodV(obj, clazz, methodID, args);
}
jbyte JNICALL CallNonvirtualByteMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualByteMethodA(obj, clazz, methodID, args);
}
jchar JNICALL CallNonvirtualCharMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualCharMethod(obj, clazz, methodID);
}
jchar JNICALL CallNonvirtualCharMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualCharMethodV(obj, clazz, methodID, args);
}
jchar JNICALL CallNonvirtualCharMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualCharMethodA(obj, clazz, methodID, args);
}
jshort JNICALL CallNonvirtualShortMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualShortMethod(obj, clazz, methodID);
}
jshort JNICALL CallNonvirtualShortMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualShortMethodV(obj, clazz, methodID, args);
}
jshort JNICALL CallNonvirtualShortMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualShortMethodA(obj, clazz, methodID, args);
}
jint JNICALL CallNonvirtualIntMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualIntMethod(obj, clazz, methodID);
}
jint JNICALL CallNonvirtualIntMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualIntMethodV(obj, clazz, methodID, args);
}
jint JNICALL CallNonvirtualIntMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualIntMethodA(obj, clazz, methodID, args);
}
jlong JNICALL CallNonvirtualLongMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualLongMethod(obj, clazz, methodID);
}
jlong JNICALL CallNonvirtualLongMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualLongMethodV(obj, clazz, methodID, args);
}
jlong JNICALL CallNonvirtualLongMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualLongMethodA(obj, clazz, methodID, args);
}
jfloat JNICALL CallNonvirtualFloatMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualFloatMethod(obj, clazz, methodID);
}
jfloat JNICALL CallNonvirtualFloatMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualFloatMethodV(obj, clazz, methodID, args);
}
jfloat JNICALL CallNonvirtualFloatMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualFloatMethodA(obj, clazz, methodID, args);
}
jdouble JNICALL CallNonvirtualDoubleMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualDoubleMethod(obj, clazz, methodID);
}
jdouble JNICALL CallNonvirtualDoubleMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualDoubleMethodV(obj, clazz, methodID, args);
}
jdouble JNICALL CallNonvirtualDoubleMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualDoubleMethodA(obj, clazz, methodID, args);
}
void JNICALL CallNonvirtualVoidMethod_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, ...)
{
	return env->CallNonvirtualVoidMethod(obj, clazz, methodID);
}
void JNICALL CallNonvirtualVoidMethodV_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallNonvirtualVoidMethodV(obj, clazz, methodID, args);
}
void JNICALL CallNonvirtualVoidMethodA_fake(JNIEnv* penv, jobject obj, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallNonvirtualVoidMethodA(obj, clazz, methodID, args);
}
jfieldID JNICALL GetFieldID_fake(JNIEnv* penv, jclass clazz, const char* name, const char* signature)
{
	return env->GetFieldID(clazz, name, signature);
}
jobject JNICALL GetObjectField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetObjectField(obj, fieldID);
}
jboolean JNICALL GetBooleanField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetBooleanField(obj, fieldID);
}
jbyte JNICALL GetByteField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetByteField(obj, fieldID);
}
jchar JNICALL GetCharField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetCharField(obj, fieldID);
}
jshort JNICALL GetShortField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetShortField(obj, fieldID);
}
jint JNICALL GetIntField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetIntField(obj, fieldID);
}
jlong JNICALL GetLongField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetLongField(obj, fieldID);
}
jfloat JNICALL GetFloatField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetFloatField(obj, fieldID);
}
jdouble JNICALL GetDoubleField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID)
{
	return env->GetDoubleField(obj, fieldID);
}
void JNICALL SetObjectField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jobject obj1)
{
	return env->SetObjectField(obj, fieldID, obj1);
}
void JNICALL SetBooleanField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jboolean val)
{
	return env->SetBooleanField(obj, fieldID, val);
}
void JNICALL SetByteField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jbyte val)
{
	return env->SetByteField(obj, fieldID, val);
}
void JNICALL SetCharField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jchar val)
{
	return env->SetCharField(obj, fieldID, val);
}
void JNICALL SetShortField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jshort val)
{
	return env->SetShortField(obj, fieldID, val);
}
void JNICALL SetIntField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jint val)
{
	return env->SetIntField(obj, fieldID, val);
}
void JNICALL SetLongField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jlong val)
{
	return env->SetLongField(obj, fieldID, val);
}
void JNICALL SetFloatField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jfloat val)
{
	return env->SetFloatField(obj, fieldID, val);
}
void JNICALL SetDoubleField_fake(JNIEnv* penv, jobject obj, jfieldID fieldID, jdouble val)
{
	return env->SetDoubleField(obj, fieldID, val);
}
jmethodID JNICALL GetStaticMethodID_fake(JNIEnv* penv, jclass clazz, const char* name, const char* signature)
{
	return env->GetStaticMethodID(clazz, name, signature);
}
jobject JNICALL CallStaticObjectMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticObjectMethod(clazz, methodID);
}
jobject JNICALL CallStaticObjectMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticObjectMethodV(clazz, methodID, args);
}
jobject JNICALL CallStaticObjectMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticObjectMethodA(clazz, methodID, args);
}
jboolean JNICALL CallStaticBooleanMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticBooleanMethod(clazz, methodID);
}
jboolean JNICALL CallStaticBooleanMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticBooleanMethodV(clazz, methodID, args);
}
jboolean JNICALL CallStaticBooleanMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticBooleanMethodA(clazz, methodID, args);
}
jbyte JNICALL CallStaticByteMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticByteMethod(clazz, methodID);
}
jbyte JNICALL CallStaticByteMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticByteMethodV(clazz, methodID, args);
}
jbyte JNICALL CallStaticByteMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticByteMethodA(clazz, methodID, args);
}
jchar JNICALL CallStaticCharMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticCharMethod(clazz, methodID);
}
jchar JNICALL CallStaticCharMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticCharMethodV(clazz, methodID, args);
}
jchar JNICALL CallStaticCharMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticCharMethodA(clazz, methodID, args);
}
jshort JNICALL CallStaticShortMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticShortMethod(clazz, methodID);
}
jshort JNICALL CallStaticShortMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticShortMethodV(clazz, methodID, args);
}
jshort JNICALL CallStaticShortMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticShortMethodA(clazz, methodID, args);
}
jint JNICALL CallStaticIntMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticIntMethod(clazz, methodID);
}
jint JNICALL CallStaticIntMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticIntMethodV(clazz, methodID, args);
}
jint JNICALL CallStaticIntMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticIntMethodA(clazz, methodID, args);
}
jlong JNICALL CallStaticLongMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticLongMethod(clazz, methodID);
}
jlong JNICALL CallStaticLongMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticLongMethodV(clazz, methodID, args);
}
jlong JNICALL CallStaticLongMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticLongMethodA(clazz, methodID, args);
}
jfloat JNICALL CallStaticFloatMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticFloatMethod(clazz, methodID);
}
jfloat JNICALL CallStaticFloatMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticFloatMethodV(clazz, methodID, args);
}
jfloat JNICALL CallStaticFloatMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticFloatMethodA(clazz, methodID, args);
}
jdouble JNICALL CallStaticDoubleMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticDoubleMethod(clazz, methodID);
}
jdouble JNICALL CallStaticDoubleMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticDoubleMethodV(clazz, methodID, args);
}
jdouble JNICALL CallStaticDoubleMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticDoubleMethodA(clazz, methodID, args);
}
void JNICALL CallStaticVoidMethod_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, ...)
{
	return env->CallStaticVoidMethod(clazz, methodID);
}
void JNICALL CallStaticVoidMethodV_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, va_list args)
{
	return env->CallStaticVoidMethodV(clazz, methodID, args);
}
void JNICALL CallStaticVoidMethodA_fake(JNIEnv* penv, jclass clazz, jmethodID methodID, const jvalue* args)
{
	return env->CallStaticVoidMethodA(clazz, methodID, args);
}
jfieldID JNICALL GetStaticFieldID_fake(JNIEnv* penv, jclass clazz, const char* name, const char* signature)
{
	return env->GetStaticFieldID(clazz, name, signature);
}
jobject JNICALL GetStaticObjectField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticObjectField(clazz, fieldID);
}
jboolean JNICALL GetStaticBooleanField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticBooleanField(clazz, fieldID);
}
jbyte JNICALL GetStaticByteField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticByteField(clazz, fieldID);
}
jchar JNICALL GetStaticCharField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticCharField(clazz, fieldID);
}
jshort JNICALL GetStaticShortField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticShortField(clazz, fieldID);
}
jint JNICALL GetStaticIntField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticIntField(clazz, fieldID);
}
jlong JNICALL GetStaticLongField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticLongField(clazz, fieldID);
}
jfloat JNICALL GetStaticFloatField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticFloatField(clazz, fieldID);
}
jdouble JNICALL GetStaticDoubleField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID)
{
	return env->GetStaticDoubleField(clazz, fieldID);
}
void JNICALL SetStaticObjectField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jobject val)
{
	return env->SetStaticObjectField(clazz, fieldID, val);
}
void JNICALL SetStaticBooleanField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jboolean val)
{
	return env->SetStaticBooleanField(clazz, fieldID, val);
}
void JNICALL SetStaticByteField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jbyte val)
{
	return env->SetStaticByteField(clazz, fieldID, val);
}
void JNICALL SetStaticCharField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jchar val)
{
	return env->SetStaticCharField(clazz, fieldID, val);
}
void JNICALL SetStaticShortField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jshort val)
{
	return env->SetStaticShortField(clazz, fieldID, val);
}
void JNICALL SetStaticIntField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jint val)
{
	return env->SetStaticIntField(clazz, fieldID, val);
}
void JNICALL SetStaticLongField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jlong val)
{
	return env->SetStaticLongField(clazz, fieldID, val);
}
void JNICALL SetStaticFloatField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jfloat val)
{
	return env->SetStaticFloatField(clazz, fieldID, val);
}
void JNICALL SetStaticDoubleField_fake(JNIEnv* penv, jclass clazz, jfieldID fieldID, jdouble val)
{
	return env->SetStaticDoubleField(clazz, fieldID, val);
}
jstring JNICALL NewString_fake(JNIEnv* penv, const jchar* buf, jsize size)
{
	return env->NewString(buf, size);
}
jsize JNICALL GetStringLength_fake(JNIEnv* penv, jstring buf)
{
	return env->GetStringLength(buf);
}
const jchar * JNICALL GetStringChars_fake(JNIEnv* penv, jstring buf, jboolean* isCopy)
{
	return env->GetStringChars(buf, isCopy);
}
void JNICALL ReleaseStringChars_fake(JNIEnv* penv, jstring buf, const jchar* buf1)
{
	return env->ReleaseStringChars(buf, buf1);
}
jstring JNICALL NewStringUTF_fake(JNIEnv* penv, const char* buf)
{
	return env->NewStringUTF(buf);
}
jsize JNICALL GetStringUTFLength_fake(JNIEnv* penv, jstring buf)
{
	return env->GetStringUTFLength(buf);
}
const char * JNICALL GetStringUTFChars_fake(JNIEnv* penv, jstring buf, jboolean* isCopy)
{
	return env->GetStringUTFChars(buf, isCopy);
}
void JNICALL ReleaseStringUTFChars_fake(JNIEnv* penv, jstring buf, const char* buf1)
{
	return env->ReleaseStringUTFChars(buf, buf1);
}
jsize JNICALL GetArrayLength_fake(JNIEnv* penv, jarray arr)
{
	return env->GetArrayLength(arr);
}
jobjectArray JNICALL NewObjectArray_fake(JNIEnv* penv, jsize size, jclass clazz, jobject obj)
{
	return env->NewObjectArray(size, clazz, obj);
}
jobject JNICALL GetObjectArrayElement_fake(JNIEnv* penv, jobjectArray objarr, jsize size)
{
	return env->GetObjectArrayElement(objarr, size);
}
void JNICALL SetObjectArrayElement_fake(JNIEnv* penv, jobjectArray objarr, jsize size, jobject obj)
{
	return env->SetObjectArrayElement(objarr, size, obj);
}
jbooleanArray JNICALL NewBooleanArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewBooleanArray(size);
}
jbyteArray JNICALL NewByteArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewByteArray(size);
}
jcharArray JNICALL NewCharArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewCharArray(size);
}
jshortArray JNICALL NewShortArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewShortArray(size);
}
jintArray JNICALL NewIntArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewIntArray(size);
}
jlongArray JNICALL NewLongArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewLongArray(size);
}
jfloatArray JNICALL NewFloatArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewFloatArray(size);
}
jdoubleArray JNICALL NewDoubleArray_fake(JNIEnv* penv, jsize size)
{
	return env->NewDoubleArray(size);
}
jboolean* JNICALL GetBooleanArrayElements_fake(JNIEnv* penv, jbooleanArray arr, jboolean* isCopy)
{
	return env->GetBooleanArrayElements(arr, isCopy);
}
jbyte* JNICALL GetByteArrayElements_fake(JNIEnv* penv, jbyteArray arr, jboolean* isCopy)
{
	return env->GetByteArrayElements(arr, isCopy);
}
jchar* JNICALL GetCharArrayElements_fake(JNIEnv* penv, jcharArray arr, jboolean* isCopy)
{
	return env->GetCharArrayElements(arr, isCopy);
}
jshort* JNICALL GetShortArrayElements_fake(JNIEnv* penv, jshortArray arr, jboolean* isCopy)
{
	return env->GetShortArrayElements(arr, isCopy);
}
jint* JNICALL GetIntArrayElements_fake(JNIEnv* penv, jintArray arr, jboolean* isCopy)
{
	return env->GetIntArrayElements(arr, isCopy);
}
jlong* JNICALL GetLongArrayElements_fake(JNIEnv* penv, jlongArray arr, jboolean* isCopy)
{
	return env->GetLongArrayElements(arr, isCopy);
}
jfloat* JNICALL GetFloatArrayElements_fake(JNIEnv* penv, jfloatArray arr, jboolean* isCopy)
{
	return env->GetFloatArrayElements(arr, isCopy);
}
jdouble* JNICALL GetDoubleArrayElements_fake(JNIEnv* penv, jdoubleArray arr, jboolean* isCopy)
{
	return env->GetDoubleArrayElements(arr, isCopy);
}
void JNICALL ReleaseBooleanArrayElements_fake(JNIEnv* penv, jbooleanArray arr, jboolean* isCopy, jint mode)
{
	return env->ReleaseBooleanArrayElements(arr, isCopy, mode);
}
void JNICALL ReleaseByteArrayElements_fake(JNIEnv* penv, jbyteArray arr, jbyte* elems, jint mode)
{
	return env->ReleaseByteArrayElements(arr, elems, mode);
}
void JNICALL ReleaseCharArrayElements_fake(JNIEnv* penv, jcharArray arr, jchar* elems, jint mode)
{
	return env->ReleaseCharArrayElements(arr, elems, mode);
}
void JNICALL ReleaseShortArrayElements_fake(JNIEnv* penv, jshortArray arr, jshort* elems, jint mode)
{
	return env->ReleaseShortArrayElements(arr, elems, mode);
}
void JNICALL ReleaseIntArrayElements_fake(JNIEnv* penv, jintArray arr, jint* elems, jint mode)
{
	return env->ReleaseIntArrayElements(arr, elems, mode);
}
void JNICALL ReleaseLongArrayElements_fake(JNIEnv* penv, jlongArray arr, jlong* elems, jint mode)
{
	return env->ReleaseLongArrayElements(arr, elems, mode);
}
void JNICALL ReleaseFloatArrayElements_fake(JNIEnv* penv, jfloatArray arr, jfloat* elems, jint mode)
{
	return env->ReleaseFloatArrayElements(arr, elems, mode);
}
void JNICALL ReleaseDoubleArrayElements_fake(JNIEnv* penv, jdoubleArray arr, jdouble* elems, jint mode)
{
	return env->ReleaseDoubleArrayElements(arr, elems, mode);
}
void JNICALL GetBooleanArrayRegion_fake(JNIEnv* penv, jbooleanArray arr, jsize start, jsize len, jboolean* buf)
{
	return env->GetBooleanArrayRegion(arr, start, len, buf);
}
void JNICALL GetByteArrayRegion_fake(JNIEnv* penv, jbyteArray arr, jsize start, jsize len, jbyte* buf)
{
	return env->GetByteArrayRegion(arr, start, len, buf);
}
void JNICALL GetCharArrayRegion_fake(JNIEnv* penv, jcharArray arr, jsize start, jsize len, jchar* buf)
{
	return env->GetCharArrayRegion(arr, start, len, buf);
}
void JNICALL GetShortArrayRegion_fake(JNIEnv* penv, jshortArray arr, jsize start, jsize len, jshort* buf)
{
	return env->GetShortArrayRegion(arr, start, len, buf);
}
void JNICALL GetIntArrayRegion_fake(JNIEnv* penv, jintArray arr, jsize start, jsize len, jint* buf)
{
	return env->GetIntArrayRegion(arr, start, len, buf);
}
void JNICALL GetLongArrayRegion_fake(JNIEnv* penv, jlongArray arr, jsize start, jsize len, jlong* buf)
{
	return env->GetLongArrayRegion(arr, start, len, buf);
}
void JNICALL GetFloatArrayRegion_fake(JNIEnv* penv, jfloatArray arr, jsize start, jsize len, jfloat* buf)
{
	return env->GetFloatArrayRegion(arr, start, len, buf);
}
void JNICALL GetDoubleArrayRegion_fake(JNIEnv* penv, jdoubleArray arr, jsize start, jsize len, jdouble* buf)
{
	return env->GetDoubleArrayRegion(arr, start, len, buf);
}
void JNICALL SetBooleanArrayRegion_fake(JNIEnv* penv, jbooleanArray arr, jsize start, jsize len, const jboolean* buf)
{
	return env->SetBooleanArrayRegion(arr, start, len, buf);
}
void JNICALL SetByteArrayRegion_fake(JNIEnv* penv, jbyteArray arr, jsize start, jsize len, const jbyte* buf)
{
	return env->SetByteArrayRegion(arr, start, len, buf);
}
void JNICALL SetCharArrayRegion_fake(JNIEnv* penv, jcharArray arr, jsize start, jsize len, const jchar* buf)
{
	return env->SetCharArrayRegion(arr,start, len, buf);
}
void JNICALL SetShortArrayRegion_fake(JNIEnv* penv, jshortArray arr, jsize start, jsize len, const jshort* buf)
{
	return env->SetShortArrayRegion(arr,start, len, buf);
}
void JNICALL SetIntArrayRegion_fake(JNIEnv* penv, jintArray arr, jsize start, jsize len, const jint* buf)
{
	return env->SetIntArrayRegion(arr,start, len, buf);
}
void JNICALL SetLongArrayRegion_fake(JNIEnv* penv, jlongArray arr, jsize start, jsize len, const jlong* buf)
{
	return env->SetLongArrayRegion(arr,start, len, buf);
}
void JNICALL SetFloatArrayRegion_fake(JNIEnv* penv, jfloatArray arr, jsize start, jsize len, const jfloat* buf)
{
	return env->SetFloatArrayRegion(arr,start, len, buf);
}
void JNICALL SetDoubleArrayRegion_fake(JNIEnv* penv, jdoubleArray arr, jsize start, jsize len, const jdouble* buf)
{
	return env->SetDoubleArrayRegion(arr,start, len, buf);
}
jint JNICALL UnregisterNatives_fake(JNIEnv* penv, jclass clazz)
{
	return env->UnregisterNatives(clazz);
}
jint JNICALL MonitorEnter_fake(JNIEnv* penv, jobject obj)
{
	return env->MonitorEnter(obj);
}
jint JNICALL MonitorExit_fake(JNIEnv* penv, jobject obj)
{
	return env->MonitorExit(obj);
}
jint JNICALL GetJavaVM_fake(JNIEnv* penv, JavaVM **jvm)
{
	return env->GetJavaVM(jvm);
}
void JNICALL GetStringRegion_fake(JNIEnv* penv, jstring str, jsize start, jsize len, jchar* buf)
{
	return env->GetStringRegion(str, start, len, buf);
}
void JNICALL GetStringUTFRegion_fake(JNIEnv* penv, jstring str, jsize start, jsize len, char* buf)
{
	return env->GetStringUTFRegion(str, start, len, buf);
}
void* JNICALL GetPrimitiveArrayCritical_fake(JNIEnv* penv, jarray arr, jboolean* isCopy)
{
	return env->GetPrimitiveArrayCritical(arr, isCopy);
}
void JNICALL ReleasePrimitiveArrayCritical_fake(JNIEnv* penv, jarray arr, void* carray, jint mode)
{
	return env->ReleasePrimitiveArrayCritical(arr, carray, mode);
}
const jchar * JNICALL GetStringCritical_fake(JNIEnv* penv, jstring buf, jboolean* isCopy)
{
	return env->GetStringCritical(buf, isCopy);
}
void JNICALL ReleaseStringCritical_fake(JNIEnv* penv, jstring buf, const jchar* buf1)
{
	return env->ReleaseStringCritical(buf, buf1);
}
jweak JNICALL NewWeakGlobalRef_fake(JNIEnv* penv, jobject obj)
{
	return env->NewWeakGlobalRef(obj);
}
void JNICALL DeleteWeakGlobalRef_fake(JNIEnv* penv, jweak ref)
{
	return env->DeleteWeakGlobalRef(ref);
}
jboolean JNICALL ExceptionCheck_fake(JNIEnv* penv)
{
	return env->ExceptionCheck();
}
jobject JNICALL NewDirectByteBuffer_fake(JNIEnv* penv, void* addr, jlong capacity)
{
	return env->NewDirectByteBuffer(addr, capacity);
}
void* JNICALL GetDirectBufferAddress_fake(JNIEnv* penv, jobject obj)
{
	return env->GetDirectBufferAddress(obj);
}
jlong JNICALL GetDirectBufferCapacity_fake(JNIEnv* penv, jobject obj)
{
	return env->GetDirectBufferCapacity(obj);
}
jobjectRefType JNICALL GetObjectRefType_fake(JNIEnv* penv, jobject obj)
{
		return env->GetObjectRefType(obj);
}
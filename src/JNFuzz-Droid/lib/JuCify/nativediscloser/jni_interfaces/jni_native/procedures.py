import logging
import archinfo
from ..common import JNIProcedureBase as JPB
from ..common import JNIEnvMissingError
from ..record import Record


logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)

class NewStringUTF(JPB):
    def run(self, buff):
        ret_symb = self.state.solver.BVS('jstring_from_buff', self.arch.bits)
        return ret_symb

class GetStringUTFChars(JPB):
    def run(self, string, pIsCopy):
        ret_symb = self.state.solver.BVS('buff_from_%s' % str(string), self.arch.bits)
        return ret_symb

class ReleaseStringUTFChars(JPB):
    def run(self, string, pUtfChars):
        return

class GetArrayLength(JPB):
    def run(self, array):
        ret_symb = self.state.solver.BVS('length_of_%s' % str(array), self.arch.bits)
        return ret_symb

# ReleaseByteArrayElements

class GetArrayElements(JPB):
    def run(self, array, pIsCopy):
        ret_symb = self.state.solver.BVS('elements_of_%s' % str(array), self.arch.bits)
        return ret_symb

class GetBooleanArrayElements(GetArrayElements):
    pass

class GetByteArrayElements(GetArrayElements):
    pass

class GetCharArrayElements(GetArrayElements):
    pass

class GetShortArrayElements(GetArrayElements):
    pass

class GetIntArrayElements(GetArrayElements):
    pass

class GetLongArrayElements(GetArrayElements):
    pass

class GetFloatArrayElements(GetArrayElements):
    pass

class GetDoubleArrayElements(GetArrayElements):
    pass

class GetClass(JPB):
    def run(self, env_ptr, cls_name_ptr):
        cls_name = self.load_string_from_memory(cls_name_ptr)
        return self.create_java_class(cls_name.replace('/', '.'))


class DefineClass(GetClass):
    pass


class FindClass(GetClass):
    pass


class NewRef(JPB):
    def run(self, env_ptr, obj_ptr):
        return obj_ptr


class NewGlobalRef(NewRef):
    pass


class NewLocalRef(NewRef):
    pass


class AllocObject(NewRef):
    pass


class NewObject(NewRef):
    pass


class NewObjectV(NewRef):
    pass


class NewObjectA(NewRef):
    pass

class GetField(JPB):
    def is_static(self):
        return False
    def run(self, env, obj, field_ptr):
        record = self.get_current_record()
        field = self.get_ref(field_ptr)
        if field is None:
            logger.warning(f"Field not parsed during JNI GetField function. Event can't be correctly generated.")
            (_, output_symbol) = self.get_object_field(obj, "fid#%s" % field_ptr)
            return output_symbol
        else:
            output_symbol = None
            cls = self.get_ref(obj)
            if not self.is_static():
                (_, output_symbol) = self.get_object_field(obj, field.name)
                if cls is None:
                    logger.warning(f"Class not parsed during JNI GetField function. Event can't be correctly generated.")
                    return output_symbol
            else:
                if cls is None:
                    logger.warning(f"Class not parsed during JNI GetField function. Event can't be correctly generated.")
                    (_, output_symbol) = self.get_class_field("not_parsed", field.name)
                    return output_symbol
                else:
                    (_, output_symbol) = self.get_class_field(cls.name, field.name)

            record.add_get_field(self.is_static(), obj, cls.name, field.name, self.state.cond_hist)
            return output_symbol

class GetStaticField(GetField):
    def is_static(self):
        return True
        
class GetObjectField(GetField):
    pass

class GetStaticObjectField(GetStaticField):
    pass

class GetBooleanField(GetField):
    pass

class GetStaticBooleanField(GetStaticField):
    pass

class GetByteField(GetField):
    pass

class GetStaticByteField(GetStaticField):
    pass

class GetCharField(GetField):
    pass

class GetStaticCharField(GetStaticField):
    pass

class GetShortField(GetField):
    pass

class GetStaticShortField(GetStaticField):
    pass

class GetIntField(GetField):
    pass

class GetStaticIntField(GetStaticField):
    pass

class GetLongField(GetField):
    pass

class GetStaticLongField(GetStaticField):
    pass

class GetFloatField(GetField):
    pass

class GetStaticFloatField(GetStaticField):
    pass

class GetDoubleField(GetField):
    pass

class GetStaticDoubleField(GetStaticField):
    pass

class SetField(JPB):
    def is_static(self):
        return False
    def run(self, env, obj, field_ptr, value):
        record = self.get_current_record()
        field = self.get_ref(field_ptr)
        if field is None:
            logger.warning(f"Field not parsed during JNI SetField function. Event can't be correctly generated.")
            self.set_object_field(obj, "fid#%s" % field_ptr, value)
        else:
            cls = self.get_ref(obj)
            if not self.is_static():
                obj_ptr_or_classname = obj
                self.set_object_field(obj, field.name, value)
                if cls is None:
                    logger.warning(f"Class not parsed during JNI SetField function. Event can't be correctly generated.")
                    return
            else:
                if cls is None:
                    logger.warning(f"Class not parsed during JNI SetField function. Event can't be correctly generated.")
                    self.set_class_field("not_parsed", field.name, value)
                    return
                self.set_class_field(cls.name, field.name, value)
                
            record.add_set_field(self.is_static(), obj, cls.name, field.name, value, self.state.cond_hist)


class SetStaticField(SetField):
    def is_static(self):
        return True

class SetObjectField(SetField):
    pass

class SetStaticObjectField(SetStaticField):
    pass

class SetBooleanField(SetField):
    pass

class SetStaticBooleanField(SetStaticField):
    pass

class SetByteField(SetField):
    pass

class SetStaticByteField(SetStaticField):
    pass

class SetCharField(SetField):
    pass

class SetStaticCharField(SetStaticField):
    pass

class SetShortField(SetField):
    pass

class SetStaticShortField(SetStaticField):
    pass

class SetIntField(SetField):
    pass

class SetStaticIntField(SetStaticField):
    pass

class SetLongField(SetField):
    pass

class SetStaticLongField(SetStaticField):
    pass

class SetFloatField(SetField):
    pass

class SetStaticFloatField(SetStaticField):
    pass

class SetDoubleField(SetField):
    pass

class SetStaticDoubleField(SetStaticField):
    pass

class GetObjectClass(JPB):
    def run(self, env, obj_ptr):
        obj = self.get_ref(obj_ptr)
        if obj is None:
            logger.warning(f"Object not parsed during JNI GetObjectClass function.")
            desc = 'jclass obtained via "GetObjectClass" and cannot be parsed'
            return self.create_java_class(None, desc=desc)
        else:
            return obj_ptr


class GetMethodBase(JPB):
    def run(self, env, cls_ptr, method_name_ptr, sig_ptr):
        cls = self.get_ref(cls_ptr)
        method_name = self.load_string_from_memory(method_name_ptr)
        signature = self.load_string_from_memory(sig_ptr)
        return self.create_java_method_ID(cls, method_name,
                signature, self.is_static())

    def is_static(self):
        raise NotImplementedError('"is_static" need to be implemented!')


class GetStaticMethodID(GetMethodBase):
    def is_static(self):
        return True


class GetMethodID(GetMethodBase):
    def is_static(self):
        return False


class GetFieldID(JPB):
    def run(self, env_ptr, cls_ptr, field_name_ptr, sig_ptr):
        cls = self.get_ref(cls_ptr)
        name = self.load_string_from_memory(field_name_ptr)
        signature = self.load_string_from_memory(sig_ptr)
        return self.create_java_field_ID(cls, name, signature)


class GetStaticFieldID(GetFieldID):
    pass


class CallMethodBase(JPB):
    def run(self, env, _, method_ptr):
        logger.debug(f'{self.__class__.__name__} SimP at {hex(self.state.addr)} is invoked')
        method = self.get_ref(method_ptr)
        record = self.get_current_record()
        return_value = self.get_return_value(method)
        # record could be None when CallMethod function called in JNI_OnLoad
        if record is not None:
            if method is None:
                logger.warning(f'{self.__class__} received method pointer:' +\
                        f'{method_ptr} without corresponding method instance')
            else:
                cur_func = self.get_cur_func()
                record.add_invokee(method, cur_func, self.get_arguments_symbols(method.signature), return_value, self.state.cond_hist)
        if return_value != None:
            return return_value

    def get_cur_func(self):
        cur_func = None
        func_stack = self.state.globals.get('func_stack')
        if len(func_stack) > 0:
            cur_func = func_stack[-1]
        return cur_func

    def get_arguments_symbols(self, signature):
        if not signature.startswith('('):
            return
        if ')' not in signature:
            return
        args_signature = signature[1:].split(')')[0]
        sig_idx = 0
        i = 0
        args_symbs = []
        while sig_idx < len(args_signature):
            if args_signature[sig_idx] in ['Z','B','C','S','I','J','F','D']:
                args_symbs.append(self.get_argument_value(i))
                i += 1
                sig_idx += 1
            elif args_signature[sig_idx] == '[':
                sig_idx += 1
                if args_signature[sig_idx] in ['Z','B','C','S','I','J','F','D']:
                    args_symbs.append(self.get_argument_value(i))
                    i += 1
                    sig_idx += 1
                else:
                    raise ValueError('Wrong method signature format: "%s"' % args_signature)
            elif args_signature[sig_idx] == 'L':
                sig_idx += 1
                while args_signature[sig_idx] != ';':
                    if sig_idx == len(args_signature):
                        raise ValueError('Wrong method signature format: "%s"' % args_signature)
                    sig_idx += 1
                sig_idx += 1
                args_symbs.append(self.get_argument_value(i))
                i += 1
            else:
                raise ValueError('Wrong method signature format: "%s"' % args_signature)
        args_symbs.insert(0, self.get_argument_value(-2)) # Add value for potential caller object
        return args_symbs

    def get_argument_value(self, arg_index):
        raise NotImplementedError('Extending CallMethodBase without implement get_argument_value!')

    def get_return_value(self, method):
        raise NotImplementedError('Extending CallMethodBase without implement get_return_value!')

# getArgumentsSymbols implementation:
# - CallMethodParamArg: parameters are passed using the Call*Method parameters
# - CallMethodArrayArg: parameters are passed using an array
# - CallMethodVaArg: parameters are passed through a va_list

class CallMethodParamArg(CallMethodBase):
    def get_argument_value(self, arg_index):
        return self.arg(3+arg_index)

class CallMethodArrayArg(CallMethodBase):
    def get_argument_value(self, arg_index):
        raise NotImplementedError('TODO: implement get_argument_value for CallMethodArrayArg!')

class CallMethodVaArg(CallMethodBase):
    def get_argument_value(self, arg_index):
        return self.state.memory.load(self.arg(3)+4*arg_index, 4, endness=self.arch.memory_endness)

    # According to Android's "jni.h" source code, invocation of "Call...Method"
    # will always lead to the invocation of the corresponding "Call...MethodV"
    # and normally programmers do not directly invoke "Call...MethodV".
    # So to skip the wrapper invocation (i.e., invocation of "Call...Method")
    # in order to simplify the Callgraph, we try to return the caller's caller
    # from the "func_stack" in the method.
    def get_cur_func(self):
        cur_func = None
        func_stack = self.state.globals.get('func_stack')
        if len(func_stack) > 1:
            cur_func = func_stack[-2]
        elif len(func_stack) > 0:
            cur_func = func_stack[-1]
        return cur_func

# getArgumentsSymbols implementation:
# - CallReturnPrimaryMethod: returns a primary value
# - CallReturnVoidMethod: doesn't not return a value
# - CallReturnObjectMethod: returns an object


class CallReturnPrimaryMethod(CallMethodBase):
    def get_return_value(self, method):
        return self.state.solver.BVS('primary_value', self.arch.bits)

class CallReturnVoidMethod(CallMethodBase):
    def get_return_value(self, method):
        return None

class CallReturnObjectMethod(CallMethodBase):
    def get_return_value(self, method):
        # for complex code structure, method may not be able to parse.
        if method is None:
            return None
        rtype = method.get_return_type().strip('L;').replace('/', '.')
        return self.create_java_class(rtype, init=True, desc="return_value")

# Actual Call*Method* SimProcedure

class CallBooleanMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass

class CallBooleanMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallBooleanMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallByteMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallByteMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallByteMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallCharMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallCharMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallCharMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallShortMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallShortMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallShortMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallIntMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallIntMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallIntMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallLongMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallLongMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallLongMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallFloatMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallFloatMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallFloatMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallDoubleMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallDoubleMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallDoubleMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticBooleanMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticBooleanMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticBooleanMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticByteMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticByteMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticByteMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticCharMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticCharMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticCharMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticShortMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticShortMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticShortMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticIntMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticIntMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticIntMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticLongMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticLongMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticLongMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticFloatMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticFloatMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticFloatMethodA(CallReturnPrimaryMethod, CallMethodArrayArg):
    pass


class CallStaticDoubleMethod(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallStaticDoubleMethodV(CallReturnPrimaryMethod, CallMethodVaArg):
    pass


class CallStaticDoubleMethodA(CallReturnPrimaryMethod, CallMethodParamArg):
    pass


class CallVoidMethod(CallReturnVoidMethod, CallMethodParamArg):
    pass

class CallVoidMethodV(CallReturnVoidMethod, CallMethodVaArg):
    pass


class CallVoidMethodA(CallReturnVoidMethod, CallMethodArrayArg):
    pass


class CallStaticVoidMethod(CallReturnVoidMethod, CallMethodParamArg):
    pass


class CallStaticVoidMethodV(CallReturnVoidMethod, CallMethodVaArg):
    pass


class CallStaticVoidMethodA(CallReturnVoidMethod, CallMethodArrayArg):
    pass



class CallObjectMethod(CallReturnObjectMethod, CallMethodParamArg):
    pass

class CallObjectMethodV(CallReturnObjectMethod, CallMethodVaArg):
    pass


class CallObjectMethodA(CallReturnObjectMethod, CallMethodArrayArg):
    pass


class CallStaticObjectMethod(CallReturnObjectMethod, CallMethodParamArg):
    pass


class CallStaticObjectMethodV(CallReturnObjectMethod, CallMethodVaArg):
    pass


class CallStaticObjectMethodA(CallReturnObjectMethod, CallMethodArrayArg):
    pass


class NewObjectArray(JPB):
    def run(self, env_ptr, size, cls_ptr, obj_ptr):
        # simply use the one of the element
        return obj_ptr


class GetObjectArrayElement(JPB):
    def run(self, env_ptr, array_ptr, index):
        # As we simplied, the array is the element
        return array_ptr


class SetObjectArrayElement(JPB):
    def run(self, env_ptr, array_ptr, index, elememt_ptr):
        # to simplify, nothing need to be done.
        pass


class RegisterNatives(JPB):
    def run(self, env, cls_ptr, methods, method_num):
        # Exceptions could happen deal to unknown reasons (e.g., value passing
        # via customized structures). Use exception catching to avoid the program
        # from crashing.
        try:
            cls_name = self.get_ref(cls_ptr).name
            num = self.state.solver.eval(method_num)
            methods_ptr = self.state.solver.eval(methods)
            for i in range(num):
                ptr = methods_ptr + i * 3 * self.arch.bits // 8
                method = self.state.mem[ptr].struct.JNINativeMethod
                name = method.name.deref.string.concrete
                signature = method.signature.deref.string.concrete
                fn_ptr = method.fnPtr.long.concrete
                symbol = self.func_ptr_2_symbol_name(fn_ptr)
                c, m, s, static, obfuscated = self._dex_heuristic(cls_name,
                        name.decode('utf-8', 'ignore'),
                        signature.decode('utf-8', 'ignore'))
                Record(c, m, s, fn_ptr, symbol, static, obfuscated)
        except Exception as e:
            logger.warning(f'Parsing "RegisterNatives" failed with error: {e}')
        return self.JNI_OK

    def func_ptr_2_symbol_name(self, func_ptr):
        name = None
        for s in self.state.project.loader.symbols:
            if s.rebased_addr == func_ptr:
                name = s.name
        return name

    def _dex_heuristic(self, cls_name, method_name, signature):
        """Use the heuristic way to get more information about the JNI function
        and try to deobfucate by checking with cooresponding method in Dex.
        """
        # is the native method is a static method
        is_static_method = None
        obfuscated = False
        dex = self.state.globals.get('dex')
        if dex is None:
            obfuscated = None
        else:
            ms = list(dex.find_methods(f'L{cls_name};', method_name))
            if len(ms) == 0:
                # cls or/and method name are obfuscated situation
                obfuscated = True
                cs = list(dex.find_classes(f'L{cls_name};'))
                ms = list(dex.find_methods(methodname=method_name))
                if len(cs) == 0 and len(ms) == 0:
                    # all obfuscated, nothing can be improved.
                    pass
                elif len(cs) == 0:
                    # class name obfuscated
                    if len(ms) == 1:
                        cls_name = ms[0].get_method().get_class_name()
                        signature = ms[0].descriptor
                        if 'static' in ms[0].access:
                            is_static_method = True
                        else:
                            is_static_method = False
                    else:
                        # more than one method found base on method name
                        classes = set()
                        sigs = set()
                        static_count = 0
                        for m in ms:
                            classes.add(m.get_method().get_class_name())
                            sigs.add(m.descriptor)
                            if 'static' in m.access:
                                static_count += 1
                        if len(classes) == 1:
                            # all in one class, so we can sure the class name
                            cls_name, = classes
                        if len(sigs) == 1:
                            # all have same signature, so we can sure the signature
                            signature, = sigs
                        if static_count == 0:
                            is_static_method = False
                        elif static_count == len(ms):
                            is_static_method = True
                else:
                    # method name obfuscated
                    pass
            elif len(ms) == 1:
                if signature != ms[0].descriptor:
                    obfuscated = True
                    signature = ms[0].descriptor
                if 'static' in ms[0].access:
                    is_static_method = True
                else:
                    is_static_method = False
            else:
                # method overload situation
                found = False
                static_count = 0
                for m in ms:
                    if m.descriptor == signature:
                        found = True
                        break
                    if 'static' in m.access:
                        static_count += 1
                if found:
                    if 'static' in m.access:
                        is_static_method = True
                    else:
                        is_static_method = False
                else:
                    # Since signature is obfuscated and we are not sure the exact one
                    # So the obfuscated signature will be returned.
                    obfuscated = True
                    if static_count == 0:
                        # since no method is static so we can sure
                        is_static_method = False
                    elif static_count == len(ms):
                        # since all methods are static so we can sure
                        is_static_method = True
        cls_name = cls_name.strip('L;').replace('/', '.')
        return cls_name, method_name, signature, is_static_method, obfuscated




.class public Lorg/arguslab/native_leak/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "leak"

    .line 22
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private leakImei()V
    .locals 2

    const-string v0, "phone"

    .line 38
    invoke-virtual {p0, v0}, Lorg/arguslab/native_leak/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    const-string v1, "android.permission.READ_PHONE_STATE"

    .line 39
    invoke-virtual {p0, v1}, Lorg/arguslab/native_leak/MainActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_0

    return-void

    .line 42
    :cond_0
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object p0

    .line 43
    invoke-static {p0}, Lorg/arguslab/native_leak/MainActivity;->send(Ljava/lang/String;)V

    return-void
.end method

.method public static native send(Ljava/lang/String;)V
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 29
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/high16 p1, 0x7f040000

    .line 30
    invoke-virtual {p0, p1}, Lorg/arguslab/native_leak/MainActivity;->setContentView(I)V

    const-string p1, "android.permission.READ_PHONE_STATE"

    .line 32
    invoke-virtual {p0, p1}, Lorg/arguslab/native_leak/MainActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "android.permission.READ_PHONE_STATE"

    .line 33
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/arguslab/native_leak/MainActivity;->requestPermissions([Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    const/4 p2, 0x1

    if-eq p1, p2, :cond_0

    return-void

    .line 50
    :cond_0
    invoke-direct {p0}, Lorg/arguslab/native_leak/MainActivity;->leakImei()V

    return-void
.end method

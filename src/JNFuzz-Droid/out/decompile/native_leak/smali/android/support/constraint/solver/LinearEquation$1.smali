.class synthetic Landroid/support/constraint/solver/LinearEquation$1;
.super Ljava/lang/Object;
.source "LinearEquation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/solver/LinearEquation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 818
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation$Type;->values()[Landroid/support/constraint/solver/LinearEquation$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Landroid/support/constraint/solver/LinearEquation$1;->$SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I

    :try_start_0
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$1;->$SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    invoke-virtual {v1}, Landroid/support/constraint/solver/LinearEquation$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$1;->$SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->LOWER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    invoke-virtual {v1}, Landroid/support/constraint/solver/LinearEquation$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$1;->$SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->GREATER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    invoke-virtual {v1}, Landroid/support/constraint/solver/LinearEquation$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method

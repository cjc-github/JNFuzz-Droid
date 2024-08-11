.class Landroid/support/constraint/solver/LinkedVariables$Link;
.super Ljava/lang/Object;
.source "LinkedVariables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/solver/LinkedVariables;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Link"
.end annotation


# instance fields
.field next:Landroid/support/constraint/solver/LinkedVariables$Link;

.field value:F

.field variable:Landroid/support/constraint/solver/SolverVariable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    sget p0, Landroid/support/constraint/solver/LinkedVariables;->sCreation:I

    add-int/lit8 p0, p0, 0x1

    sput p0, Landroid/support/constraint/solver/LinkedVariables;->sCreation:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

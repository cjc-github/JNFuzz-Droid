.class Landroid/support/constraint/solver/EquationVariable;
.super Ljava/lang/Object;
.source "EquationVariable.java"


# instance fields
.field private mAmount:Landroid/support/constraint/solver/Amount;

.field private mVariable:Landroid/support/constraint/solver/SolverVariable;


# direct methods
.method public constructor <init>(Landroid/support/constraint/solver/Amount;)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 43
    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/Amount;Landroid/support/constraint/solver/EquationVariable;)V
    .locals 1

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 84
    new-instance v0, Landroid/support/constraint/solver/Amount;

    invoke-direct {v0, p1}, Landroid/support/constraint/solver/Amount;-><init>(Landroid/support/constraint/solver/Amount;)V

    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 85
    iget-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    iget-object v0, p2, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p1, v0}, Landroid/support/constraint/solver/Amount;->multiply(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    .line 86
    invoke-virtual {p2}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/EquationVariable;)V
    .locals 2

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 94
    new-instance v0, Landroid/support/constraint/solver/Amount;

    iget-object v1, p1, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-direct {v0, v1}, Landroid/support/constraint/solver/Amount;-><init>(Landroid/support/constraint/solver/Amount;)V

    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 95
    invoke-virtual {p1}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearSystem;I)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 64
    new-instance p1, Landroid/support/constraint/solver/Amount;

    invoke-direct {p1, p2}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V
    .locals 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 54
    new-instance v0, Landroid/support/constraint/solver/Amount;

    invoke-direct {v0, p2}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 55
    invoke-virtual {p1, p3, p4}, Landroid/support/constraint/solver/LinearSystem;->getVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/Amount;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 34
    iput-object p2, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 35
    invoke-virtual {p1, p3, p4}, Landroid/support/constraint/solver/LinearSystem;->getVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearSystem;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V
    .locals 2

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 25
    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 74
    new-instance v0, Landroid/support/constraint/solver/Amount;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    iput-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    .line 75
    invoke-virtual {p1, p2, p3}, Landroid/support/constraint/solver/LinearSystem;->getVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-void
.end method


# virtual methods
.method public add(Landroid/support/constraint/solver/EquationVariable;)V
    .locals 1

    .line 180
    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/EquationVariable;->isCompatible(Landroid/support/constraint/solver/EquationVariable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    iget-object p1, p1, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/Amount;->add(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    :cond_0
    return-void
.end method

.method public divide(Landroid/support/constraint/solver/EquationVariable;)V
    .locals 0

    .line 216
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    iget-object p1, p1, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/Amount;->divide(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    return-void
.end method

.method public getAmount()Landroid/support/constraint/solver/Amount;
    .locals 0

    .line 141
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 106
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p0}, Landroid/support/constraint/solver/SolverVariable;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSolverVariable()Landroid/support/constraint/solver/SolverVariable;
    .locals 0

    .line 125
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    return-object p0
.end method

.method public getType()Landroid/support/constraint/solver/SolverVariable$Type;
    .locals 1

    .line 114
    iget-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_0

    .line 115
    sget-object p0, Landroid/support/constraint/solver/SolverVariable$Type;->CONSTANT:Landroid/support/constraint/solver/SolverVariable$Type;

    return-object p0

    .line 117
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object p0, p0, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    return-object p0
.end method

.method public inverse()Landroid/support/constraint/solver/EquationVariable;
    .locals 1

    .line 157
    iget-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {v0}, Landroid/support/constraint/solver/Amount;->inverse()Landroid/support/constraint/solver/Amount;

    return-object p0
.end method

.method public isCompatible(Landroid/support/constraint/solver/EquationVariable;)Z
    .locals 2

    .line 167
    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {p1}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result p0

    return p0

    .line 169
    :cond_0
    invoke-virtual {p1}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    return v1

    .line 172
    :cond_1
    invoke-virtual {p1}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p0

    if-ne p1, p0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public isConstant()Z
    .locals 0

    .line 133
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public multiply(Landroid/support/constraint/solver/Amount;)V
    .locals 0

    .line 208
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/Amount;->multiply(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    return-void
.end method

.method public multiply(Landroid/support/constraint/solver/EquationVariable;)V
    .locals 0

    .line 200
    invoke-virtual {p1}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/EquationVariable;->multiply(Landroid/support/constraint/solver/Amount;)V

    return-void
.end method

.method public setAmount(Landroid/support/constraint/solver/Amount;)V
    .locals 0

    .line 149
    iput-object p1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    return-void
.end method

.method public signString()Ljava/lang/String;
    .locals 0

    .line 238
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p0}, Landroid/support/constraint/solver/Amount;->isPositive()Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "+"

    return-object p0

    :cond_0
    const-string p0, "-"

    return-object p0
.end method

.method public substract(Landroid/support/constraint/solver/EquationVariable;)V
    .locals 1

    .line 190
    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/EquationVariable;->isCompatible(Landroid/support/constraint/solver/EquationVariable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    iget-object p1, p1, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/Amount;->substract(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 224
    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 227
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {v0}, Landroid/support/constraint/solver/Amount;->isOne()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {v0}, Landroid/support/constraint/solver/Amount;->isMinusOne()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 230
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/constraint/solver/EquationVariable;->mAmount:Landroid/support/constraint/solver/Amount;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 228
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/EquationVariable;->mVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.class Landroid/support/constraint/solver/Amount;
.super Ljava/lang/Object;
.source "Amount.java"


# instance fields
.field private mDenominator:I

.field private mNumerator:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v0, 0x1

    .line 24
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 42
    iput p1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 43
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v0, 0x1

    .line 24
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 32
    iput p1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 33
    iput p2, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 34
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/Amount;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 23
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v0, 0x1

    .line 24
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 47
    iget v0, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 48
    iget p1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iput p1, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 49
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-void
.end method

.method private static gcd(II)I
    .locals 3

    if-gez p0, :cond_0

    mul-int/lit8 p0, p0, -0x1

    :cond_0
    if-gez p1, :cond_1

    mul-int/lit8 p1, p1, -0x1

    :cond_1
    if-nez p0, :cond_2

    return p1

    :cond_2
    if-nez p1, :cond_3

    return p0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    or-int v1, p0, p1

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_4

    shr-int/lit8 p0, p0, 0x1

    shr-int/lit8 p1, p1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    :goto_1
    and-int/lit8 v1, p0, 0x1

    if-nez v1, :cond_5

    shr-int/lit8 p0, p0, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    and-int/lit8 v1, p1, 0x1

    if-nez v1, :cond_6

    shr-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_6
    if-le p0, p1, :cond_7

    goto :goto_3

    :cond_7
    move v2, p1

    move p1, p0

    move p0, v2

    :goto_3
    sub-int/2addr p0, p1

    if-nez p0, :cond_8

    shl-int p0, p1, v0

    return p0

    :cond_8
    move v2, p1

    move p1, p0

    move p0, v2

    goto :goto_2
.end method

.method private simplify()V
    .locals 2

    .line 190
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-gez v0, :cond_0

    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-gez v0, :cond_0

    .line 191
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 192
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    goto :goto_0

    .line 193
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-ltz v0, :cond_1

    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-gez v0, :cond_1

    .line 194
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 195
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 197
    :cond_1
    :goto_0
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_3

    .line 199
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    rem-int/2addr v0, v1

    if-nez v0, :cond_2

    goto :goto_1

    .line 202
    :cond_2
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    invoke-static {v0, v1}, Landroid/support/constraint/solver/Amount;->gcd(II)I

    move-result v1

    .line 204
    :goto_1
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 205
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    :cond_3
    return-void
.end method


# virtual methods
.method public add(I)Landroid/support/constraint/solver/Amount;
    .locals 2

    .line 85
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr p1, v1

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    return-object p0
.end method

.method public add(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;
    .locals 3

    .line 69
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ne v0, v1, :cond_0

    .line 70
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    goto :goto_0

    .line 72
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, v1

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v2, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 73
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 75
    :goto_0
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public divide(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;
    .locals 2

    .line 123
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 124
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 125
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 126
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 127
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 175
    :cond_0
    instance-of v1, p1, Landroid/support/constraint/solver/Amount;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 178
    :cond_1
    check-cast p1, Landroid/support/constraint/solver/Amount;

    .line 179
    iget v1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v3, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-ne v1, v3, :cond_2

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ne p0, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public getDenominator()I
    .locals 0

    .line 163
    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    return p0
.end method

.method public getNumerator()I
    .locals 0

    .line 157
    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    return p0
.end method

.method public inverse()Landroid/support/constraint/solver/Amount;
    .locals 1

    .line 148
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 149
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public inverseFraction()Landroid/support/constraint/solver/Amount;
    .locals 2

    .line 136
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 137
    iget v1, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iput v1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 138
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 139
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public isMinusOne()Z
    .locals 3

    .line 268
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isNegative()Z
    .locals 0

    .line 284
    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isNull()Z
    .locals 0

    .line 292
    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public isOne()Z
    .locals 2

    .line 260
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isPositive()Z
    .locals 1

    .line 276
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-ltz v0, :cond_0

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public multiply(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;
    .locals 2

    .line 111
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 112
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 113
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public set(II)V
    .locals 0

    .line 58
    iput p1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 59
    iput p2, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 60
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-void
.end method

.method public setToZero()V
    .locals 1

    const/4 v0, 0x0

    .line 299
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    const/4 v0, 0x1

    .line 300
    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    return-void
.end method

.method public substract(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;
    .locals 3

    .line 95
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    if-ne v0, v1, :cond_0

    .line 96
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    sub-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    goto :goto_0

    .line 98
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, v1

    iget v1, p1, Landroid/support/constraint/solver/Amount;->mNumerator:I

    iget v2, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    .line 99
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    iget p1, p1, Landroid/support/constraint/solver/Amount;->mDenominator:I

    mul-int/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    .line 101
    :goto_0
    invoke-direct {p0}, Landroid/support/constraint/solver/Amount;->simplify()V

    return-object p0
.end method

.method public toFloat()F
    .locals 2

    .line 308
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 309
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    int-to-float v0, v0

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    int-to-float p0, p0

    div-float/2addr v0, p0

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 320
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne v0, v1, :cond_3

    .line 321
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-eq v0, v1, :cond_2

    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 324
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-gez v0, :cond_1

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/2addr p0, v2

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 327
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_0
    const-string p0, ""

    return-object p0

    .line 329
    :cond_3
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    if-gez v0, :cond_4

    .line 330
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    mul-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 332
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public valueString()Ljava/lang/String;
    .locals 2

    .line 336
    iget v0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 337
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 339
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/Amount;->mNumerator:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/Amount;->mDenominator:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

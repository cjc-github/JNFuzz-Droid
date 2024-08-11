.class Landroid/support/constraint/solver/ArrayBackedVariables;
.super Ljava/lang/Object;
.source "ArrayBackedVariables.java"


# static fields
.field private static final DEBUG:Z = false


# instance fields
.field private candidate:Landroid/support/constraint/solver/SolverVariable;

.field private currentSize:I

.field private currentWriteSize:I

.field private indexes:[I

.field private maxSize:I

.field private final threshold:I

.field private values:[F

.field private variables:[Landroid/support/constraint/solver/SolverVariable;


# direct methods
.method public constructor <init>(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/Cache;)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 27
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    .line 28
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    .line 29
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    const/16 p2, 0x10

    .line 30
    iput p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->threshold:I

    const/4 p2, 0x4

    .line 31
    iput p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    const/4 p2, 0x0

    .line 32
    iput p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    .line 33
    iput p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    .line 34
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    .line 37
    iget p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    new-array p1, p1, [Landroid/support/constraint/solver/SolverVariable;

    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    .line 38
    iget p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    new-array p1, p1, [F

    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    .line 39
    iget p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    new-array p1, p1, [I

    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    return-void
.end method

.method private getInternalArrays()Ljava/lang/String;
    .locals 5

    const-string v0, ""

    .line 309
    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayBackedVariables;->size()I

    move-result v1

    .line 310
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "idx { "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    move-object v3, v0

    move v0, v2

    :goto_0
    if-ge v0, v1, :cond_0

    .line 312
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v3, v3, v0

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 314
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "}\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 315
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "obj { "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    if-ge v2, v1, :cond_1

    .line 317
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v0, v0, v2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget v0, v0, v2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 319
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "}\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public add(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 8

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    return-void

    :cond_0
    :goto_0
    const/4 v1, 0x0

    const/4 v2, -0x1

    move v3, v1

    move v4, v2

    .line 181
    :goto_1
    iget v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    if-ge v3, v5, :cond_5

    .line 182
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v5, v5, v3

    if-ne v5, p1, :cond_3

    .line 183
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget v2, v1, v3

    add-float/2addr v2, p2

    aput v2, v1, v3

    cmpg-float p2, p2, v0

    if-gez p2, :cond_1

    .line 185
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    .line 187
    :cond_1
    iget-object p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget p2, p2, v3

    cmpl-float p2, p2, v0

    if-nez p2, :cond_2

    .line 188
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/ArrayBackedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    :cond_2
    return-void

    :cond_3
    if-ne v4, v2, :cond_4

    .line 192
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v5, v5, v3

    if-nez v5, :cond_4

    move v4, v3

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    if-ne v4, v2, :cond_6

    .line 196
    iget v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    iget v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    if-ge v3, v5, :cond_6

    .line 197
    iget v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    :cond_6
    if-eq v4, v2, :cond_c

    .line 200
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aput-object p1, v2, v4

    .line 201
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aput p2, v2, v4

    move v2, v1

    .line 204
    :goto_2
    iget v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    const/4 v5, 0x1

    if-ge v2, v3, :cond_8

    .line 205
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v3, v3, v2

    .line 206
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v3, v6, v3

    iget v3, v3, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v6, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-le v3, v6, :cond_7

    .line 208
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    add-int/lit8 v6, v2, 0x1

    iget v7, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    sub-int/2addr v7, v2

    invoke-static {v1, v2, v3, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 209
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aput v4, v1, v2

    move v1, v5

    goto :goto_3

    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_8
    :goto_3
    if-nez v1, :cond_9

    .line 215
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    aput v4, v1, v2

    .line 217
    :cond_9
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/2addr v1, v5

    iput v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/2addr v4, v5

    .line 218
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    if-le v4, v1, :cond_a

    .line 219
    iput v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    :cond_a
    cmpg-float p2, p2, v0

    if-gez p2, :cond_b

    .line 222
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    :cond_b
    return-void

    .line 226
    :cond_c
    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayBackedVariables;->increaseSize()V

    goto/16 :goto_0
.end method

.method public clear()V
    .locals 5

    .line 232
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 233
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 235
    :cond_0
    iput v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    .line 236
    iput v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    return-void
.end method

.method public containsKey(Landroid/support/constraint/solver/SolverVariable;)Z
    .locals 7

    .line 240
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-ge v0, v3, :cond_1

    move v0, v1

    .line 241
    :goto_0
    iget v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    if-ge v0, v3, :cond_4

    .line 242
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v4, v4, v0

    aget-object v3, v3, v4

    if-ne v3, p1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 248
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    sub-int/2addr v0, v2

    move v3, v0

    move v0, v1

    :goto_1
    if-gt v0, v3, :cond_4

    sub-int v4, v3, v0

    .line 250
    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    .line 251
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v6, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v6, v6, v4

    aget-object v5, v5, v6

    if-ne v5, p1, :cond_2

    return v2

    .line 254
    :cond_2
    iget v5, v5, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v6, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v5, v6, :cond_3

    add-int/lit8 v4, v4, 0x1

    move v0, v4

    goto :goto_1

    :cond_3
    add-int/lit8 v4, v4, -0x1

    move v3, v4

    goto :goto_1

    :cond_4
    return v1
.end method

.method public display()V
    .locals 5

    .line 299
    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayBackedVariables;->size()I

    move-result v0

    .line 300
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "{ "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 302
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/ArrayBackedVariables;->getVariable(I)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/ArrayBackedVariables;->getVariableValue(I)F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 304
    :cond_0
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, " }"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public displayInternalArrays()V
    .locals 6

    .line 324
    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayBackedVariables;->size()I

    move-result v0

    .line 325
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "idx { "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 327
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v5, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 329
    :cond_0
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "}"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 330
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "obj { "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    :goto_1
    if-ge v1, v0, :cond_1

    .line 332
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 334
    :cond_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "}"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public divideByAmount(F)V
    .locals 0

    return-void
.end method

.method public final get(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 5

    .line 95
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    const/4 v1, 0x0

    const/16 v2, 0x10

    if-ge v0, v2, :cond_1

    .line 96
    :goto_0
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    if-ge v1, v0, :cond_4

    .line 97
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v0, v0, v1

    .line 98
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v2, v2, v0

    if-ne v2, p1, :cond_0

    .line 99
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget p0, p0, v0

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-gt v1, v0, :cond_4

    sub-int v2, v0, v1

    .line 106
    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    .line 107
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v3, v3, v2

    .line 108
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v4, v4, v3

    if-ne v4, p1, :cond_2

    .line 110
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget p0, p0, v3

    return p0

    .line 111
    :cond_2
    iget v3, v4, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v4, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v3, v4, :cond_3

    add-int/lit8 v2, v2, 0x1

    move v1, v2

    goto :goto_1

    :cond_3
    add-int/lit8 v2, v2, -0x1

    move v0, v2

    goto :goto_1

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public getPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 4

    .line 43
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 44
    :goto_0
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    if-ge v0, v1, :cond_1

    .line 45
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v1, v1, v0

    .line 46
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget v2, v2, v1

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_0

    .line 47
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v0, v0, v1

    iput-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    return-object p0
.end method

.method public final getVariable(I)Landroid/support/constraint/solver/SolverVariable;
    .locals 1

    .line 67
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget p0, p0, p1

    aget-object p0, v0, p0

    return-object p0
.end method

.method public final getVariableValue(I)F
    .locals 1

    .line 71
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    iget-object p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget p0, p0, p1

    aget p0, v0, p0

    return p0
.end method

.method public hasAtLeastOnePositiveVariable()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method increaseSize()V
    .locals 2

    .line 56
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    .line 57
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/solver/SolverVariable;

    iput-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    .line 58
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    .line 59
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    iput-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    return-void
.end method

.method public invert()V
    .locals 0

    return-void
.end method

.method public pickPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public put(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 8

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    .line 123
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/ArrayBackedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    return-void

    :cond_0
    :goto_0
    const/4 v1, 0x0

    const/4 v2, -0x1

    move v3, v1

    move v4, v2

    .line 128
    :goto_1
    iget v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    if-ge v3, v5, :cond_4

    .line 129
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v5, v5, v3

    if-ne v5, p1, :cond_2

    .line 130
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aput p2, v1, v3

    cmpg-float p2, p2, v0

    if-gez p2, :cond_1

    .line 132
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    :cond_1
    return-void

    :cond_2
    if-ne v4, v2, :cond_3

    .line 136
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v5, v5, v3

    if-nez v5, :cond_3

    move v4, v3

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    if-ne v4, v2, :cond_5

    .line 140
    iget v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    iget v5, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    if-ge v3, v5, :cond_5

    .line 141
    iget v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    :cond_5
    if-eq v4, v2, :cond_b

    .line 144
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aput-object p1, v2, v4

    .line 145
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aput p2, v2, v4

    move v2, v1

    .line 148
    :goto_2
    iget v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    const/4 v5, 0x1

    if-ge v2, v3, :cond_7

    .line 149
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v3, v3, v2

    .line 150
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v3, v6, v3

    iget v3, v3, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v6, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-le v3, v6, :cond_6

    .line 152
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    add-int/lit8 v6, v2, 0x1

    iget v7, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    sub-int/2addr v7, v2

    invoke-static {v1, v2, v3, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aput v4, v1, v2

    move v1, v5

    goto :goto_3

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_7
    :goto_3
    if-nez v1, :cond_8

    .line 159
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    aput v4, v1, v2

    .line 161
    :cond_8
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/2addr v1, v5

    iput v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/2addr v4, v5

    .line 162
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    if-le v4, v1, :cond_9

    .line 163
    iput v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    :cond_9
    cmpg-float p2, p2, v0

    if-gez p2, :cond_a

    .line 166
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    :cond_a
    return-void

    .line 170
    :cond_b
    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayBackedVariables;->increaseSize()V

    goto/16 :goto_0
.end method

.method public remove(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 5

    .line 269
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    const/4 v1, 0x0

    if-ne v0, p1, :cond_0

    .line 270
    iput-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    :cond_0
    const/4 v0, 0x0

    .line 272
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    if-ge v0, v2, :cond_2

    .line 273
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v2, v2, v0

    .line 274
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v3, v3, v2

    if-ne v3, p1, :cond_1

    .line 275
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget p1, p1, v2

    .line 276
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aput-object v1, v3, v2

    .line 277
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    add-int/lit8 v2, v0, 0x1

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    iget v4, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentWriteSize:I

    sub-int/2addr v4, v0

    add-int/lit8 v4, v4, -0x1

    invoke-static {v1, v2, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 278
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    return p1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method public setVariable(IF)V
    .locals 1

    .line 87
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget p1, v0, p1

    .line 88
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aput p2, v0, p1

    const/4 v0, 0x0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_0

    .line 90
    iget-object p2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object p1, p2, p1

    iput-object p1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    :cond_0
    return-void
.end method

.method public final size()I
    .locals 0

    .line 63
    iget p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    return p0
.end method

.method public sizeInBytes()I
    .locals 2

    .line 291
    iget v0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    mul-int/lit8 v0, v0, 0x4

    add-int/lit8 v0, v0, 0x0

    .line 292
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    mul-int/lit8 v1, v1, 0x4

    add-int/2addr v0, v1

    .line 293
    iget p0, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->maxSize:I

    mul-int/lit8 p0, p0, 0x4

    add-int/2addr v0, p0

    add-int/lit8 v0, v0, 0x10

    return v0
.end method

.method public final updateArray(Landroid/support/constraint/solver/ArrayBackedVariables;F)V
    .locals 4

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 78
    :goto_0
    iget v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->currentSize:I

    if-ge v0, v1, :cond_1

    .line 79
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->indexes:[I

    aget v1, v1, v0

    .line 80
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->variables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v2, v2, v1

    .line 81
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayBackedVariables;->values:[F

    aget v1, v3, v1

    mul-float/2addr v1, p2

    .line 82
    invoke-virtual {p1, v2, v1}, Landroid/support/constraint/solver/ArrayBackedVariables;->add(Landroid/support/constraint/solver/SolverVariable;F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updateClientEquations(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 0

    return-void
.end method

.method public updateFromRow(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/ArrayRow;)V
    .locals 0

    return-void
.end method

.method public updateFromSystem(Landroid/support/constraint/solver/ArrayRow;[Landroid/support/constraint/solver/ArrayRow;)V
    .locals 0

    return-void
.end method

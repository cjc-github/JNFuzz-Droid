.class public Landroid/support/constraint/solver/ArrayLinkedVariables;
.super Ljava/lang/Object;
.source "ArrayLinkedVariables.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final NONE:I = -0x1


# instance fields
.field private ROW_SIZE:I

.field private candidate:Landroid/support/constraint/solver/SolverVariable;

.field currentSize:I

.field private epsilon:F

.field private mArrayIndices:[I

.field private mArrayNextIndices:[I

.field private mArrayValues:[F

.field private final mCache:Landroid/support/constraint/solver/Cache;

.field private mDidFillOnce:Z

.field private mHead:I

.field private mLast:I

.field private final mRow:Landroid/support/constraint/solver/ArrayRow;


# direct methods
.method public constructor <init>(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/Cache;)V
    .locals 2

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 42
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    const/16 v1, 0x8

    .line 47
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    const/4 v1, 0x0

    .line 49
    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    const v1, 0x3a83126f    # 0.001f

    .line 51
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->epsilon:F

    .line 54
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    new-array v1, v1, [I

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    .line 57
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    new-array v1, v1, [I

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    .line 60
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    new-array v1, v1, [F

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    const/4 v1, -0x1

    .line 63
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 79
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 82
    iput-boolean v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 102
    iput-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    .line 103
    iput-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    return-void
.end method


# virtual methods
.method public final add(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 9

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    return-void

    .line 218
    :cond_0
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-ne v1, v3, :cond_2

    .line 219
    iput v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 220
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput p2, v0, v1

    .line 221
    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    iget p1, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    aput p1, p2, v0

    .line 222
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput v3, p1, p2

    .line 223
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 224
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_1

    .line 226
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    :cond_1
    return-void

    .line 230
    :cond_2
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    move v5, v2

    move v6, v3

    :goto_0
    if-eq v1, v3, :cond_8

    .line 233
    iget v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v5, v7, :cond_8

    .line 234
    iget-object v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v7, v1

    .line 235
    iget v8, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v7, v8, :cond_6

    .line 236
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v2, p1, v1

    add-float/2addr v2, p2

    aput v2, p1, v1

    .line 238
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p1, p1, v1

    cmpl-float p1, p1, v0

    if-nez p1, :cond_5

    .line 239
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    if-ne v1, p1, :cond_3

    .line 240
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p1, p1, v1

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_1

    .line 242
    :cond_3
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p2, p2, v1

    aput p2, p1, v6

    .line 244
    :goto_1
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object p1, p1, v7

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 245
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz p1, :cond_4

    .line 247
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 249
    :cond_4
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    sub-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    :cond_5
    return-void

    .line 253
    :cond_6
    iget-object v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v7, v1

    iget v8, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v7, v8, :cond_7

    move v6, v1

    .line 256
    :cond_7
    iget-object v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v1, v7, v1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 262
    :cond_8
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr v0, v4

    .line 263
    iget-boolean v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz v1, :cond_a

    .line 266
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    aget v0, v0, v1

    if-ne v0, v3, :cond_9

    .line 267
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    goto :goto_2

    .line 269
    :cond_9
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, v0

    .line 272
    :cond_a
    :goto_2
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v1, v1

    if-lt v0, v1, :cond_c

    .line 273
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    iget-object v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v5, v5

    if-ge v1, v5, :cond_c

    move v1, v2

    .line 275
    :goto_3
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v5, v5

    if-ge v1, v5, :cond_c

    .line 276
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v5, v5, v1

    if-ne v5, v3, :cond_b

    move v0, v1

    goto :goto_4

    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 284
    :cond_c
    :goto_4
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v1, v1

    if-lt v0, v1, :cond_d

    .line 285
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, v0

    .line 286
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    .line 287
    iput-boolean v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    add-int/lit8 v1, v0, -0x1

    .line 288
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 289
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    .line 290
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    .line 291
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    .line 295
    :cond_d
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget p1, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    aput p1, v1, v0

    .line 296
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, p1, v0

    if-eq v6, v3, :cond_e

    .line 298
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p2, p2, v6

    aput p2, p1, v0

    .line 299
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aput v0, p1, v6

    goto :goto_5

    .line 301
    :cond_e
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput p2, p1, v0

    .line 302
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 304
    :goto_5
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 305
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_f

    .line 307
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 309
    :cond_f
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p2, p2

    if-lt p1, p2, :cond_10

    .line 310
    iput-boolean v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 311
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p1, p1

    sub-int/2addr p1, v4

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    :cond_10
    return-void
.end method

.method public final clear()V
    .locals 1

    const/4 v0, -0x1

    .line 358
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 359
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    const/4 v0, 0x0

    .line 360
    iput-boolean v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    .line 361
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    return-void
.end method

.method public final containsKey(Landroid/support/constraint/solver/SolverVariable;)Z
    .locals 6

    .line 371
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    .line 374
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    move v3, v2

    :goto_0
    if-eq v0, v1, :cond_2

    .line 376
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v3, v4, :cond_2

    .line 377
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v0

    iget v5, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v4, v5, :cond_1

    const/4 p0, 0x1

    return p0

    .line 380
    :cond_1
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v4, v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method public display()V
    .locals 5

    .line 700
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 701
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "{ "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 703
    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/ArrayLinkedVariables;->getVariable(I)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 707
    :cond_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/ArrayLinkedVariables;->getVariableValue(I)F

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 709
    :cond_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, " }"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public divideByAmount(F)V
    .locals 4

    .line 421
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 423
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_0

    .line 424
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v2, v0

    div-float/2addr v3, p1

    aput v3, v2, v0

    .line 425
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final get(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 4

    .line 680
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 682
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    .line 683
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v2, v2, v0

    iget v3, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v2, v3, :cond_0

    .line 684
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 686
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 6

    .line 579
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_3

    .line 581
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 584
    iget v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v3, :cond_2

    .line 585
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v3, v0

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gez v3, :cond_1

    .line 589
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v3, v3, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v0

    aget-object v3, v3, v4

    if-eqz v2, :cond_0

    .line 590
    iget v4, v2, Landroid/support/constraint/solver/SolverVariable;->strength:I

    iget v5, v3, Landroid/support/constraint/solver/SolverVariable;->strength:I

    if-le v4, v5, :cond_1

    :cond_0
    move-object v2, v3

    .line 594
    :cond_1
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v2

    .line 598
    :cond_3
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    return-object p0
.end method

.method public final getVariable(I)Landroid/support/constraint/solver/SolverVariable;
    .locals 3

    .line 608
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 610
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    if-ne v1, p1, :cond_0

    .line 612
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget p0, p0, v0

    aget-object p0, p1, p0

    return-object p0

    .line 614
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getVariableValue(I)F
    .locals 3

    .line 626
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 628
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    if-ne v1, p1, :cond_0

    .line 630
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 632
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public hasAtLeastOnePositiveVariable()Z
    .locals 5

    .line 391
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 393
    iget v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v3, :cond_1

    .line 394
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v3, v0

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_0

    const/4 p0, 0x1

    return p0

    .line 397
    :cond_0
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public invert()V
    .locals 5

    .line 406
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 408
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_0

    .line 409
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v2, v0

    const/high16 v4, -0x40800000    # -1.0f

    mul-float/2addr v3, v4

    aput v3, v2, v0

    .line 410
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public pickPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 9

    .line 452
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    :goto_0
    const/4 v4, -0x1

    if-eq v0, v4, :cond_6

    .line 454
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v4, :cond_6

    .line 455
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v4, v4, v0

    const/4 v5, 0x0

    cmpg-float v6, v4, v5

    if-gez v6, :cond_0

    .line 457
    iget v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->epsilon:F

    neg-float v6, v6

    cmpl-float v6, v4, v6

    if-lez v6, :cond_1

    .line 458
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput v5, v4, v0

    :goto_1
    move v4, v5

    goto :goto_2

    .line 462
    :cond_0
    iget v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->epsilon:F

    cmpg-float v6, v4, v6

    if-gez v6, :cond_1

    .line 463
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput v5, v4, v0

    goto :goto_1

    :cond_1
    :goto_2
    cmpl-float v6, v4, v5

    if-eqz v6, :cond_5

    .line 468
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v6, v6, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v7, v0

    aget-object v6, v6, v7

    .line 469
    iget-object v7, v6, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v8, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v7, v8, :cond_3

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    return-object v6

    :cond_2
    if-nez v1, :cond_5

    move-object v1, v6

    goto :goto_3

    :cond_3
    cmpg-float v4, v4, v5

    if-gez v4, :cond_5

    if-eqz v3, :cond_4

    .line 475
    iget v4, v6, Landroid/support/constraint/solver/SolverVariable;->strength:I

    iget v5, v3, Landroid/support/constraint/solver/SolverVariable;->strength:I

    if-ge v4, v5, :cond_5

    :cond_4
    move-object v3, v6

    .line 479
    :cond_5
    :goto_3
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v4, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    if-eqz v1, :cond_7

    return-object v1

    :cond_7
    return-object v3
.end method

.method public final put(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 8

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    .line 119
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/ArrayLinkedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    return-void

    .line 123
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v0, v2, :cond_2

    .line 124
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 125
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput p2, v0, v1

    .line 126
    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    iget p1, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    aput p1, p2, v0

    .line 127
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput v2, p1, p2

    .line 128
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v3

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 129
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_1

    .line 131
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v3

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    :cond_1
    return-void

    .line 135
    :cond_2
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    move v4, v1

    move v5, v2

    :goto_0
    if-eq v0, v2, :cond_5

    .line 138
    iget v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v4, v6, :cond_5

    .line 139
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v6, v6, v0

    iget v7, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v6, v7, :cond_3

    .line 140
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, p0, v0

    return-void

    .line 143
    :cond_3
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v6, v6, v0

    iget v7, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v6, v7, :cond_4

    move v5, v0

    .line 146
    :cond_4
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v6, v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 152
    :cond_5
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr v0, v3

    .line 153
    iget-boolean v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz v4, :cond_7

    .line 156
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    aget v0, v0, v4

    if-ne v0, v2, :cond_6

    .line 157
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    goto :goto_1

    .line 159
    :cond_6
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, v0

    .line 162
    :cond_7
    :goto_1
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v4, v4

    if-lt v0, v4, :cond_9

    .line 163
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v6, v6

    if-ge v4, v6, :cond_9

    move v4, v1

    .line 165
    :goto_2
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v6, v6

    if-ge v4, v6, :cond_9

    .line 166
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v6, v6, v4

    if-ne v6, v2, :cond_8

    move v0, v4

    goto :goto_3

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 174
    :cond_9
    :goto_3
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v4, v4

    if-lt v0, v4, :cond_a

    .line 175
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length v0, v0

    .line 176
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    mul-int/lit8 v4, v4, 0x2

    iput v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    .line 177
    iput-boolean v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    add-int/lit8 v1, v0, -0x1

    .line 178
    iput v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 179
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    .line 180
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    .line 181
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->ROW_SIZE:I

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    iput-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    .line 185
    :cond_a
    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    iget p1, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    aput p1, v1, v0

    .line 186
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, p1, v0

    if-eq v5, v2, :cond_b

    .line 188
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p2, p2, v5

    aput p2, p1, v0

    .line 189
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aput v0, p1, v5

    goto :goto_4

    .line 191
    :cond_b
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    aput p2, p1, v0

    .line 192
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    .line 194
    :goto_4
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    add-int/2addr p1, v3

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 195
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-nez p1, :cond_c

    .line 197
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    add-int/2addr p1, v3

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 199
    :cond_c
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    iget-object p2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p2, p2

    if-lt p1, p2, :cond_d

    .line 200
    iput-boolean v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    :cond_d
    return-void
.end method

.method public final remove(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 8

    .line 322
    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    .line 323
    iput-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    .line 325
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    return v1

    .line 328
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v3, 0x0

    move v4, v2

    :goto_0
    if-eq v0, v2, :cond_5

    .line 331
    iget v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v3, v5, :cond_5

    .line 332
    iget-object v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v5, v5, v0

    .line 333
    iget v6, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v5, v6, :cond_4

    .line 334
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    if-ne v0, p1, :cond_2

    .line 335
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget p1, p1, v0

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_1

    .line 337
    :cond_2
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v1, v1, v0

    aput v1, p1, v4

    .line 339
    :goto_1
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object p1, p1, v5

    iget-object v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p1, v1}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 340
    iget p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    .line 341
    iget-object p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aput v2, p1, v0

    .line 342
    iget-boolean p1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mDidFillOnce:Z

    if-eqz p1, :cond_3

    .line 344
    iput v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mLast:I

    .line 346
    :cond_3
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget p0, p0, v0

    return p0

    .line 349
    :cond_4
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v4, v4, v0

    add-int/lit8 v3, v3, 0x1

    move v7, v4

    move v4, v0

    move v0, v7

    goto :goto_0

    :cond_5
    return v1
.end method

.method public final setVariable(IF)V
    .locals 3

    .line 664
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 666
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    if-ne v1, p1, :cond_0

    .line 668
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aput p2, v2, v0

    .line 670
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public sizeInBytes()I
    .locals 0

    .line 694
    iget-object p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    array-length p0, p0

    mul-int/lit8 p0, p0, 0x4

    mul-int/lit8 p0, p0, 0x3

    add-int/lit8 p0, p0, 0x0

    add-int/lit8 p0, p0, 0x24

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    const-string v0, ""

    .line 720
    iget v1, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v2, 0x0

    :goto_0
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 722
    iget v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v3, :cond_0

    .line 723
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 724
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v0, v0, v1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " : "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 725
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v1

    aget-object v0, v0, v4

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 726
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v1, v3, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public final updateArray(Landroid/support/constraint/solver/ArrayLinkedVariables;F)V
    .locals 5

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-void

    .line 647
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 649
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_1

    .line 650
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v3, v3, v0

    aget-object v2, v2, v3

    .line 651
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v3, v3, v0

    .line 652
    invoke-virtual {p1, v2}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v4

    mul-float/2addr v3, p2

    add-float/2addr v4, v3

    invoke-virtual {p1, v2, v4}, Landroid/support/constraint/solver/ArrayLinkedVariables;->put(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 653
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updateClientEquations(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 4

    .line 436
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 438
    iget v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v1, v2, :cond_0

    .line 439
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v3, v3, v0

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Landroid/support/constraint/solver/SolverVariable;->addClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 440
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v2, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public updateFromRow(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/ArrayRow;)V
    .locals 8

    .line 497
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    move v2, v1

    :goto_1
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 499
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v4, :cond_2

    .line 500
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v4, v4, v0

    iget-object v5, p2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v5, v5, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ne v4, v5, :cond_1

    .line 501
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v0, v2, v0

    .line 502
    iget-object v2, p2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/ArrayLinkedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    .line 504
    iget-object v2, p2, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    check-cast v2, Landroid/support/constraint/solver/ArrayLinkedVariables;

    .line 505
    iget v4, v2, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    move v5, v1

    :goto_2
    if-eq v4, v3, :cond_0

    .line 507
    iget v6, v2, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v5, v6, :cond_0

    .line 508
    iget-object v6, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v6, v6, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, v2, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v7, v7, v4

    aget-object v6, v6, v7

    .line 510
    iget-object v7, v2, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v7, v7, v4

    mul-float/2addr v7, v0

    .line 511
    invoke-virtual {p0, v6, v7}, Landroid/support/constraint/solver/ArrayLinkedVariables;->add(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 512
    iget-object v6, v2, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v4, v6, v4

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 514
    :cond_0
    iget v2, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    iget v3, p2, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    mul-float/2addr v3, v0

    add-float/2addr v2, v3

    iput v2, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    .line 515
    iget-object v0, p2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p1}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 520
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_0

    .line 524
    :cond_1
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public updateFromSystem(Landroid/support/constraint/solver/ArrayRow;[Landroid/support/constraint/solver/ArrayRow;)V
    .locals 9

    .line 538
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    const/4 v1, 0x0

    :goto_0
    move v2, v1

    :goto_1
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 540
    iget v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v2, v4, :cond_2

    .line 541
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v4, v4, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v5, v5, v0

    aget-object v4, v4, v5

    .line 542
    iget v5, v4, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    if-eq v5, v3, :cond_1

    .line 543
    iget-object v2, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v0, v2, v0

    .line 544
    invoke-virtual {p0, v4}, Landroid/support/constraint/solver/ArrayLinkedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    .line 546
    iget v2, v4, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    aget-object v2, p2, v2

    .line 547
    iget-boolean v4, v2, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v4, :cond_0

    .line 548
    iget-object v4, v2, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    check-cast v4, Landroid/support/constraint/solver/ArrayLinkedVariables;

    .line 549
    iget v5, v4, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    move v6, v1

    :goto_2
    if-eq v5, v3, :cond_0

    .line 551
    iget v7, v4, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-ge v6, v7, :cond_0

    .line 552
    iget-object v7, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v7, v7, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget-object v8, v4, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayIndices:[I

    aget v8, v8, v5

    aget-object v7, v7, v8

    .line 554
    iget-object v8, v4, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayValues:[F

    aget v8, v8, v5

    mul-float/2addr v8, v0

    .line 555
    invoke-virtual {p0, v7, v8}, Landroid/support/constraint/solver/ArrayLinkedVariables;->add(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 556
    iget-object v7, v4, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v5, v7, v5

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 560
    :cond_0
    iget v3, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    iget v4, v2, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    mul-float/2addr v4, v0

    add-float/2addr v3, v4

    iput v3, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    .line 561
    iget-object v0, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p1}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 566
    iget v0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mHead:I

    goto :goto_0

    .line 570
    :cond_1
    iget-object v3, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->mArrayNextIndices:[I

    aget v0, v3, v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

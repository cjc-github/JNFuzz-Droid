.class public Landroid/support/constraint/solver/LinkedVariables;
.super Ljava/lang/Object;
.source "LinkedVariables.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/solver/LinkedVariables$Link;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static sCreation:I


# instance fields
.field private candidate:Landroid/support/constraint/solver/SolverVariable;

.field currentSize:I

.field epsilon:F

.field private head:Landroid/support/constraint/solver/LinkedVariables$Link;

.field private final mCache:Landroid/support/constraint/solver/Cache;

.field private final mRow:Landroid/support/constraint/solver/ArrayRow;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/Cache;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v1, 0x0

    .line 40
    iput v1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    .line 41
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    const v0, 0x3a83126f    # 0.001f

    .line 43
    iput v0, p0, Landroid/support/constraint/solver/LinkedVariables;->epsilon:F

    .line 47
    iput-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    .line 48
    iput-object p2, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    return-void
.end method


# virtual methods
.method public final add(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 6

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    .line 341
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinkedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    return-void

    .line 344
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v2, 0x0

    move-object v3, v2

    :goto_0
    if-eqz v1, :cond_5

    .line 347
    iget-object v4, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v4, p1, :cond_3

    .line 348
    iget p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    add-float/2addr p1, p2

    iput p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 349
    iget p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_2

    .line 350
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-ne v1, p1, :cond_1

    .line 351
    iget-object p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_1

    .line 353
    :cond_1
    iget-object p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, v3, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 355
    :goto_1
    iget-object p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object p2, p0, Landroid/support/constraint/solver/LinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p1, p2}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 356
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {p1, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 357
    iget p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    :cond_2
    return-void

    .line 361
    :cond_3
    iget-object v4, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v4, v4, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v5, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v4, v5, :cond_4

    move-object v3, v1

    .line 364
    :cond_4
    iget-object v1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    .line 366
    :cond_5
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v0, :cond_6

    .line 368
    new-instance v0, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v0}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    .line 370
    :cond_6
    iput p2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 371
    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 372
    iput-object v2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-eqz v3, :cond_7

    .line 374
    iget-object p1, v3, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 375
    iput-object v0, v3, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_2

    .line 377
    :cond_7
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 378
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 380
    :goto_2
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez p1, :cond_8

    .line 381
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 383
    :cond_8
    iget p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    return-void
.end method

.method public final clear()V
    .locals 3

    .line 387
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz v0, :cond_0

    .line 390
    iget-object v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 391
    iget-object v2, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v2, v0}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    move-object v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 393
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v0, 0x0

    .line 394
    iput v0, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    return-void
.end method

.method public final containsKey(Landroid/support/constraint/solver/SolverVariable;)Z
    .locals 1

    .line 398
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_1

    .line 400
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    .line 403
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public display()V
    .locals 5

    .line 440
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinkedVariables;->size()I

    move-result v0

    .line 441
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "{ "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 443
    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/LinkedVariables;->getVariable(I)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 447
    :cond_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/LinkedVariables;->getVariableValue(I)F

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

    .line 449
    :cond_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, " }"

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public divideByAmount(F)V
    .locals 1

    .line 82
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_0

    .line 84
    iget v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    div-float/2addr v0, p1

    iput v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 85
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final get(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 1

    .line 292
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_1

    .line 294
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v0, p1, :cond_0

    .line 295
    iget p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    return p0

    .line 297
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public getPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 3

    .line 232
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_2

    .line 233
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz v0, :cond_2

    .line 235
    iget v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    .line 236
    iget-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    if-eqz v1, :cond_0

    iget-object v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v1, v1, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    iget-object v2, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    iget v2, v2, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    if-ge v1, v2, :cond_1

    .line 237
    :cond_0
    iget-object v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    .line 240
    :cond_1
    iget-object v0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    .line 243
    :cond_2
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    return-object p0
.end method

.method public final getVariable(I)Landroid/support/constraint/solver/SolverVariable;
    .locals 1

    .line 251
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v0, 0x0

    :goto_0
    if-eq v0, p1, :cond_0

    .line 254
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    .line 257
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public final getVariableValue(I)F
    .locals 1

    .line 261
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v0, 0x0

    :goto_0
    if-eq v0, p1, :cond_0

    .line 264
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    .line 267
    iget p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public hasAtLeastOnePositiveVariable()Z
    .locals 2

    .line 63
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_1

    .line 65
    iget v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 68
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public invert()V
    .locals 2

    .line 74
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_0

    .line 76
    iget v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    const/high16 v1, -0x40800000    # -1.0f

    mul-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 77
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public pickPivotCandidate()Landroid/support/constraint/solver/SolverVariable;
    .locals 7

    .line 98
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    if-eqz v0, :cond_5

    .line 102
    iget v3, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    const/4 v4, 0x0

    cmpg-float v5, v3, v4

    if-gez v5, :cond_0

    .line 104
    iget v5, p0, Landroid/support/constraint/solver/LinkedVariables;->epsilon:F

    neg-float v5, v5

    cmpl-float v5, v3, v5

    if-lez v5, :cond_1

    .line 105
    iput v4, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    :goto_1
    move v3, v4

    goto :goto_2

    .line 109
    :cond_0
    iget v5, p0, Landroid/support/constraint/solver/LinkedVariables;->epsilon:F

    cmpg-float v5, v3, v5

    if-gez v5, :cond_1

    .line 110
    iput v4, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    goto :goto_1

    :cond_1
    :goto_2
    cmpl-float v5, v3, v4

    if-eqz v5, :cond_4

    .line 115
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, v5, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v6, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v5, v6, :cond_3

    cmpg-float v3, v3, v4

    if-gez v3, :cond_2

    .line 117
    iget-object p0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    return-object p0

    :cond_2
    if-nez v1, :cond_4

    .line 119
    iget-object v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    goto :goto_3

    :cond_3
    cmpg-float v3, v3, v4

    if-gez v3, :cond_4

    if-nez v2, :cond_4

    .line 122
    iget-object v2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 125
    :cond_4
    :goto_3
    iget-object v0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_5
    if-eqz v1, :cond_6

    return-object v1

    :cond_6
    return-object v2
.end method

.method public final put(Landroid/support/constraint/solver/SolverVariable;F)V
    .locals 5

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    .line 304
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinkedVariables;->remove(Landroid/support/constraint/solver/SolverVariable;)F

    return-void

    .line 307
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    if-eqz v0, :cond_3

    .line 310
    iget-object v3, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v3, p1, :cond_1

    .line 311
    iput p2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    return-void

    .line 314
    :cond_1
    iget-object v3, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v3, v3, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v4, p1, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-ge v3, v4, :cond_2

    move-object v2, v0

    .line 317
    :cond_2
    iget-object v0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    .line 319
    :cond_3
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v0, :cond_4

    .line 321
    new-instance v0, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v0}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    .line 323
    :cond_4
    iput p2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 324
    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 325
    iput-object v1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-eqz v2, :cond_5

    .line 327
    iget-object p1, v2, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 328
    iput-object v0, v2, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_1

    .line 330
    :cond_5
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object p1, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 331
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 333
    :goto_1
    iget-object p1, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez p1, :cond_6

    .line 334
    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 336
    :cond_6
    iget p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    return-void
.end method

.method public final remove(Landroid/support/constraint/solver/SolverVariable;)F
    .locals 4

    .line 409
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    const/4 v1, 0x0

    if-ne v0, p1, :cond_0

    .line 410
    iput-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->candidate:Landroid/support/constraint/solver/SolverVariable;

    .line 412
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    if-eqz v1, :cond_3

    .line 415
    iget-object v2, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v2, p1, :cond_2

    .line 416
    iget p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 417
    iget-object v2, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    if-ne v1, v2, :cond_1

    .line 418
    iget-object v0, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_1

    .line 420
    :cond_1
    iget-object v2, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v2, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 422
    :goto_1
    iget-object v0, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v2, p0, Landroid/support/constraint/solver/LinkedVariables;->mRow:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {v0, v2}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 423
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 424
    iget v0, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    return p1

    .line 428
    :cond_2
    iget-object v0, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method

.method public final setVariable(IF)V
    .locals 1

    .line 282
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    const/4 v0, 0x0

    :goto_0
    if-eq v0, p1, :cond_0

    .line 285
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 288
    :cond_0
    iput p2, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    return-void
.end method

.method public final size()I
    .locals 0

    .line 247
    iget p0, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    return p0
.end method

.method public sizeInBytes()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    const-string v0, ""

    .line 54
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_0

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " -> ("

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 57
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public final updateArray(Landroid/support/constraint/solver/LinkedVariables;F)V
    .locals 3

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-void

    .line 274
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_1

    .line 276
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p1, v1}, Landroid/support/constraint/solver/LinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v1

    iget v2, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    mul-float/2addr v2, p2

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/support/constraint/solver/LinkedVariables;->put(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 277
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updateClientEquations(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 1

    .line 90
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_0
    if-eqz p0, :cond_0

    .line 92
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v0, p1}, Landroid/support/constraint/solver/SolverVariable;->addClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    .line 93
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public updateFromRow(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/ArrayRow;)V
    .locals 9

    .line 134
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 136
    iget-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v1}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v1, :cond_0

    .line 138
    new-instance v1, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v1}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    :cond_0
    const/4 v2, 0x0

    .line 140
    iput-object v2, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    move-object v4, v1

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_5

    .line 143
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v6, p2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    if-ne v5, v6, :cond_4

    .line 144
    iget v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 145
    iget-boolean v6, p2, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v6, :cond_2

    .line 146
    iget-object v6, p2, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    check-cast v6, Landroid/support/constraint/solver/LinkedVariables;

    iget-object v6, v6, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_1
    if-eqz v6, :cond_2

    .line 148
    iget-object v7, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v7, v7, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v7}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v7, :cond_1

    new-instance v7, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v7}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    .line 149
    :cond_1
    iget-object v8, v6, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput-object v8, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 150
    iget v8, v6, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    mul-float/2addr v8, v5

    iput v8, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 151
    iput-object v2, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 152
    iput-object v7, v4, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 154
    iget-object v6, v6, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    move-object v4, v7

    goto :goto_1

    .line 157
    :cond_2
    iget v6, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    iget v7, p2, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    mul-float/2addr v7, v5

    add-float/2addr v6, v7

    iput v6, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    .line 158
    iget-object v5, p2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v5, p1}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    if-nez v3, :cond_3

    .line 160
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v5, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_2

    .line 162
    :cond_3
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v5, v3, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 164
    :goto_2
    iget-object v5, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v5, v5, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v5, v0}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 165
    iget v5, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    goto :goto_3

    :cond_4
    move-object v3, v0

    .line 169
    :goto_3
    iget-object v0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    .line 171
    :cond_5
    iget-object p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_4
    if-eqz p1, :cond_6

    .line 173
    iget-object p2, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v0, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    invoke-virtual {p0, p2, v0}, Landroid/support/constraint/solver/LinkedVariables;->add(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 175
    iget-object p2, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 176
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    move-object p1, p2

    goto :goto_4

    .line 178
    :cond_6
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p0, p0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {p0, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method

.method public updateFromSystem(Landroid/support/constraint/solver/ArrayRow;[Landroid/support/constraint/solver/ArrayRow;)V
    .locals 10

    .line 182
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 184
    iget-object v1, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v1}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v1, :cond_0

    .line 186
    new-instance v1, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v1}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    :cond_0
    const/4 v2, 0x0

    .line 188
    iput-object v2, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    move-object v4, v1

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_5

    .line 191
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v5, v5, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_4

    .line 193
    iget v6, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 194
    aget-object v5, p2, v5

    .line 195
    iget-boolean v7, v5, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v7, :cond_2

    .line 196
    iget-object v7, v5, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    check-cast v7, Landroid/support/constraint/solver/LinkedVariables;

    iget-object v7, v7, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_1
    if-eqz v7, :cond_2

    .line 198
    iget-object v8, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v8, v8, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v8}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/constraint/solver/LinkedVariables$Link;

    if-nez v8, :cond_1

    new-instance v8, Landroid/support/constraint/solver/LinkedVariables$Link;

    invoke-direct {v8}, Landroid/support/constraint/solver/LinkedVariables$Link;-><init>()V

    .line 199
    :cond_1
    iget-object v9, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput-object v9, v8, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 200
    iget v9, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    mul-float/2addr v9, v6

    iput v9, v8, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    .line 201
    iput-object v2, v8, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 202
    iput-object v8, v4, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 204
    iget-object v7, v7, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    move-object v4, v8

    goto :goto_1

    .line 207
    :cond_2
    iget v7, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    iget v8, v5, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    mul-float/2addr v8, v6

    add-float/2addr v7, v8

    iput v7, p1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    .line 208
    iget-object v5, v5, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v5, p1}, Landroid/support/constraint/solver/SolverVariable;->removeClientEquation(Landroid/support/constraint/solver/ArrayRow;)V

    if-nez v3, :cond_3

    .line 210
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v5, p0, Landroid/support/constraint/solver/LinkedVariables;->head:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_2

    .line 212
    :cond_3
    iget-object v5, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    iput-object v5, v3, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 214
    :goto_2
    iget-object v5, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v5, v5, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v5, v0}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 215
    iget v5, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Landroid/support/constraint/solver/LinkedVariables;->currentSize:I

    goto :goto_3

    :cond_4
    move-object v3, v0

    .line 219
    :goto_3
    iget-object v0, v0, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    goto :goto_0

    .line 221
    :cond_5
    iget-object p1, v1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    :goto_4
    if-eqz p1, :cond_6

    .line 223
    iget-object p2, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v0, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->value:F

    invoke-virtual {p0, p2, v0}, Landroid/support/constraint/solver/LinkedVariables;->add(Landroid/support/constraint/solver/SolverVariable;F)V

    .line 225
    iget-object p2, p1, Landroid/support/constraint/solver/LinkedVariables$Link;->next:Landroid/support/constraint/solver/LinkedVariables$Link;

    .line 226
    iget-object v0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0, p1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    move-object p1, p2

    goto :goto_4

    .line 228
    :cond_6
    iget-object p0, p0, Landroid/support/constraint/solver/LinkedVariables;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p0, p0, Landroid/support/constraint/solver/Cache;->linkedVariablesPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {p0, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method

.class public Landroid/support/constraint/solver/LinearSystem;
.super Ljava/lang/Object;
.source "LinearSystem.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final POOL_SIZE:I = 0x3e8


# instance fields
.field private TABLE_SIZE:I

.field private mAlreadyTestedCandidates:[Z

.field private final mCache:Landroid/support/constraint/solver/Cache;

.field private mGoal:Landroid/support/constraint/solver/ArrayRow;

.field private mMaxColumns:I

.field mMaxRows:I

.field mNumColumns:I

.field mNumRows:I

.field private mPoolVariables:[Landroid/support/constraint/solver/SolverVariable;

.field private mPoolVariablesCount:I

.field private mRows:[Landroid/support/constraint/solver/ArrayRow;

.field private mVariables:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/support/constraint/solver/SolverVariable;",
            ">;"
        }
    .end annotation
.end field

.field private mVariablesID:I

.field private tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

.field tempVars:[Landroid/support/constraint/solver/SolverVariable;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    const/4 v1, 0x0

    .line 44
    iput-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    const/16 v2, 0x20

    .line 51
    iput v2, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    .line 52
    iget v3, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    iput v3, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    .line 53
    iput-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    .line 56
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    new-array v1, v1, [Z

    iput-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    const/4 v1, 0x1

    .line 58
    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    .line 59
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    .line 60
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxRows:I

    const/16 v1, 0x3e8

    .line 64
    new-array v1, v1, [Landroid/support/constraint/solver/SolverVariable;

    iput-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariables:[Landroid/support/constraint/solver/SolverVariable;

    .line 65
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariablesCount:I

    const/16 v0, 0x100

    .line 395
    new-array v0, v0, [Landroid/support/constraint/solver/SolverVariable;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->tempVars:[Landroid/support/constraint/solver/SolverVariable;

    .line 429
    new-array v0, v2, [Landroid/support/constraint/solver/ArrayRow;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

    .line 68
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    new-array v0, v0, [Landroid/support/constraint/solver/ArrayRow;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    .line 69
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->releaseRows()V

    .line 70
    new-instance v0, Landroid/support/constraint/solver/Cache;

    invoke-direct {v0}, Landroid/support/constraint/solver/Cache;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    return-void
.end method

.method private final acquireSolverVariable(Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;
    .locals 3

    .line 253
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->solverVariablePool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_0

    .line 255
    new-instance v0, Landroid/support/constraint/solver/SolverVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    invoke-direct {v0, v1, p1}, Landroid/support/constraint/solver/SolverVariable;-><init>(Landroid/support/constraint/solver/Cache;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 257
    :cond_0
    invoke-virtual {v0}, Landroid/support/constraint/solver/SolverVariable;->reset()V

    .line 258
    invoke-virtual {v0, p1}, Landroid/support/constraint/solver/SolverVariable;->setType(Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 259
    iget-object p1, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariablesCount:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariablesCount:I

    aput-object v0, p1, v1

    return-object v0
.end method

.method private computeValues()V
    .locals 3

    const/4 v0, 0x0

    .line 767
    :goto_0
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v0, v1, :cond_0

    .line 768
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v1, v1, v0

    .line 769
    iget-object v2, v1, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v1, v1, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    iput v1, v2, Landroid/support/constraint/solver/SolverVariable;->computedValue:F

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private createVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;
    .locals 2

    .line 219
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_0

    .line 220
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->increaseTableSize()V

    .line 222
    :cond_0
    invoke-direct {p0, p2}, Landroid/support/constraint/solver/LinearSystem;->acquireSolverVariable(Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object p2

    .line 223
    invoke-virtual {p2, p1}, Landroid/support/constraint/solver/SolverVariable;->setName(Ljava/lang/String;)V

    .line 224
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    .line 225
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    .line 226
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    iput v0, p2, Landroid/support/constraint/solver/SolverVariable;->id:I

    .line 227
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    if-nez v0, :cond_1

    .line 228
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    .line 230
    :cond_1
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    iget-object p1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    aput-object p2, p1, p0

    return-object p2
.end method

.method private displaySolverVariables()V
    .locals 4

    .line 874
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Display Rows ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ") :\n\t | C | "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 875
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-gt v1, v2, :cond_0

    .line 876
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v2, v2, v1

    .line 877
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 878
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " | "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 880
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 881
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method private enforceBFS(Landroid/support/constraint/solver/ArrayRow;)I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v3, 0x0

    .line 648
    :goto_0
    iget v4, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    const/4 v5, 0x0

    if-ge v3, v4, :cond_2

    .line 649
    iget-object v4, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v4, v4, v3

    iget-object v4, v4, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 650
    iget-object v4, v4, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v7, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v4, v7, :cond_0

    goto :goto_1

    .line 653
    :cond_0
    iget-object v4, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v4, v4, v3

    iget v4, v4, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_1

    const/4 v3, 0x1

    goto :goto_2

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    :goto_2
    if-eqz v3, :cond_b

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_3
    if-nez v3, :cond_c

    add-int/lit8 v4, v4, 0x1

    const v7, 0x7f7fffff    # Float.MAX_VALUE

    const v8, 0x7fffffff

    const/4 v9, -0x1

    move v12, v7

    move v11, v8

    move v8, v9

    move v10, v8

    const/4 v7, 0x0

    .line 680
    :goto_4
    iget v13, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v7, v13, :cond_8

    .line 681
    iget-object v13, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v13, v13, v7

    .line 682
    iget-object v14, v13, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 683
    iget-object v14, v14, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v15, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v14, v15, :cond_3

    goto :goto_7

    .line 688
    :cond_3
    iget v14, v13, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    cmpg-float v14, v14, v5

    if-gez v14, :cond_7

    move v14, v12

    move v12, v11

    move v11, v10

    move v10, v8

    const/4 v8, 0x1

    .line 693
    :goto_5
    iget v15, v0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-ge v8, v15, :cond_6

    .line 694
    iget-object v15, v0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v15, v15, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v15, v15, v8

    .line 695
    iget-object v2, v13, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v2, v15}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v2

    cmpg-float v16, v2, v5

    if-gtz v16, :cond_4

    goto :goto_6

    .line 699
    :cond_4
    iget-object v6, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v6, v15}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v6

    div-float/2addr v6, v2

    .line 705
    iget v2, v15, Landroid/support/constraint/solver/SolverVariable;->strength:I

    if-gt v2, v12, :cond_5

    cmpg-float v2, v6, v14

    if-gez v2, :cond_5

    .line 709
    iget v2, v15, Landroid/support/constraint/solver/SolverVariable;->strength:I

    move v12, v2

    move v14, v6

    move v10, v7

    move v11, v8

    :cond_5
    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_6
    move v8, v10

    move v10, v11

    move v11, v12

    move v12, v14

    :cond_7
    :goto_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_8
    if-eq v8, v9, :cond_a

    .line 717
    iget-object v2, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v8

    .line 722
    iget-object v6, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput v9, v6, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    .line 723
    iget-object v6, v0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v6, v6, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v6, v6, v10

    invoke-virtual {v2, v6}, Landroid/support/constraint/solver/ArrayRow;->pivot(Landroid/support/constraint/solver/SolverVariable;)V

    .line 724
    iget-object v6, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput v8, v6, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v6, 0x0

    .line 726
    :goto_8
    iget v7, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v6, v7, :cond_9

    .line 727
    iget-object v7, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v7, v7, v6

    invoke-virtual {v7, v2}, Landroid/support/constraint/solver/ArrayRow;->updateRowWithEquation(Landroid/support/constraint/solver/ArrayRow;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 731
    :cond_9
    invoke-virtual {v1, v2}, Landroid/support/constraint/solver/ArrayRow;->updateRowWithEquation(Landroid/support/constraint/solver/ArrayRow;)Z

    goto/16 :goto_3

    :cond_a
    const/4 v3, 0x1

    goto/16 :goto_3

    :cond_b
    const/4 v4, 0x0

    :cond_c
    const/4 v1, 0x0

    .line 748
    :goto_9
    iget v2, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_f

    .line 749
    iget-object v2, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v1

    iget-object v2, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 750
    iget-object v2, v2, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v2, v3, :cond_d

    goto :goto_a

    .line 753
    :cond_d
    iget-object v2, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v1

    iget v2, v2, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    cmpg-float v2, v2, v5

    if-gez v2, :cond_e

    goto :goto_b

    :cond_e
    :goto_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_f
    :goto_b
    return v4
.end method

.method private getDisplaySize(I)Ljava/lang/String;
    .locals 1

    mul-int/lit8 p1, p1, 0x4

    .line 885
    div-int/lit16 p0, p1, 0x400

    div-int/lit16 v0, p0, 0x400

    if-lez v0, :cond_0

    .line 887
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " Mb"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    if-lez p0, :cond_1

    .line 891
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " Kb"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 893
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private optimize(Landroid/support/constraint/solver/ArrayRow;)I
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    move v3, v2

    .line 532
    :goto_0
    iget v4, v0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-ge v3, v4, :cond_0

    .line 533
    iget-object v4, v0, Landroid/support/constraint/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    aput-boolean v2, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    move v4, v3

    move v5, v4

    :goto_1
    if-nez v3, :cond_8

    add-int/lit8 v4, v4, 0x1

    .line 543
    iget-object v6, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v6}, Landroid/support/constraint/solver/ArrayLinkedVariables;->getPivotCandidate()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v6

    const/4 v7, 0x1

    if-eqz v6, :cond_2

    .line 548
    iget-object v8, v0, Landroid/support/constraint/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    iget v9, v6, Landroid/support/constraint/solver/SolverVariable;->id:I

    aget-boolean v8, v8, v9

    if-eqz v8, :cond_1

    const/4 v6, 0x0

    goto :goto_2

    .line 551
    :cond_1
    iget-object v8, v0, Landroid/support/constraint/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    iget v9, v6, Landroid/support/constraint/solver/SolverVariable;->id:I

    aput-boolean v7, v8, v9

    add-int/lit8 v5, v5, 0x1

    .line 553
    iget v8, v0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-lt v5, v8, :cond_2

    move v3, v7

    :cond_2
    :goto_2
    if-eqz v6, :cond_7

    const v8, 0x7f7fffff    # Float.MAX_VALUE

    .line 574
    iget-object v9, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v9, v6}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v9

    const/4 v10, -0x1

    move v12, v2

    move v13, v8

    move v11, v10

    move v8, v12

    .line 576
    :goto_3
    iget v14, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v8, v14, :cond_5

    .line 577
    iget-object v14, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v14, v14, v8

    .line 578
    iget-object v15, v14, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    .line 579
    iget-object v15, v15, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v15, v2, :cond_3

    goto :goto_4

    .line 583
    :cond_3
    invoke-virtual {v14, v6}, Landroid/support/constraint/solver/ArrayRow;->hasVariable(Landroid/support/constraint/solver/SolverVariable;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 586
    iget v2, v14, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    .line 587
    iget-object v2, v14, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v2, v6}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result v2

    const/4 v14, 0x0

    cmpl-float v14, v2, v14

    if-lez v14, :cond_4

    div-float v2, v9, v2

    .line 590
    iget v14, v6, Landroid/support/constraint/solver/SolverVariable;->strength:I

    if-lt v14, v12, :cond_4

    cmpg-float v14, v2, v13

    if-gez v14, :cond_4

    .line 592
    iget v11, v6, Landroid/support/constraint/solver/SolverVariable;->strength:I

    move v13, v2

    move v12, v11

    move v11, v8

    :cond_4
    :goto_4
    add-int/lit8 v8, v8, 0x1

    const/4 v2, 0x0

    goto :goto_3

    :cond_5
    if-le v11, v10, :cond_7

    .line 606
    iget-object v2, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v11

    .line 607
    iget-object v7, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput v10, v7, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    .line 608
    invoke-virtual {v2, v6}, Landroid/support/constraint/solver/ArrayRow;->pivot(Landroid/support/constraint/solver/SolverVariable;)V

    .line 609
    iget-object v6, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iput v11, v6, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v6, 0x0

    .line 611
    :goto_5
    iget v7, v0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v6, v7, :cond_6

    .line 612
    iget-object v7, v0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v7, v7, v6

    invoke-virtual {v7, v2}, Landroid/support/constraint/solver/ArrayRow;->updateRowWithEquation(Landroid/support/constraint/solver/ArrayRow;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 615
    :cond_6
    invoke-virtual {v1, v2}, Landroid/support/constraint/solver/ArrayRow;->updateRowWithEquation(Landroid/support/constraint/solver/ArrayRow;)Z

    goto :goto_6

    :cond_7
    move v3, v7

    :goto_6
    const/4 v2, 0x0

    goto/16 :goto_1

    :cond_8
    return v4
.end method

.method private releaseGoal()V
    .locals 1

    .line 108
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->arrayRowPool:Landroid/support/constraint/solver/Pools$Pool;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-interface {v0, p0}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method private releaseRows()V
    .locals 3

    const/4 v0, 0x0

    .line 95
    :goto_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 96
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    .line 98
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->arrayRowPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v2, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 100
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private updateRowFromVariables(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 1

    .line 403
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-lez v0, :cond_0

    .line 404
    iget-object v0, p1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {v0, p1, p0}, Landroid/support/constraint/solver/ArrayLinkedVariables;->updateFromSystem(Landroid/support/constraint/solver/ArrayRow;[Landroid/support/constraint/solver/ArrayRow;)V

    .line 405
    iget-object p0, p1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    iget p0, p0, Landroid/support/constraint/solver/ArrayLinkedVariables;->currentSize:I

    if-nez p0, :cond_0

    const/4 p0, 0x1

    .line 406
    iput-boolean p0, p1, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public addCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V
    .locals 11

    move/from16 v0, p8

    .line 952
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v10

    const/4 v9, 0x0

    move-object v1, v10

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    .line 953
    invoke-virtual/range {v1 .. v9}, Landroid/support/constraint/solver/ArrayRow;->createRowCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;

    .line 954
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v1

    .line 955
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    .line 956
    iput v0, v1, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 957
    iput v0, v2, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 958
    invoke-virtual {v10, v1, v2}, Landroid/support/constraint/solver/ArrayRow;->addError(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;)Landroid/support/constraint/solver/ArrayRow;

    move-object v0, p0

    .line 959
    invoke-virtual {v0, v10}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method public addConstraint(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 439
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxRows:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_2

    .line 440
    :cond_1
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->increaseTableSize()V

    .line 446
    :cond_2
    iget-boolean v0, p1, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v0, :cond_3

    .line 448
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/LinearSystem;->updateRowFromVariables(Landroid/support/constraint/solver/ArrayRow;)V

    .line 451
    invoke-virtual {p1}, Landroid/support/constraint/solver/ArrayRow;->ensurePositiveConstant()V

    .line 458
    invoke-virtual {p1}, Landroid/support/constraint/solver/ArrayRow;->pickRowVariable()V

    .line 460
    invoke-virtual {p1}, Landroid/support/constraint/solver/ArrayRow;->hasKeyVariable()Z

    move-result v0

    if-nez v0, :cond_3

    return-void

    .line 473
    :cond_3
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_4

    .line 474
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->arrayRowPool:Landroid/support/constraint/solver/Pools$Pool;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    aget-object v1, v1, v2

    invoke-interface {v0, v1}, Landroid/support/constraint/solver/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 476
    :cond_4
    iget-boolean v0, p1, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-nez v0, :cond_5

    .line 477
    invoke-virtual {p1}, Landroid/support/constraint/solver/ArrayRow;->updateClientEquations()V

    .line 479
    :cond_5
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    aput-object p1, v0, v1

    .line 480
    iget-object v0, p1, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    iput v1, v0, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    .line 481
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    .line 483
    iget-object v0, p1, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget v0, v0, Landroid/support/constraint/solver/SolverVariable;->mClientEquationsCount:I

    if-lez v0, :cond_9

    .line 485
    :goto_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

    array-length v1, v1

    if-ge v1, v0, :cond_6

    .line 486
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [Landroid/support/constraint/solver/ArrayRow;

    iput-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

    goto :goto_0

    .line 488
    :cond_6
    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->tempClientsCopy:[Landroid/support/constraint/solver/ArrayRow;

    const/4 v1, 0x0

    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_7

    .line 501
    iget-object v3, p1, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v3, v3, Landroid/support/constraint/solver/SolverVariable;->mClientEquations:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v3, v3, v2

    aput-object v3, p0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_7
    :goto_2
    if-ge v1, v0, :cond_9

    .line 505
    aget-object v2, p0, v1

    if-ne v2, p1, :cond_8

    goto :goto_3

    .line 510
    :cond_8
    iget-object v3, v2, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v3, v2, p1}, Landroid/support/constraint/solver/ArrayLinkedVariables;->updateFromRow(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/ArrayRow;)V

    .line 514
    invoke-virtual {v2}, Landroid/support/constraint/solver/ArrayRow;->updateClientEquations()V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_9
    return-void
.end method

.method public addConstraint(Landroid/support/constraint/solver/LinearEquation;)V
    .locals 0

    .line 150
    invoke-static {p0, p1}, Landroid/support/constraint/solver/EquationCreation;->createRowFromEquation(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/LinearEquation;)Landroid/support/constraint/solver/ArrayRow;

    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method public addEquality(Landroid/support/constraint/solver/SolverVariable;I)V
    .locals 3

    .line 992
    iget v0, p1, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    .line 993
    iget v1, p1, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 994
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v0, v1, v0

    .line 995
    iget-boolean v1, v0, Landroid/support/constraint/solver/ArrayRow;->isSimpleDefinition:Z

    if-eqz v1, :cond_0

    int-to-float p0, p2

    .line 996
    iput p0, v0, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    return-void

    .line 999
    :cond_0
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 1000
    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/solver/ArrayRow;->createRowEquals(Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 1001
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    goto :goto_0

    .line 1004
    :cond_1
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 1005
    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/solver/ArrayRow;->createRowDefinition(Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 1006
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    :goto_0
    return-void
.end method

.method public addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V
    .locals 1

    .line 973
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 974
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowEquals(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 975
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    .line 976
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p2

    .line 977
    iput p4, p1, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 978
    iput p4, p2, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 979
    invoke-virtual {v0, p1, p2}, Landroid/support/constraint/solver/ArrayRow;->addError(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;)Landroid/support/constraint/solver/ArrayRow;

    .line 980
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method addError(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 1

    .line 207
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 208
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p0

    .line 210
    invoke-virtual {p1, v0, p0}, Landroid/support/constraint/solver/ArrayRow;->addError(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;)Landroid/support/constraint/solver/ArrayRow;

    return-void
.end method

.method public addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V
    .locals 2

    .line 911
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 912
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createSlackVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v1

    .line 913
    iput p4, v1, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 914
    invoke-virtual {v0, p1, p2, v1, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 915
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method public addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V
    .locals 2

    .line 929
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 930
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createSlackVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v1

    .line 931
    iput p4, v1, Landroid/support/constraint/solver/SolverVariable;->strength:I

    .line 932
    invoke-virtual {v0, p1, p2, v1, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 933
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method addSingleError(Landroid/support/constraint/solver/ArrayRow;I)V
    .locals 0

    .line 214
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createErrorVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p0

    .line 215
    invoke-virtual {p1, p0, p2}, Landroid/support/constraint/solver/ArrayRow;->addSingleError(Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    return-void
.end method

.method createErrorVariable()Landroid/support/constraint/solver/SolverVariable;
    .locals 2

    .line 236
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_0

    .line 237
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->increaseTableSize()V

    .line 239
    :cond_0
    sget-object v0, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->acquireSolverVariable(Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 240
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    .line 241
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    .line 242
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    iput v1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    .line 243
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    aput-object v0, v1, p0

    return-object v0
.end method

.method public createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 158
    :cond_0
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    if-lt v1, v2, :cond_1

    .line 159
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->increaseTableSize()V

    .line 162
    :cond_1
    instance-of v1, p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_5

    .line 163
    check-cast p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    if-nez v0, :cond_2

    .line 165
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    invoke-virtual {p1, v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->resetSolverVariable(Landroid/support/constraint/solver/Cache;)V

    .line 166
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p1

    move-object v0, p1

    .line 168
    :cond_2
    iget p1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_3

    iget p1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    if-gt p1, v2, :cond_3

    iget-object p1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget v2, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    aget-object p1, p1, v2

    if-nez p1, :cond_5

    .line 171
    :cond_3
    iget p1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    if-eq p1, v1, :cond_4

    .line 172
    invoke-virtual {v0}, Landroid/support/constraint/solver/SolverVariable;->reset()V

    .line 174
    :cond_4
    iget p1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    .line 175
    iget p1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    .line 176
    iget p1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    iput p1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    .line 177
    sget-object p1, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    iput-object p1, v0, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    .line 178
    iget-object p1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object p1, p1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    aput-object v0, p1, p0

    :cond_5
    return-object v0
.end method

.method public createRow()Landroid/support/constraint/solver/ArrayRow;
    .locals 1

    .line 185
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v0, v0, Landroid/support/constraint/solver/Cache;->arrayRowPool:Landroid/support/constraint/solver/Pools$Pool;

    invoke-interface {v0}, Landroid/support/constraint/solver/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/ArrayRow;

    if-nez v0, :cond_0

    .line 187
    new-instance v0, Landroid/support/constraint/solver/ArrayRow;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    invoke-direct {v0, p0}, Landroid/support/constraint/solver/ArrayRow;-><init>(Landroid/support/constraint/solver/Cache;)V

    goto :goto_0

    .line 189
    :cond_0
    invoke-virtual {v0}, Landroid/support/constraint/solver/ArrayRow;->reset()V

    :goto_0
    return-object v0
.end method

.method public createSlackVariable()Landroid/support/constraint/solver/SolverVariable;
    .locals 2

    .line 195
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    if-lt v0, v1, :cond_0

    .line 196
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->increaseTableSize()V

    .line 198
    :cond_0
    sget-object v0, Landroid/support/constraint/solver/SolverVariable$Type;->SLACK:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->acquireSolverVariable(Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 199
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    .line 200
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    .line 201
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    iput v1, v0, Landroid/support/constraint/solver/SolverVariable;->id:I

    .line 202
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    aput-object v0, v1, p0

    return-object v0
.end method

.method public displayReadableRows()V
    .locals 3

    .line 804
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->displaySolverVariables()V

    const-string v0, ""

    const/4 v1, 0x0

    .line 806
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_0

    .line 807
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/support/constraint/solver/ArrayRow;->toReadableString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 808
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 810
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    if-eqz v1, :cond_1

    .line 811
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayRow;->toReadableString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\n"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 813
    :cond_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public displayRows()V
    .locals 3

    .line 791
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->displaySolverVariables()V

    const-string v0, ""

    const/4 v1, 0x0

    .line 793
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_0

    .line 794
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v0, v0, v1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 795
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 797
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    if-eqz v1, :cond_1

    .line 798
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\n"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 800
    :cond_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public displaySystemInformations()V
    .locals 7

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    .line 850
    :goto_0
    iget v3, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    if-ge v1, v3, :cond_1

    .line 851
    iget-object v3, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v3, v3, v1

    if-eqz v3, :cond_0

    .line 852
    iget-object v3, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Landroid/support/constraint/solver/ArrayRow;->sizeInBytes()I

    move-result v3

    add-int/2addr v2, v3

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v0

    move v3, v1

    .line 856
    :goto_1
    iget v4, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v4, :cond_3

    .line 857
    iget-object v4, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v4, v4, v1

    if-eqz v4, :cond_2

    .line 858
    iget-object v4, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Landroid/support/constraint/solver/ArrayRow;->sizeInBytes()I

    move-result v4

    add-int/2addr v3, v4

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 862
    :cond_3
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Linear System -> Table size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    iget v6, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    mul-int/2addr v5, v6

    .line 863
    invoke-direct {p0, v5}, Landroid/support/constraint/solver/LinearSystem;->getDisplaySize(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ") -- row sizes: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 864
    invoke-direct {p0, v2}, Landroid/support/constraint/solver/LinearSystem;->getDisplaySize(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", actual size: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 865
    invoke-direct {p0, v3}, Landroid/support/constraint/solver/LinearSystem;->getDisplaySize(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " rows: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxRows:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " cols: "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " occupied cells, "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 868
    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->getDisplaySize(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " "

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget p0, Landroid/support/constraint/solver/LinkedVariables;->sCreation:I

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " created Link variables"

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 862
    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public displayVariablesReadableRows()V
    .locals 4

    .line 817
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->displaySolverVariables()V

    const-string v0, ""

    const/4 v1, 0x0

    .line 819
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_1

    .line 820
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v1

    iget-object v2, v2, Landroid/support/constraint/solver/ArrayRow;->variable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v2, v2, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v2, v3, :cond_0

    .line 821
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/support/constraint/solver/ArrayRow;->toReadableString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 822
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 825
    :cond_1
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    if-eqz v1, :cond_2

    .line 826
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p0}, Landroid/support/constraint/solver/ArrayRow;->toReadableString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\n"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 828
    :cond_2
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public getCache()Landroid/support/constraint/solver/Cache;
    .locals 0

    .line 897
    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    return-object p0
.end method

.method public getGoal()Landroid/support/constraint/solver/ArrayRow;
    .locals 0

    .line 271
    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    return-object p0
.end method

.method public getMemoryUsed()I
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 833
    :goto_0
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v0, v2, :cond_1

    .line 834
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v0

    if-eqz v2, :cond_0

    .line 835
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/support/constraint/solver/ArrayRow;->sizeInBytes()I

    move-result v2

    add-int/2addr v1, v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public getNumEquations()I
    .locals 0

    .line 841
    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    return p0
.end method

.method public getNumVariables()I
    .locals 0

    .line 842
    iget p0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    return p0
.end method

.method public getObjectVariableValue(Ljava/lang/Object;)I
    .locals 0

    .line 286
    check-cast p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 288
    iget p0, p0, Landroid/support/constraint/solver/SolverVariable;->computedValue:F

    const/high16 p1, 0x3f000000    # 0.5f

    add-float/2addr p0, p1

    float-to-int p0, p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public getRow(I)Landroid/support/constraint/solver/ArrayRow;
    .locals 0

    .line 274
    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public getValueFor(Ljava/lang/String;)F
    .locals 1

    .line 278
    sget-object v0, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-virtual {p0, p1, v0}, Landroid/support/constraint/solver/LinearSystem;->getVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 282
    :cond_0
    iget p0, p0, Landroid/support/constraint/solver/SolverVariable;->computedValue:F

    return p0
.end method

.method public getVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;
    .locals 1

    .line 301
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 302
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    .line 304
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/SolverVariable;

    if-nez v0, :cond_1

    .line 306
    invoke-direct {p0, p1, p2}, Landroid/support/constraint/solver/LinearSystem;->createVariable(Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method increaseTableSize()V
    .locals 3

    .line 81
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    .line 82
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/solver/ArrayRow;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    .line 83
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/support/constraint/solver/SolverVariable;

    iput-object v1, v0, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    .line 84
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    new-array v0, v0, [Z

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mAlreadyTestedCandidates:[Z

    .line 85
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxColumns:I

    .line 86
    iget v0, p0, Landroid/support/constraint/solver/LinearSystem;->TABLE_SIZE:I

    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mMaxRows:I

    .line 87
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->releaseGoal()V

    const/4 v0, 0x0

    .line 88
    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    return-void
.end method

.method public minimize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 342
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->rebuildGoalFromErrors()V

    .line 343
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->minimizeGoal(Landroid/support/constraint/solver/ArrayRow;)V

    return-void
.end method

.method public minimizeGoal(Landroid/support/constraint/solver/ArrayRow;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 354
    iget-object v0, p1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {v0, p1, v1}, Landroid/support/constraint/solver/ArrayLinkedVariables;->updateFromSystem(Landroid/support/constraint/solver/ArrayRow;[Landroid/support/constraint/solver/ArrayRow;)V

    .line 360
    invoke-virtual {p1}, Landroid/support/constraint/solver/ArrayRow;->hasAtLeastOnePositiveVariable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 363
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->computeValues()V

    return-void

    .line 375
    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/LinearSystem;->enforceBFS(Landroid/support/constraint/solver/ArrayRow;)I

    .line 383
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/LinearSystem;->optimize(Landroid/support/constraint/solver/ArrayRow;)I

    .line 388
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->computeValues()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 390
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->computeValues()V

    .line 391
    throw p1
.end method

.method public rebuildGoalFromErrors()V
    .locals 4

    .line 319
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    invoke-virtual {v0}, Landroid/support/constraint/solver/ArrayRow;->reset()V

    goto :goto_0

    .line 322
    :cond_0
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    iput-object v0, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    :goto_0
    const/4 v0, 0x1

    .line 324
    :goto_1
    iget v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    if-ge v0, v1, :cond_2

    .line 325
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v1, v1, v0

    .line 326
    iget-object v2, v1, Landroid/support/constraint/solver/SolverVariable;->mType:Landroid/support/constraint/solver/SolverVariable$Type;

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v2, v3, :cond_1

    .line 328
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    iget-object v2, v2, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v1, v3}, Landroid/support/constraint/solver/ArrayLinkedVariables;->put(Landroid/support/constraint/solver/SolverVariable;F)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method replaceVariable(Landroid/support/constraint/solver/ArrayRow;Landroid/support/constraint/solver/SolverVariable;)V
    .locals 1

    .line 780
    iget p2, p2, Landroid/support/constraint/solver/SolverVariable;->definitionId:I

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 782
    iget-object p0, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object p0, p0, p2

    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/ArrayRow;->updateRowWithEquation(Landroid/support/constraint/solver/ArrayRow;)Z

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 117
    :goto_0
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 118
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v2, v2, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    .line 120
    invoke-virtual {v2}, Landroid/support/constraint/solver/SolverVariable;->reset()V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 123
    :cond_1
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->solverVariablePool:Landroid/support/constraint/solver/Pools$Pool;

    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariables:[Landroid/support/constraint/solver/SolverVariable;

    iget v3, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariablesCount:I

    invoke-interface {v1, v2, v3}, Landroid/support/constraint/solver/Pools$Pool;->releaseAll([Ljava/lang/Object;I)V

    .line 124
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mPoolVariablesCount:I

    .line 126
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mCache:Landroid/support/constraint/solver/Cache;

    iget-object v1, v1, Landroid/support/constraint/solver/Cache;->mIndexedVariables:[Landroid/support/constraint/solver/SolverVariable;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    if-eqz v1, :cond_2

    .line 128
    iget-object v1, p0, Landroid/support/constraint/solver/LinearSystem;->mVariables:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 130
    :cond_2
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mVariablesID:I

    .line 131
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->releaseGoal()V

    .line 132
    iput-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mGoal:Landroid/support/constraint/solver/ArrayRow;

    const/4 v1, 0x1

    .line 133
    iput v1, p0, Landroid/support/constraint/solver/LinearSystem;->mNumColumns:I

    move v1, v0

    .line 134
    :goto_1
    iget v2, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    if-ge v1, v2, :cond_3

    .line 135
    iget-object v2, p0, Landroid/support/constraint/solver/LinearSystem;->mRows:[Landroid/support/constraint/solver/ArrayRow;

    aget-object v2, v2, v1

    iput-boolean v0, v2, Landroid/support/constraint/solver/ArrayRow;->used:Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 137
    :cond_3
    invoke-direct {p0}, Landroid/support/constraint/solver/LinearSystem;->releaseRows()V

    .line 138
    iput v0, p0, Landroid/support/constraint/solver/LinearSystem;->mNumRows:I

    return-void
.end method

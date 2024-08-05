.class public Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;
.super Landroid/support/constraint/solver/widgets/WidgetContainer;
.source "ConstraintWidgetContainer.java"


# static fields
.field static ALLOW_ROOT_GROUP:Z = true

.field private static final DEBUG:Z = false

.field private static final USE_DIRECT_CHAIN_RESOLUTION:Z = true

.field private static final USE_SNAPSHOT:Z = true

.field private static final USE_THREAD:Z = false


# instance fields
.field protected mBackgroundSystem:Landroid/support/constraint/solver/LinearSystem;

.field private mDirectResolution:Z

.field private mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

.field private mHorizontalChainsSize:I

.field private mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

.field mPaddingBottom:I

.field mPaddingLeft:I

.field mPaddingRight:I

.field mPaddingTop:I

.field private mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

.field protected mSystem:Landroid/support/constraint/solver/LinearSystem;

.field private mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

.field private mVerticalChainsSize:I

.field mWrapHeight:I

.field mWrapWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 67
    invoke-direct {p0}, Landroid/support/constraint/solver/widgets/WidgetContainer;-><init>()V

    .line 36
    new-instance v0, Landroid/support/constraint/solver/LinearSystem;

    invoke-direct {v0}, Landroid/support/constraint/solver/LinearSystem;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mBackgroundSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 v0, 0x0

    .line 51
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 52
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    const/4 v0, 0x4

    .line 53
    new-array v1, v0, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 54
    new-array v1, v0, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 55
    new-array v0, v0, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 v0, 0x1

    .line 58
    iput-boolean v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 89
    invoke-direct {p0, p1, p2}, Landroid/support/constraint/solver/widgets/WidgetContainer;-><init>(II)V

    .line 36
    new-instance p1, Landroid/support/constraint/solver/LinearSystem;

    invoke-direct {p1}, Landroid/support/constraint/solver/LinearSystem;-><init>()V

    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mBackgroundSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 p1, 0x0

    .line 51
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 52
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    const/4 p1, 0x4

    .line 53
    new-array p2, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 54
    new-array p2, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 55
    new-array p1, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 79
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/constraint/solver/widgets/WidgetContainer;-><init>(IIII)V

    .line 36
    new-instance p1, Landroid/support/constraint/solver/LinearSystem;

    invoke-direct {p1}, Landroid/support/constraint/solver/LinearSystem;-><init>()V

    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mBackgroundSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 p1, 0x0

    .line 51
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 52
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    const/4 p1, 0x4

    .line 53
    new-array p2, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 54
    new-array p2, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 55
    new-array p1, p1, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    return-void
.end method

.method private addHorizontalChain(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 2

    const/4 v0, 0x0

    .line 1371
    :goto_0
    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    if-ge v0, v1, :cond_1

    .line 1372
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1376
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v1, v1

    if-lt v0, v1, :cond_2

    .line 1377
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1379
    :cond_2
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    aput-object p1, v0, v1

    .line 1380
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    return-void
.end method

.method private addVerticalChain(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 2

    const/4 v0, 0x0

    .line 1390
    :goto_0
    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    if-ge v0, v1, :cond_1

    .line 1391
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1395
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v1, v1

    if-lt v0, v1, :cond_2

    .line 1396
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1398
    :cond_2
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    aput-object p1, v0, v1

    .line 1399
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    return-void
.end method

.method private applyHorizontalChain(Landroid/support/constraint/solver/LinearSystem;)V
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    const/4 v11, 0x0

    move v12, v11

    .line 317
    :goto_0
    iget v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    if-ge v12, v1, :cond_29

    .line 318
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v13, v1, v12

    .line 319
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v12

    invoke-direct {v0, v1, v11}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->countMatchConstraintsChainedWidgets(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)I

    move-result v1

    .line 320
    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v3, 0x2

    const/4 v14, 0x1

    if-ne v2, v3, :cond_0

    move v15, v14

    goto :goto_1

    :cond_0
    move v15, v11

    .line 322
    :goto_1
    iget-object v2, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v4, :cond_1

    move v2, v14

    goto :goto_2

    :cond_1
    move v2, v11

    .line 323
    :goto_2
    iget-boolean v4, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainFixedPosition:Z

    if-eqz v4, :cond_2

    if-nez v15, :cond_2

    if-nez v2, :cond_2

    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-nez v2, :cond_2

    .line 326
    invoke-static {v0, v10, v1, v13}, Landroid/support/constraint/solver/widgets/Optimizer;->applyDirectResolutionHorizontalChain(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;ILandroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto/16 :goto_19

    :cond_2
    const/16 v16, 0x0

    if-eqz v1, :cond_13

    if-eqz v15, :cond_3

    goto/16 :goto_9

    :cond_3
    const/4 v2, 0x0

    move v4, v2

    move-object/from16 v2, v16

    :goto_3
    if-eqz v2, :cond_d

    .line 399
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_4

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v5, v2, :cond_4

    goto/16 :goto_5

    :cond_4
    if-ne v1, v14, :cond_7

    .line 428
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v11

    .line 429
    iget-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 430
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_5

    .line 431
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v2, v3

    .line 433
    :cond_5
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v4, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v3, v4, v2, v11}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 434
    iget-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 435
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_6

    .line 436
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v2, v3

    .line 438
    :cond_6
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v2, v2

    invoke-virtual {v10, v3, v1, v2, v11}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto/16 :goto_19

    :cond_7
    move v2, v11

    :goto_4
    add-int/lit8 v3, v1, -0x1

    if-ge v2, v3, :cond_28

    .line 441
    iget-object v5, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v5, v5, v2

    .line 442
    iget-object v6, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    add-int/lit8 v2, v2, 0x1

    aget-object v6, v6, v2

    .line 443
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 444
    iget-object v8, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 445
    iget-object v9, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 446
    iget-object v13, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 447
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v15}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v15

    .line 448
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_8

    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_8

    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v5, :cond_8

    .line 450
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v15, v11

    .line 452
    :cond_8
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v7, v11, v15, v14}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 453
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    .line 454
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v15, :cond_9

    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v15, :cond_9

    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v15, v5, :cond_9

    .line 456
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v15}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v15

    add-int/2addr v11, v15

    .line 458
    :cond_9
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v11, v11

    invoke-virtual {v10, v8, v15, v11, v14}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    if-ne v2, v3, :cond_c

    .line 461
    iget-object v3, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 462
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_a

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_a

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v6, :cond_a

    .line 464
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v3, v11

    .line 466
    :cond_a
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v9, v11, v3, v14}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 467
    iget-object v3, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 468
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_b

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_b

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v6, :cond_b

    .line 470
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v3, v11

    .line 472
    :cond_b
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v3, v3

    invoke-virtual {v10, v13, v11, v3, v14}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 475
    :cond_c
    invoke-virtual/range {p1 .. p1}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v3

    .line 476
    iget v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalWeight:F

    iget v15, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalWeight:F

    iget-object v14, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 478
    invoke-virtual {v14}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v20

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 479
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v22

    iget-object v5, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 480
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    iget-object v5, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 481
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v26

    move v5, v15

    move-object v15, v3

    move/from16 v16, v11

    move/from16 v17, v4

    move/from16 v18, v5

    move-object/from16 v19, v7

    move-object/from16 v21, v8

    move-object/from16 v23, v9

    move-object/from16 v25, v13

    .line 476
    invoke-virtual/range {v15 .. v26}, Landroid/support/constraint/solver/ArrayRow;->createRowEqualDimension(FFFLandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 482
    invoke-virtual {v10, v3}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    const/4 v11, 0x0

    const/4 v14, 0x1

    goto/16 :goto_4

    .line 400
    :cond_d
    :goto_5
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v5, v6, :cond_12

    .line 401
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    if-eqz v2, :cond_e

    .line 403
    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v5, v2

    .line 406
    :cond_e
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v6, :cond_f

    const/4 v2, 0x1

    goto :goto_6

    :cond_f
    move v2, v3

    .line 409
    :goto_6
    iget-object v6, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v6, v7, v5, v2}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 410
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 411
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_10

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v5, v13, :cond_10

    .line 412
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    add-int/2addr v2, v5

    .line 415
    :cond_10
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v5, v6, :cond_11

    const/4 v5, 0x1

    goto :goto_7

    :cond_11
    move v5, v3

    .line 418
    :goto_7
    iget-object v6, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v2, v2

    invoke-virtual {v10, v6, v7, v2, v5}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_8

    .line 420
    :cond_12
    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalWeight:F

    add-float/2addr v4, v2

    .line 421
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    const/4 v6, 0x0

    invoke-virtual {v10, v2, v5, v6, v6}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 422
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v2, v5, v6, v6}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 425
    :goto_8
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 v11, 0x0

    const/4 v14, 0x1

    move-object/from16 v27, v13

    move-object v13, v2

    move-object/from16 v2, v27

    goto/16 :goto_3

    :cond_13
    :goto_9
    move-object v11, v13

    move-object/from16 v1, v16

    :goto_a
    if-eqz v1, :cond_15

    .line 331
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_14

    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v2, v1, :cond_14

    goto :goto_b

    :cond_14
    const/4 v9, 0x0

    goto/16 :goto_16

    .line 333
    :cond_15
    :goto_b
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 334
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 335
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 336
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_16

    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    goto :goto_c

    :cond_16
    move-object/from16 v3, v16

    .line 337
    :goto_c
    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 338
    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_17

    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v14, v5

    goto :goto_d

    :cond_17
    move-object/from16 v14, v16

    :goto_d
    if-eqz v1, :cond_18

    .line 341
    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v1, v4

    goto :goto_e

    :cond_18
    move v1, v4

    :goto_e
    const/4 v9, 0x3

    if-eqz v3, :cond_1c

    if-ne v11, v13, :cond_19

    .line 344
    iget v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1a

    goto :goto_f

    :cond_19
    const/4 v6, 0x1

    :goto_f
    if-eqz v15, :cond_1b

    if-eq v11, v13, :cond_1b

    .line 346
    :cond_1a
    invoke-virtual {v10, v2, v3, v1, v9}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_10

    .line 348
    :cond_1b
    invoke-virtual {v10, v2, v3, v1, v6}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    :cond_1c
    :goto_10
    if-eqz v14, :cond_22

    .line 353
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 354
    iget-object v5, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_1d

    iget-object v5, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_11

    :cond_1d
    move-object/from16 v5, v16

    :goto_11
    if-ne v5, v11, :cond_1e

    .line 357
    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v1, v8

    move v5, v1

    const/4 v1, 0x0

    goto :goto_12

    :cond_1e
    move v5, v8

    const/4 v1, 0x1

    :goto_12
    if-nez v15, :cond_22

    if-eqz v1, :cond_1f

    .line 361
    iget v1, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    const/4 v6, 0x1

    if-ne v1, v6, :cond_20

    neg-int v1, v5

    .line 362
    invoke-virtual {v10, v7, v14, v1, v9}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_13

    :cond_1f
    const/4 v6, 0x1

    :cond_20
    neg-int v1, v5

    .line 364
    invoke-virtual {v10, v7, v14, v1, v6}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    if-eqz v3, :cond_21

    const/high16 v5, 0x3f000000    # 0.5f

    const/16 v17, 0x2

    move-object v1, v10

    move/from16 v18, v6

    move-object v6, v14

    move v0, v9

    move/from16 v9, v17

    .line 366
    invoke-virtual/range {v1 .. v9}, Landroid/support/constraint/solver/LinearSystem;->addCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_14

    :cond_21
    :goto_13
    move/from16 v18, v6

    move v0, v9

    goto :goto_14

    :cond_22
    move v0, v9

    const/16 v18, 0x1

    .line 372
    :goto_14
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v2, :cond_23

    .line 374
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    const/4 v9, 0x0

    invoke-virtual {v10, v1, v2, v9, v0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_15

    :cond_23
    const/4 v9, 0x0

    :goto_15
    if-eqz v14, :cond_24

    .line 378
    iget-object v0, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-object v1, v11

    move-object v11, v0

    move-object/from16 v0, p0

    goto/16 :goto_a

    :cond_24
    move-object v1, v11

    :goto_16
    if-eqz v15, :cond_27

    .line 385
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 386
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 387
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 388
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_25

    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v3, v0

    goto :goto_17

    :cond_25
    move-object/from16 v3, v16

    .line 389
    :goto_17
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 390
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_26

    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v6, v0

    goto :goto_18

    :cond_26
    move-object/from16 v6, v16

    :goto_18
    if-eqz v3, :cond_27

    if-eqz v6, :cond_27

    .line 392
    iget v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    const/4 v0, 0x2

    move-object v1, v10

    move v11, v9

    move v9, v0

    invoke-virtual/range {v1 .. v9}, Landroid/support/constraint/solver/LinearSystem;->addCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_19

    :cond_27
    move v11, v9

    :cond_28
    :goto_19
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_29
    return-void
.end method

.method private applyVerticalChain(Landroid/support/constraint/solver/LinearSystem;)V
    .locals 28

    move-object/from16 v0, p0

    move-object/from16 v10, p1

    const/4 v11, 0x0

    move v12, v11

    .line 496
    :goto_0
    iget v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    if-ge v12, v1, :cond_29

    .line 497
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v13, v1, v12

    .line 498
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsArray:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v12

    const/4 v14, 0x1

    invoke-direct {v0, v1, v14}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->countMatchConstraintsChainedWidgets(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)I

    move-result v1

    .line 499
    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    move v15, v14

    goto :goto_1

    :cond_0
    move v15, v11

    .line 501
    :goto_1
    iget-object v2, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v4, :cond_1

    move v2, v14

    goto :goto_2

    :cond_1
    move v2, v11

    .line 502
    :goto_2
    iget-boolean v4, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainFixedPosition:Z

    if-eqz v4, :cond_2

    if-nez v15, :cond_2

    if-nez v2, :cond_2

    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-nez v2, :cond_2

    .line 505
    invoke-static {v0, v10, v1, v13}, Landroid/support/constraint/solver/widgets/Optimizer;->applyDirectResolutionVerticalChain(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;ILandroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto/16 :goto_19

    :cond_2
    const/16 v16, 0x0

    if-eqz v1, :cond_13

    if-eqz v15, :cond_3

    goto/16 :goto_9

    :cond_3
    const/4 v2, 0x0

    move v4, v2

    move-object/from16 v2, v16

    :goto_3
    if-eqz v2, :cond_d

    .line 578
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_4

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v5, v2, :cond_4

    goto/16 :goto_5

    :cond_4
    if-ne v1, v14, :cond_7

    .line 607
    iget-object v1, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, v11

    .line 608
    iget-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 609
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_5

    .line 610
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v2, v3

    .line 612
    :cond_5
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v4, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v3, v4, v2, v11}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 613
    iget-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 614
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_6

    .line 615
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v2, v3

    .line 617
    :cond_6
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v2, v2

    invoke-virtual {v10, v3, v1, v2, v11}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto/16 :goto_19

    :cond_7
    move v2, v11

    :goto_4
    add-int/lit8 v3, v1, -0x1

    if-ge v2, v3, :cond_28

    .line 620
    iget-object v5, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v5, v5, v2

    .line 621
    iget-object v6, v0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    add-int/lit8 v2, v2, 0x1

    aget-object v6, v6, v2

    .line 622
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 623
    iget-object v8, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v8, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 624
    iget-object v9, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v9, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 625
    iget-object v13, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v13, v13, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 626
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v15}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v15

    .line 627
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_8

    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_8

    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v5, :cond_8

    .line 629
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v15, v11

    .line 631
    :cond_8
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v7, v11, v15, v14}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 632
    iget-object v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    .line 633
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v15, :cond_9

    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v15, :cond_9

    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v15, v5, :cond_9

    .line 635
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v15}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v15

    add-int/2addr v11, v15

    .line 637
    :cond_9
    iget-object v15, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v15, v15, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v11, v11

    invoke-virtual {v10, v8, v15, v11, v14}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    if-ne v2, v3, :cond_c

    .line 640
    iget-object v3, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 641
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_a

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_a

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v6, :cond_a

    .line 643
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v3, v11

    .line 645
    :cond_a
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v9, v11, v3, v14}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 646
    iget-object v3, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 647
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_b

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v11, :cond_b

    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v11, v6, :cond_b

    .line 649
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v11

    add-int/2addr v3, v11

    .line 651
    :cond_b
    iget-object v11, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v11, v11, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v3, v3

    invoke-virtual {v10, v13, v11, v3, v14}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 654
    :cond_c
    invoke-virtual/range {p1 .. p1}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v3

    .line 655
    iget v11, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalWeight:F

    iget v15, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalWeight:F

    iget-object v14, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 657
    invoke-virtual {v14}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v20

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 658
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v22

    iget-object v5, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 659
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v24

    iget-object v5, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 660
    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v26

    move v5, v15

    move-object v15, v3

    move/from16 v16, v11

    move/from16 v17, v4

    move/from16 v18, v5

    move-object/from16 v19, v7

    move-object/from16 v21, v8

    move-object/from16 v23, v9

    move-object/from16 v25, v13

    .line 655
    invoke-virtual/range {v15 .. v26}, Landroid/support/constraint/solver/ArrayRow;->createRowEqualDimension(FFFLandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;ILandroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    .line 661
    invoke-virtual {v10, v3}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/ArrayRow;)V

    const/4 v11, 0x0

    const/4 v14, 0x1

    goto/16 :goto_4

    .line 579
    :cond_d
    :goto_5
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v5, v6, :cond_12

    .line 580
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    if-eqz v2, :cond_e

    .line 582
    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    add-int/2addr v5, v2

    .line 585
    :cond_e
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v2, v6, :cond_f

    const/4 v2, 0x1

    goto :goto_6

    :cond_f
    move v2, v3

    .line 588
    :goto_6
    iget-object v6, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v6, v7, v5, v2}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 589
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v2

    .line 590
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_10

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v5, v13, :cond_10

    .line 591
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    add-int/2addr v2, v5

    .line 594
    :cond_10
    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v5, v6, :cond_11

    const/4 v5, 0x1

    goto :goto_7

    :cond_11
    move v5, v3

    .line 597
    :goto_7
    iget-object v6, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v7, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    neg-int v2, v2

    invoke-virtual {v10, v6, v7, v2, v5}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_8

    .line 599
    :cond_12
    iget v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalWeight:F

    add-float/2addr v4, v2

    .line 600
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    const/4 v6, 0x0

    invoke-virtual {v10, v2, v5, v6, v6}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 601
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {v10, v2, v5, v6, v6}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    .line 604
    :goto_8
    iget-object v2, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 v11, 0x0

    const/4 v14, 0x1

    move-object/from16 v27, v13

    move-object v13, v2

    move-object/from16 v2, v27

    goto/16 :goto_3

    :cond_13
    :goto_9
    move-object v11, v13

    move-object/from16 v1, v16

    :goto_a
    if-eqz v1, :cond_15

    .line 510
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_14

    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v2, v1, :cond_14

    goto :goto_b

    :cond_14
    const/4 v9, 0x0

    goto/16 :goto_16

    .line 512
    :cond_15
    :goto_b
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 513
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 514
    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 515
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_16

    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    goto :goto_c

    :cond_16
    move-object/from16 v3, v16

    .line 516
    :goto_c
    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 517
    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_17

    iget-object v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v14, v5

    goto :goto_d

    :cond_17
    move-object/from16 v14, v16

    :goto_d
    if-eqz v1, :cond_18

    .line 520
    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v1, v4

    goto :goto_e

    :cond_18
    move v1, v4

    :goto_e
    const/4 v9, 0x3

    if-eqz v3, :cond_1c

    if-ne v11, v13, :cond_19

    .line 523
    iget v5, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1a

    goto :goto_f

    :cond_19
    const/4 v6, 0x1

    :goto_f
    if-eqz v15, :cond_1b

    if-eq v11, v13, :cond_1b

    .line 525
    :cond_1a
    invoke-virtual {v10, v2, v3, v1, v9}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_10

    .line 527
    :cond_1b
    invoke-virtual {v10, v2, v3, v1, v6}, Landroid/support/constraint/solver/LinearSystem;->addGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    :cond_1c
    :goto_10
    if-eqz v14, :cond_22

    .line 532
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 533
    iget-object v5, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_1d

    iget-object v5, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_11

    :cond_1d
    move-object/from16 v5, v16

    :goto_11
    if-ne v5, v11, :cond_1e

    .line 536
    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    add-int/2addr v1, v8

    move v5, v1

    const/4 v1, 0x0

    goto :goto_12

    :cond_1e
    move v5, v8

    const/4 v1, 0x1

    :goto_12
    if-nez v15, :cond_22

    if-eqz v1, :cond_1f

    .line 540
    iget v1, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    const/4 v6, 0x1

    if-ne v1, v6, :cond_20

    neg-int v1, v5

    .line 541
    invoke-virtual {v10, v7, v14, v1, v9}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_13

    :cond_1f
    const/4 v6, 0x1

    :cond_20
    neg-int v1, v5

    .line 543
    invoke-virtual {v10, v7, v14, v1, v6}, Landroid/support/constraint/solver/LinearSystem;->addLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    if-eqz v3, :cond_21

    const/high16 v5, 0x3f000000    # 0.5f

    const/16 v17, 0x2

    move-object v1, v10

    move/from16 v18, v6

    move-object v6, v14

    move v0, v9

    move/from16 v9, v17

    .line 545
    invoke-virtual/range {v1 .. v9}, Landroid/support/constraint/solver/LinearSystem;->addCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_14

    :cond_21
    :goto_13
    move/from16 v18, v6

    move v0, v9

    goto :goto_14

    :cond_22
    move v0, v9

    const/16 v18, 0x1

    .line 551
    :goto_14
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v2, :cond_23

    .line 553
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget-object v2, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    const/4 v9, 0x0

    invoke-virtual {v10, v1, v2, v9, v0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_15

    :cond_23
    const/4 v9, 0x0

    :goto_15
    if-eqz v14, :cond_24

    .line 557
    iget-object v0, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-object v1, v11

    move-object v11, v0

    move-object/from16 v0, p0

    goto/16 :goto_a

    :cond_24
    move-object v1, v11

    :goto_16
    if-eqz v15, :cond_27

    .line 564
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 565
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    .line 566
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 567
    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_25

    iget-object v0, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v3, v0

    goto :goto_17

    :cond_25
    move-object/from16 v3, v16

    .line 568
    :goto_17
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 569
    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_26

    iget-object v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    move-object v6, v0

    goto :goto_18

    :cond_26
    move-object/from16 v6, v16

    :goto_18
    if-eqz v3, :cond_27

    if-eqz v6, :cond_27

    .line 571
    iget v5, v13, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    const/4 v0, 0x2

    move-object v1, v10

    move v11, v9

    move v9, v0

    invoke-virtual/range {v1 .. v9}, Landroid/support/constraint/solver/LinearSystem;->addCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)V

    goto :goto_19

    :cond_27
    move v11, v9

    :cond_28
    :goto_19
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_0

    :cond_29
    return-void
.end method

.method private countMatchConstraintsChainedWidgets(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)I
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_8

    .line 1412
    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_0

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p0, :cond_0

    move-object p2, p1

    move v0, v1

    move v2, v0

    goto :goto_0

    :cond_0
    move-object p2, p1

    move v2, v0

    move v0, v1

    .line 1416
    :goto_0
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_6

    .line 1417
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_2

    add-int/lit8 v3, v0, 0x1

    .line 1418
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v4, v4

    if-lt v3, v4, :cond_1

    .line 1419
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x2

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1421
    :cond_1
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object p2, v4, v0

    move v0, v3

    .line 1423
    :cond_2
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v3, :cond_3

    goto :goto_1

    .line 1426
    :cond_3
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq v3, p2, :cond_4

    goto :goto_1

    .line 1429
    :cond_4
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v3, p2, :cond_5

    goto :goto_1

    .line 1432
    :cond_5
    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_0

    .line 1434
    :cond_6
    :goto_1
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_7

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p0, :cond_7

    goto :goto_2

    :cond_7
    move v1, v2

    .line 1439
    :goto_2
    iput-boolean v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainFixedPosition:Z

    goto/16 :goto_6

    .line 1443
    :cond_8
    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_9

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p0, :cond_9

    move-object p2, p1

    move v0, v1

    move v2, v0

    goto :goto_3

    :cond_9
    move-object p2, p1

    move v2, v0

    move v0, v1

    .line 1446
    :goto_3
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_f

    .line 1447
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_b

    add-int/lit8 v3, v0, 0x1

    .line 1448
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v4, v4

    if-lt v3, v4, :cond_a

    .line 1449
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    array-length v5, v5

    mul-int/lit8 v5, v5, 0x2

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1451
    :cond_a
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mMatchConstraintsChainedWidgets:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object p2, v4, v0

    move v0, v3

    .line 1453
    :cond_b
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v3, :cond_c

    goto :goto_4

    .line 1456
    :cond_c
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq v3, p2, :cond_d

    goto :goto_4

    .line 1459
    :cond_d
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-ne v3, p2, :cond_e

    goto :goto_4

    .line 1462
    :cond_e
    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_3

    .line 1464
    :cond_f
    :goto_4
    iget-object v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_10

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p0, :cond_10

    goto :goto_5

    :cond_10
    move v1, v2

    .line 1469
    :goto_5
    iput-boolean v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainFixedPosition:Z

    :goto_6
    return v0
.end method

.method public static createContainer(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Ljava/lang/String;Ljava/util/ArrayList;I)Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/widgets/ConstraintWidget;",
            ">;I)",
            "Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;"
        }
    .end annotation

    .line 136
    invoke-static {p2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getBounds(Ljava/util/ArrayList;)Landroid/support/constraint/solver/widgets/Rectangle;

    move-result-object v0

    .line 137
    iget v1, v0, Landroid/support/constraint/solver/widgets/Rectangle;->width:I

    if-eqz v1, :cond_5

    iget v1, v0, Landroid/support/constraint/solver/widgets/Rectangle;->height:I

    if-nez v1, :cond_0

    goto :goto_2

    :cond_0
    if-lez p3, :cond_2

    .line 141
    iget v1, v0, Landroid/support/constraint/solver/widgets/Rectangle;->x:I

    iget v2, v0, Landroid/support/constraint/solver/widgets/Rectangle;->y:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-le p3, v1, :cond_1

    move p3, v1

    .line 145
    :cond_1
    invoke-virtual {v0, p3, p3}, Landroid/support/constraint/solver/widgets/Rectangle;->grow(II)V

    .line 147
    :cond_2
    iget p3, v0, Landroid/support/constraint/solver/widgets/Rectangle;->x:I

    iget v1, v0, Landroid/support/constraint/solver/widgets/Rectangle;->y:I

    invoke-virtual {p0, p3, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setOrigin(II)V

    .line 148
    iget p3, v0, Landroid/support/constraint/solver/widgets/Rectangle;->width:I

    iget v1, v0, Landroid/support/constraint/solver/widgets/Rectangle;->height:I

    invoke-virtual {p0, p3, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setDimension(II)V

    .line 149
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setDebugName(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 151
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {p3}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object p3

    .line 152
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_0
    if-ge p1, v1, :cond_4

    .line 153
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 154
    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v3

    if-eq v3, p3, :cond_3

    goto :goto_1

    .line 157
    :cond_3
    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->add(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 158
    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getX()I

    move-result v3

    iget v4, v0, Landroid/support/constraint/solver/widgets/Rectangle;->x:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setX(I)V

    .line 159
    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getY()I

    move-result v3

    iget v4, v0, Landroid/support/constraint/solver/widgets/Rectangle;->y:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setY(I)V

    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_4
    return-object p0

    :cond_5
    :goto_2
    const/4 p0, 0x0

    return-object p0
.end method

.method private optimize(Landroid/support/constraint/solver/LinearSystem;)Z
    .locals 13

    .line 217
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 222
    iget-boolean v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_c

    move v1, v3

    :goto_0
    if-ge v1, v0, :cond_2

    .line 224
    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 226
    iput v2, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 227
    iput v2, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 228
    iget-object v6, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v7, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v6, v7, :cond_0

    iget-object v6, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v7, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v6, v7, :cond_1

    .line 230
    :cond_0
    iput v4, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 231
    iput v4, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    move v1, v3

    move v5, v1

    move v6, v5

    :goto_1
    if-nez v1, :cond_c

    move v7, v3

    move v8, v7

    move v9, v8

    :goto_2
    if-ge v7, v0, :cond_9

    .line 244
    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 245
    iget v11, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    if-ne v11, v2, :cond_4

    .line 246
    iget-object v11, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v12, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v11, v12, :cond_3

    .line 247
    iput v4, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    goto :goto_3

    .line 250
    :cond_3
    invoke-static {p0, p1, v10}, Landroid/support/constraint/solver/widgets/Optimizer;->checkHorizontalSimpleDependency(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 253
    :cond_4
    :goto_3
    iget v11, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    if-ne v11, v2, :cond_6

    .line 254
    iget-object v11, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    sget-object v12, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v11, v12, :cond_5

    .line 255
    iput v4, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    goto :goto_4

    .line 258
    :cond_5
    invoke-static {p0, p1, v10}, Landroid/support/constraint/solver/widgets/Optimizer;->checkVerticalSimpleDependency(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 266
    :cond_6
    :goto_4
    iget v11, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    if-ne v11, v2, :cond_7

    add-int/lit8 v8, v8, 0x1

    .line 269
    :cond_7
    iget v10, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    if-ne v10, v2, :cond_8

    add-int/lit8 v9, v9, 0x1

    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_9
    if-nez v8, :cond_a

    if-nez v9, :cond_a

    :goto_5
    move v1, v4

    goto :goto_6

    :cond_a
    if-ne v5, v8, :cond_b

    if-ne v6, v9, :cond_b

    goto :goto_5

    :cond_b
    :goto_6
    move v5, v8

    move v6, v9

    goto :goto_1

    :cond_c
    move p1, v3

    move v1, p1

    move v5, v1

    :goto_7
    if-ge p1, v0, :cond_12

    .line 290
    iget-object v6, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 291
    iget-boolean v7, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    if-nez v7, :cond_d

    .line 292
    iput v4, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 293
    iput v4, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    goto :goto_8

    .line 295
    :cond_d
    iget v7, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    if-eq v7, v4, :cond_e

    iget v7, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    if-ne v7, v2, :cond_f

    :cond_e
    add-int/lit8 v1, v1, 0x1

    .line 299
    :cond_f
    iget v7, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    if-eq v7, v4, :cond_10

    iget v6, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    if-ne v6, v2, :cond_11

    :cond_10
    add-int/lit8 v5, v5, 0x1

    :cond_11
    :goto_8
    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    .line 305
    :cond_12
    iget-boolean p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    if-eqz p0, :cond_13

    if-nez v1, :cond_13

    if-nez v5, :cond_13

    return v4

    :cond_13
    return v3
.end method

.method private resetChains()V
    .locals 1

    const/4 v0, 0x0

    .line 1331
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    .line 1332
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    return-void
.end method

.method static setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I
    .locals 2

    .line 790
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 791
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    if-nez v1, :cond_0

    return p1

    :cond_0
    if-gt v0, p1, :cond_1

    return v0

    .line 798
    :cond_1
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 799
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOpposite()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v0

    .line 800
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_2

    .line 802
    invoke-static {v0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result p1

    :cond_2
    if-eqz v1, :cond_3

    .line 803
    invoke-static {v1, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result p1

    :cond_3
    if-eqz v0, :cond_4

    .line 804
    invoke-static {v0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result p1

    .line 806
    :cond_4
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    return p1
.end method


# virtual methods
.method addChain(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)V
    .locals 1

    if-nez p2, :cond_1

    .line 1345
    :goto_0
    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_0

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_0

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-ne p2, v0, :cond_0

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p1, :cond_0

    .line 1349
    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_0

    .line 1351
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->addHorizontalChain(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto :goto_2

    :cond_1
    const/4 v0, 0x1

    if-ne p2, v0, :cond_3

    .line 1354
    :goto_1
    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_2

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p2, :cond_2

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-ne p2, v0, :cond_2

    iget-object p2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p2, p2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq p2, p1, :cond_2

    .line 1358
    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p1, p1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    goto :goto_1

    .line 1360
    :cond_2
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->addVerticalChain(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    :cond_3
    :goto_2
    return-void
.end method

.method public addChildrenToSolver(Landroid/support/constraint/solver/LinearSystem;I)Z
    .locals 6

    .line 174
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->addToSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 175
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 176
    iget-boolean v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-direct {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->optimize(Landroid/support/constraint/solver/LinearSystem;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v2

    :cond_0
    :goto_0
    if-ge v2, v0, :cond_6

    .line 180
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 181
    instance-of v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;

    if-eqz v3, :cond_4

    .line 182
    iget-object v3, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 183
    iget-object v4, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalDimensionBehaviour:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    .line 184
    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v5, :cond_1

    .line 185
    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    invoke-virtual {v1, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setHorizontalDimensionBehaviour(Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 187
    :cond_1
    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v5, :cond_2

    .line 188
    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    invoke-virtual {v1, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setVerticalDimensionBehaviour(Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 190
    :cond_2
    invoke-virtual {v1, p1, p2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->addToSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 191
    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v5, :cond_3

    .line 192
    invoke-virtual {v1, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setHorizontalDimensionBehaviour(Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    .line 194
    :cond_3
    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v3, :cond_5

    .line 195
    invoke-virtual {v1, v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setVerticalDimensionBehaviour(Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;)V

    goto :goto_1

    .line 198
    :cond_4
    invoke-virtual {v1, p1, p2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->addToSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    :cond_5
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 201
    :cond_6
    iget p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mHorizontalChainsSize:I

    if-lez p2, :cond_7

    .line 202
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->applyHorizontalChain(Landroid/support/constraint/solver/LinearSystem;)V

    .line 204
    :cond_7
    iget p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mVerticalChainsSize:I

    if-lez p2, :cond_8

    .line 205
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->applyVerticalChain(Landroid/support/constraint/solver/LinearSystem;)V

    :cond_8
    const/4 p0, 0x1

    return p0
.end method

.method public findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 7

    .line 831
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapWidth()I

    move-result v0

    const/4 v1, 0x1

    .line 838
    iput-boolean v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    .line 839
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 840
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getX()I

    move-result v1

    add-int/2addr v1, v0

    move v3, v0

    goto/16 :goto_3

    .line 842
    :cond_0
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_1

    .line 843
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOwner()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    .line 844
    iget-object v3, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v3, v0

    .line 845
    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v4

    if-nez v4, :cond_2

    iget-boolean v4, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v4, :cond_2

    .line 846
    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto :goto_0

    :cond_1
    move v3, v0

    move-object v1, v2

    .line 849
    :cond_2
    :goto_0
    iget-object v4, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 850
    iget-object v4, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOwner()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v4

    .line 851
    iget-object v5, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v5

    add-int/2addr v0, v5

    .line 852
    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v5

    if-nez v5, :cond_4

    iget-boolean v5, v4, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v5, :cond_4

    .line 853
    invoke-virtual {p0, v4}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto :goto_1

    :cond_3
    move-object v4, v2

    .line 857
    :cond_4
    :goto_1
    iget-object v5, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v5, :cond_6

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v5

    if-nez v5, :cond_6

    .line 858
    iget-object v5, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mType:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v5, v6, :cond_5

    .line 859
    iget v5, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToRight:I

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapWidth()I

    move-result v1

    sub-int/2addr v5, v1

    add-int/2addr v3, v5

    goto :goto_2

    .line 860
    :cond_5
    iget-object v5, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object v5

    sget-object v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v5, v6, :cond_6

    .line 861
    iget v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToRight:I

    add-int/2addr v3, v1

    .line 865
    :cond_6
    :goto_2
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_8

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v1

    if-nez v1, :cond_8

    .line 866
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object v1

    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v1, v5, :cond_7

    .line 867
    iget v1, v4, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToLeft:I

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapWidth()I

    move-result v4

    sub-int/2addr v1, v4

    add-int/2addr v1, v0

    goto :goto_3

    .line 868
    :cond_7
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object v1

    sget-object v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v1, v5, :cond_8

    .line 869
    iget v1, v4, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToLeft:I

    add-int/2addr v1, v0

    goto :goto_3

    :cond_8
    move v1, v0

    .line 873
    :goto_3
    iput v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToLeft:I

    .line 874
    iput v3, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToRight:I

    .line 877
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapHeight()I

    move-result v0

    .line 881
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v1, :cond_9

    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v1, :cond_9

    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v1, :cond_9

    .line 882
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getY()I

    move-result p0

    add-int/2addr p0, v0

    goto/16 :goto_7

    .line 884
    :cond_9
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 885
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOwner()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    .line 886
    iget-boolean v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v2, :cond_a

    .line 887
    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 889
    :cond_a
    iget p0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    if-le p0, v0, :cond_b

    .line 890
    iget p0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    goto :goto_4

    :cond_b
    move p0, v0

    .line 892
    :goto_4
    iget v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    if-le v2, v0, :cond_c

    .line 893
    iget v0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    .line 895
    :cond_c
    iput v0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    .line 896
    iput p0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    return-void

    .line 900
    :cond_d
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 901
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOwner()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    .line 902
    iget-object v3, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    add-int/2addr v3, v0

    .line 903
    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v4

    if-nez v4, :cond_f

    iget-boolean v4, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v4, :cond_f

    .line 904
    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    goto :goto_5

    :cond_e
    move v3, v0

    move-object v1, v2

    .line 909
    :cond_f
    :goto_5
    iget-object v4, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 910
    iget-object v2, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOwner()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v2

    .line 911
    iget-object v4, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    add-int/2addr v0, v4

    .line 912
    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v4

    if-nez v4, :cond_10

    iget-boolean v4, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v4, :cond_10

    .line 913
    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 920
    :cond_10
    iget-object p0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz p0, :cond_12

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result p0

    if-nez p0, :cond_12

    .line 921
    iget-object p0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object p0

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->TOP:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne p0, v4, :cond_11

    .line 922
    iget p0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapHeight()I

    move-result v1

    sub-int/2addr p0, v1

    add-int/2addr v3, p0

    goto :goto_6

    .line 923
    :cond_11
    iget-object p0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object p0

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne p0, v4, :cond_12

    .line 924
    iget p0, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    add-int/2addr v3, p0

    :cond_12
    :goto_6
    move p0, v3

    .line 927
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v1, :cond_14

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v1

    if-nez v1, :cond_14

    .line 928
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object v1

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v1, v3, :cond_13

    .line 929
    iget v1, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapHeight()I

    move-result v2

    sub-int/2addr v1, v2

    add-int/2addr v0, v1

    goto :goto_7

    .line 930
    :cond_13
    iget-object v1, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getType()Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    move-result-object v1

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->TOP:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v1, v3, :cond_14

    .line 931
    iget v1, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    add-int/2addr v0, v1

    .line 935
    :cond_14
    :goto_7
    iput p0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    .line 936
    iput v0, p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    return-void
.end method

.method public findWrapSize(Ljava/util/ArrayList;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/widgets/ConstraintWidget;",
            ">;)V"
        }
    .end annotation

    .line 952
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    :goto_0
    if-ge v2, v0, :cond_2

    .line 954
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 955
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isRoot()Z

    move-result v10

    if-eqz v10, :cond_0

    goto :goto_1

    .line 958
    :cond_0
    iget-boolean v10, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    if-nez v10, :cond_1

    .line 959
    invoke-virtual {p0, v9}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->findWrapRecursive(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 961
    :cond_1
    iget v10, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToLeft:I

    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToRight:I

    add-int/2addr v10, v11

    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapWidth()I

    move-result v11

    sub-int/2addr v10, v11

    .line 962
    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    iget v12, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    add-int/2addr v11, v12

    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWrapHeight()I

    move-result v12

    sub-int/2addr v11, v12

    .line 963
    iget v12, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToLeft:I

    invoke-static {v3, v12}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 964
    iget v12, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToRight:I

    invoke-static {v4, v12}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 965
    iget v12, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToBottom:I

    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 966
    iget v9, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDistToTop:I

    invoke-static {v6, v9}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 967
    invoke-static {v5, v10}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 968
    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 970
    :cond_2
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 971
    invoke-static {v2, v5}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mWrapWidth:I

    .line 972
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 973
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mWrapHeight:I

    move p0, v1

    :goto_2
    if-ge p0, v0, :cond_3

    .line 976
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-boolean v1, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWrapVisited:Z

    add-int/lit8 p0, p0, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method public getHorizontalGuidelines()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/widgets/Guideline;",
            ">;"
        }
    .end annotation

    .line 1310
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1311
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 1312
    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1313
    instance-of v4, v3, Landroid/support/constraint/solver/widgets/Guideline;

    if-eqz v4, :cond_0

    .line 1314
    check-cast v3, Landroid/support/constraint/solver/widgets/Guideline;

    .line 1315
    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/Guideline;->getOrientation()I

    move-result v4

    if-nez v4, :cond_0

    .line 1316
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getSystem()Landroid/support/constraint/solver/LinearSystem;
    .locals 0

    .line 1324
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    const-string p0, "ConstraintLayout"

    return-object p0
.end method

.method public getVerticalGuidelines()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/widgets/Guideline;",
            ">;"
        }
    .end annotation

    .line 1291
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1292
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 1293
    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1294
    instance-of v4, v3, Landroid/support/constraint/solver/widgets/Guideline;

    if-eqz v4, :cond_0

    .line 1295
    check-cast v3, Landroid/support/constraint/solver/widgets/Guideline;

    .line 1296
    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/Guideline;->getOrientation()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 1297
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public handlesInternalConstraints()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isAnimating()Z
    .locals 5

    .line 1260
    invoke-super {p0}, Landroid/support/constraint/solver/widgets/WidgetContainer;->isAnimating()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 1263
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    .line 1264
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1265
    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->isAnimating()Z

    move-result v4

    if-eqz v4, :cond_1

    return v1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method public layout()V
    .locals 7

    .line 703
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 704
    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 705
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    .line 706
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    .line 707
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mParent:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 708
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    if-nez v2, :cond_0

    .line 709
    new-instance v2, Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-direct {v2, p0}, Landroid/support/constraint/solver/widgets/Snapshot;-><init>(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    iput-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    .line 711
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-virtual {v2, p0}, Landroid/support/constraint/solver/widgets/Snapshot;->updateFrom(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 716
    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setX(I)V

    .line 717
    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setY(I)V

    .line 718
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetAnchors()V

    .line 719
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearSystem;->getCache()Landroid/support/constraint/solver/Cache;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetSolverVariables(Landroid/support/constraint/solver/Cache;)V

    goto :goto_0

    .line 721
    :cond_1
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 722
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 726
    :goto_0
    invoke-direct {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetChains()V

    .line 730
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_1
    if-ge v3, v2, :cond_3

    .line 732
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 733
    instance-of v5, v4, Landroid/support/constraint/solver/widgets/WidgetContainer;

    if-eqz v5, :cond_2

    .line 734
    check-cast v4, Landroid/support/constraint/solver/widgets/WidgetContainer;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/WidgetContainer;->layout()V

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    const/4 v2, 0x1

    const v3, 0x7fffffff

    .line 741
    :try_start_0
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v4}, Landroid/support/constraint/solver/LinearSystem;->reset()V

    .line 751
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {p0, v4, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->addChildrenToSolver(Landroid/support/constraint/solver/LinearSystem;I)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v4, :cond_4

    .line 753
    :try_start_1
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearSystem;->minimize()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    move v6, v4

    move-object v4, v2

    move v2, v6

    goto :goto_3

    :cond_4
    :goto_2
    move v2, v4

    goto :goto_4

    :catch_1
    move-exception v4

    .line 756
    :goto_3
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :goto_4
    if-eqz v2, :cond_5

    .line 759
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {p0, v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateChildrenFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    goto :goto_5

    .line 761
    :cond_5
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {p0, v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 764
    :goto_5
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mParent:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eqz v2, :cond_6

    .line 765
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v0

    .line 766
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v1

    .line 768
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-virtual {v2, p0}, Landroid/support/constraint/solver/widgets/Snapshot;->applyTo(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 769
    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    add-int/2addr v0, v2

    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingRight:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 770
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    add-int/2addr v1, v0

    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingBottom:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setHeight(I)V

    goto :goto_6

    .line 772
    :cond_6
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 773
    iput v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 775
    :goto_6
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v0}, Landroid/support/constraint/solver/LinearSystem;->getCache()Landroid/support/constraint/solver/Cache;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetSolverVariables(Landroid/support/constraint/solver/Cache;)V

    .line 776
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getRootConstraintContainer()Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;

    move-result-object v0

    if-ne p0, v0, :cond_7

    .line 777
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateDrawPosition()V

    :cond_7
    return-void
.end method

.method public layoutFindGroups()I
    .locals 13

    const/4 v0, 0x5

    .line 984
    new-array v0, v0, [Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    const/4 v3, 0x1

    aput-object v1, v0, v3

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->TOP:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    const/4 v4, 0x2

    aput-object v1, v0, v4

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->BASELINE:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    const/4 v4, 0x3

    aput-object v1, v0, v4

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    const/4 v4, 0x4

    aput-object v1, v0, v4

    .line 990
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v4, v2

    move v5, v3

    :goto_0
    const v6, 0x7fffffff

    if-ge v4, v1, :cond_a

    .line 992
    iget-object v7, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 995
    iget-object v8, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 996
    iget-object v9, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v9, :cond_0

    .line 997
    invoke-static {v8, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result v8

    if-ne v8, v5, :cond_1

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1001
    :cond_0
    iput v6, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1004
    :cond_1
    :goto_1
    iget-object v8, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1005
    iget-object v9, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v9, :cond_2

    .line 1006
    invoke-static {v8, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result v8

    if-ne v8, v5, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1010
    :cond_2
    iput v6, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1013
    :cond_3
    :goto_2
    iget-object v8, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1014
    iget-object v9, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v9, :cond_4

    .line 1015
    invoke-static {v8, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result v8

    if-ne v8, v5, :cond_5

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1019
    :cond_4
    iput v6, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1022
    :cond_5
    :goto_3
    iget-object v8, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1023
    iget-object v9, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v9, :cond_6

    .line 1024
    invoke-static {v8, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result v8

    if-ne v8, v5, :cond_7

    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 1028
    :cond_6
    iput v6, v8, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1031
    :cond_7
    :goto_4
    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1032
    iget-object v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v8, :cond_8

    .line 1033
    invoke-static {v7, v5}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setGroup(Landroid/support/constraint/solver/widgets/ConstraintAnchor;I)I

    move-result v6

    if-ne v6, v5, :cond_9

    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1037
    :cond_8
    iput v6, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    :cond_9
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_a
    move v4, v3

    :goto_6
    if-eqz v4, :cond_12

    move v4, v2

    move v5, v4

    :goto_7
    if-ge v4, v1, :cond_11

    .line 1050
    iget-object v7, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move v8, v5

    move v5, v2

    .line 1051
    :goto_8
    array-length v9, v0

    if-ge v5, v9, :cond_10

    .line 1052
    aget-object v9, v0, v5

    const/4 v10, 0x0

    .line 1054
    sget-object v11, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer$2;->$SwitchMap$android$support$constraint$solver$widgets$ConstraintAnchor$Type:[I

    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->ordinal()I

    move-result v9

    aget v9, v11, v9

    packed-switch v9, :pswitch_data_0

    goto :goto_9

    .line 1072
    :pswitch_0
    iget-object v10, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    goto :goto_9

    .line 1068
    :pswitch_1
    iget-object v10, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    goto :goto_9

    .line 1064
    :pswitch_2
    iget-object v10, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    goto :goto_9

    .line 1060
    :pswitch_3
    iget-object v10, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    goto :goto_9

    .line 1056
    :pswitch_4
    iget-object v10, v7, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1076
    :goto_9
    iget-object v9, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v9, :cond_b

    goto :goto_c

    .line 1081
    :cond_b
    iget-object v11, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v11

    if-eqz v11, :cond_d

    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iget v12, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v11, v12, :cond_d

    .line 1082
    iget v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-le v8, v11, :cond_c

    iget v8, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    goto :goto_a

    :cond_c
    iget v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    :goto_a
    iput v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iput v8, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    move v8, v3

    .line 1087
    :cond_d
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getOpposite()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v9

    if-eqz v9, :cond_f

    .line 1088
    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iget v12, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v11, v12, :cond_f

    .line 1089
    iget v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iget v11, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-le v8, v11, :cond_e

    iget v8, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    goto :goto_b

    :cond_e
    iget v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    :goto_b
    iput v8, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    iput v8, v9, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    move v8, v3

    :cond_f
    :goto_c
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    :cond_10
    add-int/lit8 v4, v4, 0x1

    move v5, v8

    goto :goto_7

    :cond_11
    move v4, v5

    goto :goto_6

    .line 1099
    :cond_12
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    array-length v0, v0

    mul-int/2addr v4, v0

    add-int/2addr v4, v3

    new-array v0, v4, [I

    const/4 v3, -0x1

    .line 1100
    invoke-static {v0, v3}, Ljava/util/Arrays;->fill([II)V

    move v4, v2

    :goto_d
    if-ge v2, v1, :cond_1d

    .line 1102
    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1105
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1106
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v8, v6, :cond_14

    .line 1107
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1108
    aget v9, v0, v8

    if-ne v9, v3, :cond_13

    add-int/lit8 v9, v4, 0x1

    .line 1109
    aput v4, v0, v8

    move v4, v9

    .line 1111
    :cond_13
    aget v8, v0, v8

    iput v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1114
    :cond_14
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1115
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v8, v6, :cond_16

    .line 1116
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1117
    aget v9, v0, v8

    if-ne v9, v3, :cond_15

    add-int/lit8 v9, v4, 0x1

    .line 1118
    aput v4, v0, v8

    move v4, v9

    .line 1120
    :cond_15
    aget v8, v0, v8

    iput v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1123
    :cond_16
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1124
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v8, v6, :cond_18

    .line 1125
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1126
    aget v9, v0, v8

    if-ne v9, v3, :cond_17

    add-int/lit8 v9, v4, 0x1

    .line 1127
    aput v4, v0, v8

    move v4, v9

    .line 1129
    :cond_17
    aget v8, v0, v8

    iput v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1132
    :cond_18
    iget-object v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1133
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v8, v6, :cond_1a

    .line 1134
    iget v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1135
    aget v9, v0, v8

    if-ne v9, v3, :cond_19

    add-int/lit8 v9, v4, 0x1

    .line 1136
    aput v4, v0, v8

    move v4, v9

    .line 1138
    :cond_19
    aget v8, v0, v8

    iput v8, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1141
    :cond_1a
    iget-object v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 1142
    iget v7, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    if-eq v7, v6, :cond_1c

    .line 1143
    iget v7, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1144
    aget v8, v0, v7

    if-ne v8, v3, :cond_1b

    add-int/lit8 v8, v4, 0x1

    .line 1145
    aput v4, v0, v7

    move v4, v8

    .line 1147
    :cond_1b
    aget v7, v0, v7

    iput v7, v5, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    :cond_1d
    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public layoutFindGroupsSimple()I
    .locals 6

    .line 812
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 814
    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 815
    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v1, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 816
    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v1, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 817
    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    const/4 v5, 0x1

    iput v5, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 818
    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v5, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 819
    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v5, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x2

    return p0
.end method

.method public layoutWithGroup(I)V
    .locals 7

    .line 1157
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 1158
    iget v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 1159
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mParent:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 1160
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    if-nez v2, :cond_0

    .line 1161
    new-instance v2, Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-direct {v2, p0}, Landroid/support/constraint/solver/widgets/Snapshot;-><init>(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    iput-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    .line 1163
    :cond_0
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-virtual {v2, p0}, Landroid/support/constraint/solver/widgets/Snapshot;->updateFrom(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 1168
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 1169
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 1170
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetAnchors()V

    .line 1171
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearSystem;->getCache()Landroid/support/constraint/solver/Cache;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->resetSolverVariables(Landroid/support/constraint/solver/Cache;)V

    goto :goto_0

    .line 1173
    :cond_1
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 1174
    iput v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 1178
    :goto_0
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v4, v3

    :goto_1
    if-ge v4, v2, :cond_3

    .line 1180
    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1181
    instance-of v6, v5, Landroid/support/constraint/solver/widgets/WidgetContainer;

    if-eqz v6, :cond_2

    .line 1182
    check-cast v5, Landroid/support/constraint/solver/widgets/WidgetContainer;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/WidgetContainer;->layout()V

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1186
    :cond_3
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v3, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1187
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v3, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1188
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    const/4 v4, 0x1

    iput v4, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1189
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iput v4, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mGroup:I

    .line 1190
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearSystem;->reset()V

    :goto_2
    if-ge v3, p1, :cond_4

    .line 1226
    :try_start_0
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {p0, v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->addToSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 1227
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearSystem;->minimize()V

    .line 1228
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {p0, v2, v3}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v2

    .line 1230
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 1232
    :goto_3
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    const/4 v4, -0x2

    invoke-virtual {p0, v2, v4}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1236
    :cond_4
    iget-object p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mParent:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eqz p1, :cond_5

    .line 1237
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result p1

    .line 1238
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result v0

    .line 1240
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSnapshot:Landroid/support/constraint/solver/widgets/Snapshot;

    invoke-virtual {v1, p0}, Landroid/support/constraint/solver/widgets/Snapshot;->applyTo(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V

    .line 1241
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setWidth(I)V

    .line 1242
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->setHeight(I)V

    goto :goto_4

    .line 1244
    :cond_5
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mX:I

    .line 1245
    iput v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mY:I

    .line 1248
    :goto_4
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getRootConstraintContainer()Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;

    move-result-object p1

    if-ne p0, p1, :cond_6

    .line 1249
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateDrawPosition()V

    :cond_6
    return-void
.end method

.method public reset()V
    .locals 1

    .line 112
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v0}, Landroid/support/constraint/solver/LinearSystem;->reset()V

    const/4 v0, 0x0

    .line 116
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    .line 117
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingRight:I

    .line 118
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    .line 119
    iput v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingBottom:I

    .line 120
    invoke-super {p0}, Landroid/support/constraint/solver/widgets/WidgetContainer;->reset()V

    return-void
.end method

.method public setDirectResolution(Z)V
    .locals 0

    .line 97
    iput-boolean p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mDirectResolution:Z

    return-void
.end method

.method public setPadding(IIII)V
    .locals 0

    .line 692
    iput p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingLeft:I

    .line 693
    iput p2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingTop:I

    .line 694
    iput p3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingRight:I

    .line 695
    iput p4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mPaddingBottom:I

    return-void
.end method

.method public updateChildrenFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V
    .locals 3

    .line 675
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->updateFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 676
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 678
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 679
    invoke-virtual {v2, p1, p2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->updateFromSolver(Landroid/support/constraint/solver/LinearSystem;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

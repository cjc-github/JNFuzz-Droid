.class public Landroid/support/constraint/ConstraintLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "ConstraintLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/ConstraintLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# static fields
.field public static final BASELINE:I = 0x5

.field public static final BOTTOM:I = 0x4

.field private static final CHAIN_PACKED:I = 0x2

.field private static final CHAIN_SPREAD:I = 0x0

.field private static final CHAIN_SPREAD_INSIDE:I = 0x1

.field public static final END:I = 0x7

.field public static final HORIZONTAL:I = 0x0

.field public static final LEFT:I = 0x1

.field public static final MATCH_CONSTRAINT:I = 0x0

.field public static final PARENT_ID:I = 0x0

.field public static final RIGHT:I = 0x2

.field public static final START:I = 0x6

.field public static final TOP:I = 0x3

.field public static final UNSET:I = -0x1

.field public static final VERTICAL:I = 0x1


# instance fields
.field public baselineToBaseline:I

.field public bottomToBottom:I

.field public bottomToTop:I

.field public dimensionRatio:Ljava/lang/String;

.field dimensionRatioSide:I

.field dimensionRatioValue:F

.field public editorAbsoluteX:I

.field public editorAbsoluteY:I

.field public endToEnd:I

.field public endToStart:I

.field public goneBottomMargin:I

.field public goneEndMargin:I

.field public goneLeftMargin:I

.field public goneRightMargin:I

.field public goneStartMargin:I

.field public goneTopMargin:I

.field public guideBegin:I

.field public guideEnd:I

.field public guidePercent:F

.field public horizontalBias:F

.field public horizontalChainStyle:I

.field horizontalDimensionFixed:Z

.field public horizontalWeight:F

.field isGuideline:Z

.field public leftToLeft:I

.field public leftToRight:I

.field needsBaseline:Z

.field public orientation:I

.field resolveGoneLeftMargin:I

.field resolveGoneRightMargin:I

.field resolvedHorizontalBias:F

.field resolvedLeftToLeft:I

.field resolvedLeftToRight:I

.field resolvedRightToLeft:I

.field resolvedRightToRight:I

.field public rightToLeft:I

.field public rightToRight:I

.field public startToEnd:I

.field public startToStart:I

.field public topToBottom:I

.field public topToTop:I

.field public verticalBias:F

.field public verticalChainStyle:I

.field verticalDimensionFixed:Z

.field public verticalWeight:F

.field widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 1706
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    const/4 p1, -0x1

    .line 1256
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 1261
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    const/high16 p2, -0x40800000    # -1.0f

    .line 1266
    iput p2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 1271
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1276
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1281
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1286
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1291
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1296
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1301
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1306
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1311
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1316
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1321
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1326
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1331
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1336
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    .line 1341
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 1346
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    .line 1351
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 1356
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 1361
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    const/high16 p2, 0x3f000000    # 0.5f

    .line 1366
    iput p2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 1371
    iput p2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    const/4 v0, 0x0

    .line 1376
    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/4 v0, 0x0

    .line 1381
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    const/4 v1, 0x1

    .line 1386
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1392
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 1398
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    const/4 v0, 0x0

    .line 1410
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 1422
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 1428
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 1434
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 1436
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 1439
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1440
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1442
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 1443
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1445
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1446
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1447
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1448
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1449
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1450
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1451
    iput p2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1453
    new-instance p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-direct {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;-><init>()V

    iput-object p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9

    .line 1511
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    .line 1256
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 1261
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 1266
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 1271
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1276
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1281
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1286
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1291
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1296
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1301
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1306
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1311
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1316
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1321
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1326
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1331
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1336
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    .line 1341
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 1346
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    .line 1351
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 1356
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 1361
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 1366
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 1371
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    const/4 v2, 0x0

    .line 1376
    iput-object v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/4 v2, 0x0

    .line 1381
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    const/4 v3, 0x1

    .line 1386
    iput v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1392
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 1398
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    const/4 v4, 0x0

    .line 1410
    iput v4, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 1422
    iput v4, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 1428
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 1434
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 1436
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 1439
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1440
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1442
    iput-boolean v4, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 1443
    iput-boolean v4, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1445
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1446
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1447
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1448
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1449
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1450
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1451
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1453
    new-instance v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-direct {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;-><init>()V

    iput-object v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1513
    sget-object v1, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 1514
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    move v1, v4

    :goto_0
    if-ge v1, p2, :cond_2b

    .line 1516
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v5

    .line 1517
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintLeft_toLeftOf:I

    if-ne v5, v6, :cond_0

    .line 1518
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1519
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    if-ne v6, v0, :cond_2a

    .line 1520
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    goto/16 :goto_3

    .line 1522
    :cond_0
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintLeft_toRightOf:I

    if-ne v5, v6, :cond_1

    .line 1523
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1524
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    if-ne v6, v0, :cond_2a

    .line 1525
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    goto/16 :goto_3

    .line 1527
    :cond_1
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintRight_toLeftOf:I

    if-ne v5, v6, :cond_2

    .line 1528
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1529
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    if-ne v6, v0, :cond_2a

    .line 1530
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    goto/16 :goto_3

    .line 1532
    :cond_2
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintRight_toRightOf:I

    if-ne v5, v6, :cond_3

    .line 1533
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1534
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    if-ne v6, v0, :cond_2a

    .line 1535
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    goto/16 :goto_3

    .line 1537
    :cond_3
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintTop_toTopOf:I

    if-ne v5, v6, :cond_4

    .line 1538
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1539
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    if-ne v6, v0, :cond_2a

    .line 1540
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    goto/16 :goto_3

    .line 1542
    :cond_4
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintTop_toBottomOf:I

    if-ne v5, v6, :cond_5

    .line 1543
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1544
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    if-ne v6, v0, :cond_2a

    .line 1545
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    goto/16 :goto_3

    .line 1547
    :cond_5
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintBottom_toTopOf:I

    if-ne v5, v6, :cond_6

    .line 1548
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1549
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    if-ne v6, v0, :cond_2a

    .line 1550
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    goto/16 :goto_3

    .line 1552
    :cond_6
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintBottom_toBottomOf:I

    if-ne v5, v6, :cond_7

    .line 1553
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1554
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    if-ne v6, v0, :cond_2a

    .line 1555
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    goto/16 :goto_3

    .line 1557
    :cond_7
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintBaseline_toBaselineOf:I

    if-ne v5, v6, :cond_8

    .line 1558
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1559
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    if-ne v6, v0, :cond_2a

    .line 1560
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    goto/16 :goto_3

    .line 1562
    :cond_8
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_editor_absoluteX:I

    if-ne v5, v6, :cond_9

    .line 1563
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    goto/16 :goto_3

    .line 1564
    :cond_9
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_editor_absoluteY:I

    if-ne v5, v6, :cond_a

    .line 1565
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    goto/16 :goto_3

    .line 1566
    :cond_a
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintGuide_begin:I

    if-ne v5, v6, :cond_b

    .line 1567
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    goto/16 :goto_3

    .line 1568
    :cond_b
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintGuide_end:I

    if-ne v5, v6, :cond_c

    .line 1569
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    goto/16 :goto_3

    .line 1570
    :cond_c
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintGuide_percent:I

    if-ne v5, v6, :cond_d

    .line 1571
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    goto/16 :goto_3

    .line 1572
    :cond_d
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_android_orientation:I

    if-ne v5, v6, :cond_e

    .line 1573
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    goto/16 :goto_3

    .line 1574
    :cond_e
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintStart_toEndOf:I

    if-ne v5, v6, :cond_f

    .line 1575
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1576
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    if-ne v6, v0, :cond_2a

    .line 1577
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    goto/16 :goto_3

    .line 1579
    :cond_f
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintStart_toStartOf:I

    if-ne v5, v6, :cond_10

    .line 1580
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1581
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    if-ne v6, v0, :cond_2a

    .line 1582
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    goto/16 :goto_3

    .line 1584
    :cond_10
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintEnd_toStartOf:I

    if-ne v5, v6, :cond_11

    .line 1585
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1586
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    if-ne v6, v0, :cond_2a

    .line 1587
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    goto/16 :goto_3

    .line 1589
    :cond_11
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintEnd_toEndOf:I

    if-ne v5, v6, :cond_12

    .line 1590
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1591
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    if-ne v6, v0, :cond_2a

    .line 1592
    invoke-virtual {p1, v5, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    goto/16 :goto_3

    .line 1594
    :cond_12
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginLeft:I

    if-ne v5, v6, :cond_13

    .line 1595
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    goto/16 :goto_3

    .line 1596
    :cond_13
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginTop:I

    if-ne v5, v6, :cond_14

    .line 1597
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    goto/16 :goto_3

    .line 1598
    :cond_14
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginRight:I

    if-ne v5, v6, :cond_15

    .line 1599
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    goto/16 :goto_3

    .line 1600
    :cond_15
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginBottom:I

    if-ne v5, v6, :cond_16

    .line 1601
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    goto/16 :goto_3

    .line 1602
    :cond_16
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginStart:I

    if-ne v5, v6, :cond_17

    .line 1603
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    goto/16 :goto_3

    .line 1604
    :cond_17
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_goneMarginEnd:I

    if-ne v5, v6, :cond_18

    .line 1605
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    goto/16 :goto_3

    .line 1606
    :cond_18
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintHorizontal_bias:I

    if-ne v5, v6, :cond_19

    .line 1607
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    goto/16 :goto_3

    .line 1608
    :cond_19
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintVertical_bias:I

    if-ne v5, v6, :cond_1a

    .line 1609
    iget v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    invoke-virtual {p1, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    goto/16 :goto_3

    .line 1610
    :cond_1a
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintDimensionRatio:I

    if-ne v5, v6, :cond_20

    .line 1611
    invoke-virtual {p1, v5}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/high16 v5, 0x7fc00000    # Float.NaN

    .line 1612
    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    .line 1613
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1614
    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    if-eqz v5, :cond_2a

    .line 1615
    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    .line 1616
    iget-object v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/16 v7, 0x2c

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-lez v6, :cond_1d

    add-int/lit8 v7, v5, -0x1

    if-ge v6, v7, :cond_1d

    .line 1618
    iget-object v7, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    const-string v8, "W"

    .line 1619
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1b

    .line 1620
    iput v4, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    goto :goto_1

    :cond_1b
    const-string v8, "H"

    .line 1621
    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 1622
    iput v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    :cond_1c
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_1d
    move v6, v4

    .line 1628
    :goto_2
    iget-object v7, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/16 v8, 0x3a

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-ltz v7, :cond_1f

    add-int/lit8 v5, v5, -0x1

    if-ge v7, v5, :cond_1f

    .line 1630
    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 1631
    iget-object v6, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 1632
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2a

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2a

    .line 1634
    :try_start_0
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    .line 1635
    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    cmpl-float v7, v5, v2

    if-lez v7, :cond_2a

    cmpl-float v7, v6, v2

    if-lez v7, :cond_2a

    .line 1637
    iget v7, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    if-ne v7, v3, :cond_1e

    div-float/2addr v6, v5

    .line 1638
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    goto/16 :goto_3

    :cond_1e
    div-float/2addr v5, v6

    .line 1640
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_3

    .line 1648
    :cond_1f
    iget-object v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 1649
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2a

    .line 1651
    :try_start_1
    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 1658
    :cond_20
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintHorizontal_weight:I

    if-ne v5, v6, :cond_21

    .line 1659
    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    goto :goto_3

    .line 1660
    :cond_21
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintVertical_weight:I

    if-ne v5, v6, :cond_22

    .line 1661
    invoke-virtual {p1, v5, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    goto :goto_3

    .line 1662
    :cond_22
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintHorizontal_chainStyle:I

    if-ne v5, v6, :cond_23

    .line 1663
    invoke-virtual {p1, v5, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    goto :goto_3

    .line 1664
    :cond_23
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintVertical_chainStyle:I

    if-ne v5, v6, :cond_24

    .line 1665
    invoke-virtual {p1, v5, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    goto :goto_3

    .line 1666
    :cond_24
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintLeft_creator:I

    if-ne v5, v6, :cond_25

    goto :goto_3

    .line 1668
    :cond_25
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintTop_creator:I

    if-ne v5, v6, :cond_26

    goto :goto_3

    .line 1670
    :cond_26
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintRight_creator:I

    if-ne v5, v6, :cond_27

    goto :goto_3

    .line 1672
    :cond_27
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintBottom_creator:I

    if-ne v5, v6, :cond_28

    goto :goto_3

    .line 1674
    :cond_28
    sget v6, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_layout_constraintBaseline_creator:I

    if-ne v5, v6, :cond_29

    goto :goto_3

    :cond_29
    const-string v6, "ConstraintLayout"

    .line 1677
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown attribute 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :catch_0
    :cond_2a
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 1680
    :cond_2b
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 1681
    invoke-virtual {p0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->validate()V

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .locals 4

    .line 1461
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    const/4 v0, -0x1

    .line 1256
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 1261
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 1266
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 1271
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1276
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1281
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1286
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1291
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1296
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1301
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1306
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1311
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1316
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1321
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1326
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1331
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1336
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    .line 1341
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 1346
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    .line 1351
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 1356
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 1361
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 1366
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 1371
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    const/4 v2, 0x0

    .line 1376
    iput-object v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/4 v2, 0x0

    .line 1381
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    const/4 v3, 0x1

    .line 1386
    iput v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1392
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 1398
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    const/4 v2, 0x0

    .line 1410
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 1422
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 1428
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 1434
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 1436
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 1439
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1440
    iput-boolean v3, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1442
    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 1443
    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1445
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1446
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1447
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1448
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1449
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1450
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1451
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1453
    new-instance v0, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1462
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 1463
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    .line 1464
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 1465
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1466
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1467
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1468
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1469
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1470
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1471
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1472
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1473
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1474
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1475
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1476
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1477
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1478
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    .line 1479
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 1480
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    .line 1481
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 1482
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 1483
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    .line 1484
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 1485
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    .line 1486
    iget-object v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    .line 1487
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    .line 1488
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1489
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 1490
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    .line 1491
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 1492
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 1493
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 1494
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 1495
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 1496
    iget-boolean v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1497
    iget-boolean v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1498
    iget-boolean v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 1499
    iget-boolean v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1500
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1501
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1502
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1503
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1504
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1505
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1506
    iget v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1507
    iget-object p1, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iput-object p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3

    .line 1710
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, -0x1

    .line 1256
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 1261
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    const/high16 v0, -0x40800000    # -1.0f

    .line 1266
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 1271
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 1276
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 1281
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 1286
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 1291
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 1296
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 1301
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 1306
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 1311
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 1316
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 1321
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 1326
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 1331
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 1336
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    .line 1341
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneTopMargin:I

    .line 1346
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    .line 1351
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneBottomMargin:I

    .line 1356
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    .line 1361
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    const/high16 v0, 0x3f000000    # 0.5f

    .line 1366
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 1371
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    const/4 v1, 0x0

    .line 1376
    iput-object v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    const/4 v1, 0x0

    .line 1381
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioValue:F

    const/4 v2, 0x1

    .line 1386
    iput v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatioSide:I

    .line 1392
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 1398
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    const/4 v1, 0x0

    .line 1410
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 1422
    iput v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 1428
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 1434
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 1436
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 1439
    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1440
    iput-boolean v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1442
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->needsBaseline:Z

    .line 1443
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1445
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1446
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1447
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1448
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1449
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1450
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1451
    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1453
    new-instance p1, Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-direct {p1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;-><init>()V

    iput-object p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    return-void
.end method


# virtual methods
.method public resolveLayoutDirection(I)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1719
    invoke-super {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->resolveLayoutDirection(I)V

    const/4 p1, -0x1

    .line 1721
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1722
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1723
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1724
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1726
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1727
    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1728
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneLeftMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1729
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneRightMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1730
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    .line 1732
    invoke-virtual {p0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_7

    .line 1735
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    if-eq v0, p1, :cond_1

    .line 1736
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    goto :goto_1

    .line 1737
    :cond_1
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    if-eq v0, p1, :cond_2

    .line 1738
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1740
    :cond_2
    :goto_1
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    if-eq v0, p1, :cond_3

    .line 1741
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1743
    :cond_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    if-eq v0, p1, :cond_4

    .line 1744
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1746
    :cond_4
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    if-eq v0, p1, :cond_5

    .line 1747
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1749
    :cond_5
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    if-eq v0, p1, :cond_6

    .line 1750
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 1752
    iget v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedHorizontalBias:F

    goto :goto_2

    .line 1754
    :cond_7
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    if-eq v0, p1, :cond_8

    .line 1755
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    .line 1757
    :cond_8
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    if-eq v0, p1, :cond_9

    .line 1758
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    .line 1760
    :cond_9
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    if-eq v0, p1, :cond_a

    .line 1761
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    .line 1763
    :cond_a
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    if-eq v0, p1, :cond_b

    .line 1764
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1766
    :cond_b
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    if-eq v0, p1, :cond_c

    .line 1767
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneStartMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneLeftMargin:I

    .line 1769
    :cond_c
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    if-eq v0, p1, :cond_d

    .line 1770
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->goneEndMargin:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolveGoneRightMargin:I

    .line 1774
    :cond_d
    :goto_2
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    if-ne v0, p1, :cond_f

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    if-ne v0, p1, :cond_f

    .line 1775
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    if-eq v0, p1, :cond_e

    .line 1776
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToLeft:I

    goto :goto_3

    .line 1777
    :cond_e
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    if-eq v0, p1, :cond_f

    .line 1778
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    iput v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedRightToRight:I

    .line 1781
    :cond_f
    :goto_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    if-ne v0, p1, :cond_11

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    if-ne v0, p1, :cond_11

    .line 1782
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    if-eq v0, p1, :cond_10

    .line 1783
    iget p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToLeft:I

    goto :goto_4

    .line 1784
    :cond_10
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    if-eq v0, p1, :cond_11

    .line 1785
    iget p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    iput p1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->resolvedLeftToRight:I

    :cond_11
    :goto_4
    return-void
.end method

.method public validate()V
    .locals 4

    const/4 v0, 0x0

    .line 1685
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    const/4 v1, 0x1

    .line 1686
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1687
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1688
    iget v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    const/4 v3, -0x1

    if-eqz v2, :cond_0

    iget v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    if-ne v2, v3, :cond_1

    .line 1689
    :cond_0
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1691
    :cond_1
    iget v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    if-eqz v2, :cond_2

    iget v2, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    if-ne v2, v3, :cond_3

    .line 1692
    :cond_2
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1694
    :cond_3
    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_4

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    if-ne v0, v3, :cond_4

    iget v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    if-eq v0, v3, :cond_6

    .line 1695
    :cond_4
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->isGuideline:Z

    .line 1696
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalDimensionFixed:Z

    .line 1697
    iput-boolean v1, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalDimensionFixed:Z

    .line 1698
    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    instance-of v0, v0, Landroid/support/constraint/solver/widgets/Guideline;

    if-nez v0, :cond_5

    .line 1699
    new-instance v0, Landroid/support/constraint/solver/widgets/Guideline;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/Guideline;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 1701
    :cond_5
    iget-object v0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->widget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    check-cast v0, Landroid/support/constraint/solver/widgets/Guideline;

    iget p0, p0, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    invoke-virtual {v0, p0}, Landroid/support/constraint/solver/widgets/Guideline;->setOrientation(I)V

    :cond_6
    return-void
.end method

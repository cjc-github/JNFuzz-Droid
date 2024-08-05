.class Landroid/support/constraint/ConstraintSet$Constraint;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/ConstraintSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Constraint"
.end annotation


# static fields
.field static final UNSET:I = -0x1


# instance fields
.field public baselineToBaseline:I

.field public bottomMargin:I

.field public bottomToBottom:I

.field public bottomToTop:I

.field public dimensionRatio:Ljava/lang/String;

.field public editorAbsoluteX:I

.field public editorAbsoluteY:I

.field public endMargin:I

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

.field public horizontalWeight:F

.field public leftMargin:I

.field public leftToLeft:I

.field public leftToRight:I

.field public mHeight:I

.field mIsGuideline:Z

.field mViewId:I

.field public mWidth:I

.field public orientation:I

.field public rightMargin:I

.field public rightToLeft:I

.field public rightToRight:I

.field public startMargin:I

.field public startToEnd:I

.field public startToStart:I

.field public topMargin:I

.field public topToBottom:I

.field public topToTop:I

.field public verticalBias:F

.field public verticalChainStyle:I

.field public verticalWeight:F

.field public visibility:I


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 264
    iput-boolean v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    const/4 v0, -0x1

    .line 269
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 270
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    const/high16 v1, -0x40800000    # -1.0f

    .line 271
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 273
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 274
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 275
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 276
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 277
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 278
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 279
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 280
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 281
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 283
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 284
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 285
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 286
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    const/high16 v1, 0x3f000000    # 0.5f

    .line 288
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 289
    iput v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    const/4 v1, 0x0

    .line 290
    iput-object v1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    .line 292
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    .line 293
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    .line 295
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/constraint/ConstraintSet$1;)V
    .locals 0

    .line 263
    invoke-direct {p0}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>()V

    return-void
.end method

.method static synthetic access$100(Landroid/support/constraint/ConstraintSet$Constraint;ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .locals 0

    .line 263
    invoke-direct {p0, p1, p2}, Landroid/support/constraint/ConstraintSet$Constraint;->fillFrom(ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V

    return-void
.end method

.method private fillFrom(ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .locals 1

    .line 315
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mViewId:I

    .line 316
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 317
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 318
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 319
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 320
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 321
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 322
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 323
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 324
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 325
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 326
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 327
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 328
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 330
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    .line 331
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    .line 332
    iget-object p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    iput-object p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    .line 333
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    .line 334
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    .line 335
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    .line 336
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 337
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 338
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 339
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    .line 340
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    .line 341
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftMargin:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    .line 342
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightMargin:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    .line 343
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topMargin:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    .line 344
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomMargin:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    .line 345
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 346
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    .line 347
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    .line 348
    iget p1, p2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    .line 349
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x11

    if-lt p1, v0, :cond_0

    .line 351
    invoke-virtual {p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->getMarginEnd()I

    move-result p1

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    .line 352
    invoke-virtual {p2}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->getMarginStart()I

    move-result p1

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    :cond_0
    return-void
.end method


# virtual methods
.method public applyTo(Landroid/support/constraint/ConstraintLayout$LayoutParams;)V
    .locals 2

    .line 357
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToLeft:I

    .line 358
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftToRight:I

    .line 359
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToLeft:I

    .line 360
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightToRight:I

    .line 362
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToTop:I

    .line 363
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    .line 364
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToTop:I

    .line 365
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomToBottom:I

    .line 367
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->baselineToBaseline:I

    .line 369
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToEnd:I

    .line 370
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->startToStart:I

    .line 371
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToStart:I

    .line 372
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->endToEnd:I

    .line 374
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->leftMargin:I

    .line 375
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->rightMargin:I

    .line 376
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topMargin:I

    .line 377
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->bottomMargin:I

    .line 379
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalBias:F

    .line 380
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalBias:F

    .line 382
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    iput-object v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->dimensionRatio:Ljava/lang/String;

    .line 383
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteX:I

    .line 384
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->editorAbsoluteY:I

    .line 385
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalWeight:F

    .line 386
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalWeight:F

    .line 387
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->verticalChainStyle:I

    .line 388
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->horizontalChainStyle:I

    .line 390
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->orientation:I

    .line 391
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guidePercent:F

    .line 392
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideBegin:I

    .line 393
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->guideEnd:I

    .line 394
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->width:I

    .line 395
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    iput v0, p1, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    .line 396
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 397
    iget v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    invoke-virtual {p1, v0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginStart(I)V

    .line 398
    iget p0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    invoke-virtual {p1, p0}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->setMarginEnd(I)V

    .line 401
    :cond_0
    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout$LayoutParams;->validate()V

    return-void
.end method

.class public Landroid/support/constraint/solver/widgets/Animator;
.super Ljava/lang/Object;
.source "Animator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/solver/widgets/Animator$Frame;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final USE_EASE_IN_OUT:Z = true

.field private static sAllowsAnimation:Z = false


# instance fields
.field private animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

.field private animDuration:J

.field private animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

.field private animStartTime:J

.field private animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

.field private mAnimating:Z

.field private final mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Landroid/support/constraint/solver/widgets/Animator$Frame;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/Animator$Frame;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    .line 25
    new-instance v0, Landroid/support/constraint/solver/widgets/Animator$Frame;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/Animator$Frame;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    .line 26
    new-instance v0, Landroid/support/constraint/solver/widgets/Animator$Frame;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/Animator$Frame;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    const-wide/16 v0, 0x0

    .line 28
    iput-wide v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animStartTime:J

    const-wide/16 v0, 0x15e

    .line 29
    iput-wide v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animDuration:J

    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mAnimating:Z

    .line 48
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    return-void
.end method

.method public static EaseInOutinterpolator(DDD)D
    .locals 5

    sub-double/2addr p4, p2

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    div-double/2addr p4, v0

    mul-double/2addr p0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, p0, v2

    if-gez v4, :cond_0

    mul-double/2addr p4, p0

    mul-double/2addr p4, p0

    add-double/2addr p4, p2

    return-wide p4

    :cond_0
    const/4 v4, 0x0

    sub-double/2addr p0, v2

    neg-double p4, p4

    sub-double v0, p0, v0

    mul-double/2addr p0, v0

    sub-double/2addr p0, v2

    mul-double/2addr p4, p0

    add-double/2addr p4, p2

    return-wide p4
.end method

.method public static doAnimation()Z
    .locals 1

    .line 40
    sget-boolean v0, Landroid/support/constraint/solver/widgets/Animator;->sAllowsAnimation:Z

    return v0
.end method

.method private static interpolator(FFF)I
    .locals 6

    float-to-double v0, p0

    float-to-double v2, p1

    float-to-double v4, p2

    .line 76
    invoke-static/range {v0 .. v5}, Landroid/support/constraint/solver/widgets/Animator;->EaseInOutinterpolator(DDD)D

    move-result-wide p0

    double-to-int p0, p0

    return p0
.end method

.method public static isAnimationEnabled()Z
    .locals 1

    .line 44
    sget-boolean v0, Landroid/support/constraint/solver/widgets/Animator;->sAllowsAnimation:Z

    return v0
.end method

.method private static linearInterpolator(FFF)F
    .locals 1

    mul-float/2addr p2, p0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p0

    mul-float/2addr p1, v0

    add-float/2addr p2, p1

    return p2
.end method

.method public static setAnimationEnabled(Z)V
    .locals 0

    .line 36
    sput-boolean p0, Landroid/support/constraint/solver/widgets/Animator;->sAllowsAnimation:Z

    return-void
.end method


# virtual methods
.method public animate(IIII)V
    .locals 5

    .line 108
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/constraint/solver/widgets/Animator$Frame;->set(IIII)V

    .line 109
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/Animator;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_1

    .line 111
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawX()I

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawY()I

    move-result v0

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 112
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawRight()I

    move-result v0

    if-ne p3, v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 113
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawBottom()I

    move-result v0

    if-eq p4, v0, :cond_1

    .line 119
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawX()I

    move-result v1

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawY()I

    move-result v2

    iget-object v3, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 120
    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawRight()I

    move-result v3

    iget-object v4, p0, Landroid/support/constraint/solver/widgets/Animator;->mWidget:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 121
    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getInternalDrawBottom()I

    move-result v4

    .line 119
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/support/constraint/solver/widgets/Animator$Frame;->set(IIII)V

    .line 122
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/Animator;->start()V

    .line 125
    :cond_1
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/Animator;->isAnimating()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 127
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/constraint/solver/widgets/Animator$Frame;->set(IIII)V

    .line 128
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/Animator;->step()V

    :cond_2
    return-void
.end method

.method public getCurrentBottom()I
    .locals 0

    .line 145
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    return p0
.end method

.method public getCurrentLeft()I
    .locals 0

    .line 133
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    return p0
.end method

.method public getCurrentRight()I
    .locals 0

    .line 141
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    return p0
.end method

.method public getCurrentTop()I
    .locals 0

    .line 137
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    return p0
.end method

.method public isAnimating()Z
    .locals 0

    .line 52
    iget-boolean p0, p0, Landroid/support/constraint/solver/widgets/Animator;->mAnimating:Z

    return p0
.end method

.method public start()V
    .locals 2

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animStartTime:J

    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mAnimating:Z

    return-void
.end method

.method public step()V
    .locals 6

    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 83
    iget-wide v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStartTime:J

    iget-wide v4, p0, Landroid/support/constraint/solver/widgets/Animator;->animDuration:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    iget-wide v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStartTime:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 84
    iget-wide v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStartTime:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    iget-wide v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animDuration:J

    long-to-float v1, v1

    div-float/2addr v0, v1

    .line 86
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v2, v2, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v3, v3, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    int-to-float v3, v3

    invoke-static {v0, v2, v3}, Landroid/support/constraint/solver/widgets/Animator;->interpolator(FFF)I

    move-result v2

    iput v2, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    .line 87
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v2, v2, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v3, v3, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    int-to-float v3, v3

    invoke-static {v0, v2, v3}, Landroid/support/constraint/solver/widgets/Animator;->interpolator(FFF)I

    move-result v2

    iput v2, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    .line 88
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v2, v2, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v3, v3, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    int-to-float v3, v3

    invoke-static {v0, v2, v3}, Landroid/support/constraint/solver/widgets/Animator;->interpolator(FFF)I

    move-result v2

    iput v2, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    .line 89
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/Animator;->animStart:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v2, v2, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    int-to-float v2, v2

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    int-to-float p0, p0

    invoke-static {v0, v2, p0}, Landroid/support/constraint/solver/widgets/Animator;->interpolator(FFF)I

    move-result p0

    iput p0, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    goto :goto_0

    .line 91
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v1, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    iput v1, v0, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    .line 92
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v1, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    iput v1, v0, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    .line 93
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v1, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    iput v1, v0, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    .line 94
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/Animator;->animCurrent:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/Animator;->animTarget:Landroid/support/constraint/solver/widgets/Animator$Frame;

    iget v1, v1, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    iput v1, v0, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    const/4 v0, 0x0

    .line 95
    iput-boolean v0, p0, Landroid/support/constraint/solver/widgets/Animator;->mAnimating:Z

    :goto_0
    return-void
.end method

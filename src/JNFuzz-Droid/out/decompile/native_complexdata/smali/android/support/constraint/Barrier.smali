.class public Landroid/support/constraint/Barrier;
.super Landroid/support/constraint/ConstraintHelper;
.source "Barrier.java"


# static fields
.field public static final BOTTOM:I = 0x3

.field public static final END:I = 0x6

.field public static final LEFT:I = 0x0

.field public static final RIGHT:I = 0x1

.field public static final START:I = 0x5

.field public static final TOP:I = 0x2


# instance fields
.field private mBarrier:Landroid/support/constraint/solver/widgets/Barrier;

.field private mIndicatedType:I

.field private mResolvedType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 111
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintHelper;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 106
    iput p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    .line 107
    iput p1, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    const/16 p1, 0x8

    .line 112
    invoke-super {p0, p1}, Landroid/support/constraint/ConstraintHelper;->setVisibility(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 116
    invoke-direct {p0, p1, p2}, Landroid/support/constraint/ConstraintHelper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 106
    iput p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    .line 107
    iput p1, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    const/16 p1, 0x8

    .line 117
    invoke-super {p0, p1}, Landroid/support/constraint/ConstraintHelper;->setVisibility(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 121
    invoke-direct {p0, p1, p2, p3}, Landroid/support/constraint/ConstraintHelper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 106
    iput p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    .line 107
    iput p1, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    const/16 p1, 0x8

    .line 122
    invoke-super {p0, p1}, Landroid/support/constraint/ConstraintHelper;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public getType()I
    .locals 0

    .line 131
    iget p0, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    return p0
.end method

.method protected init(Landroid/util/AttributeSet;)V
    .locals 5

    .line 177
    invoke-super {p0, p1}, Landroid/support/constraint/ConstraintHelper;->init(Landroid/util/AttributeSet;)V

    .line 178
    new-instance v0, Landroid/support/constraint/solver/widgets/Barrier;

    invoke-direct {v0}, Landroid/support/constraint/solver/widgets/Barrier;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/Barrier;->mBarrier:Landroid/support/constraint/solver/widgets/Barrier;

    if-eqz p1, :cond_1

    .line 180
    invoke-virtual {p0}, Landroid/support/constraint/Barrier;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 181
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 183
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    .line 184
    sget v4, Landroid/support/constraint/R$styleable;->ConstraintLayout_Layout_barrierDirection:I

    if-ne v3, v4, :cond_0

    .line 185
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/support/constraint/Barrier;->setType(I)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 189
    :cond_1
    iget-object p1, p0, Landroid/support/constraint/Barrier;->mBarrier:Landroid/support/constraint/solver/widgets/Barrier;

    iput-object p1, p0, Landroid/support/constraint/Barrier;->mHelperWidget:Landroid/support/constraint/solver/widgets/Helper;

    .line 190
    invoke-virtual {p0}, Landroid/support/constraint/Barrier;->validateParams()V

    return-void
.end method

.method public setType(I)V
    .locals 5

    .line 140
    iput p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    .line 141
    iput p1, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    .line 142
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v0, 0x6

    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/16 v4, 0x11

    if-ge p1, v4, :cond_1

    .line 145
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v1, :cond_0

    .line 146
    iput v2, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    goto :goto_1

    .line 147
    :cond_0
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v0, :cond_6

    .line 148
    iput v3, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    goto :goto_1

    .line 152
    :cond_1
    invoke-virtual {p0}, Landroid/support/constraint/Barrier;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    .line 153
    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p1

    if-ne v3, p1, :cond_2

    move p1, v3

    goto :goto_0

    :cond_2
    move p1, v2

    :goto_0
    if-eqz p1, :cond_4

    .line 155
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v1, :cond_3

    .line 156
    iput v3, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    goto :goto_1

    .line 157
    :cond_3
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v0, :cond_6

    .line 158
    iput v2, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    goto :goto_1

    .line 161
    :cond_4
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v1, :cond_5

    .line 162
    iput v2, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    goto :goto_1

    .line 163
    :cond_5
    iget p1, p0, Landroid/support/constraint/Barrier;->mIndicatedType:I

    if-ne p1, v0, :cond_6

    .line 164
    iput v3, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    .line 168
    :cond_6
    :goto_1
    iget-object p1, p0, Landroid/support/constraint/Barrier;->mBarrier:Landroid/support/constraint/solver/widgets/Barrier;

    iget p0, p0, Landroid/support/constraint/Barrier;->mResolvedType:I

    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/widgets/Barrier;->setBarrierType(I)V

    return-void
.end method

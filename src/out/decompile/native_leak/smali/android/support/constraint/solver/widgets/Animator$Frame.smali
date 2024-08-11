.class Landroid/support/constraint/solver/widgets/Animator$Frame;
.super Ljava/lang/Object;
.source "Animator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/constraint/solver/widgets/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Frame"
.end annotation


# instance fields
.field bottom:I

.field left:I

.field right:I

.field top:I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBottom()I
    .locals 0

    .line 174
    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    return p0
.end method

.method public getLeft()I
    .locals 0

    .line 162
    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    return p0
.end method

.method public getRight()I
    .locals 0

    .line 170
    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    return p0
.end method

.method public getTop()I
    .locals 0

    .line 166
    iget p0, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    return p0
.end method

.method set(IIII)V
    .locals 0

    .line 155
    iput p1, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->left:I

    .line 156
    iput p2, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->top:I

    .line 157
    iput p3, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->right:I

    .line 158
    iput p4, p0, Landroid/support/constraint/solver/widgets/Animator$Frame;->bottom:I

    return-void
.end method

.class public Landroid/support/constraint/solver/widgets/ResolutionNode;
.super Ljava/lang/Object;
.source "ResolutionNode.java"


# static fields
.field public static final BARRIER_CONNECTION:I = 0x5

.field public static final CENTER_CONNECTION:I = 0x2

.field public static final CHAIN_CONNECTION:I = 0x4

.field public static final DIRECT_CONNECTION:I = 0x1

.field public static final MATCH_CONNECTION:I = 0x3

.field public static final RESOLVED:I = 0x1

.field public static final UNCONNECTED:I

.field public static final UNRESOLVED:I


# instance fields
.field computedValue:F

.field dependents:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroid/support/constraint/solver/widgets/ResolutionNode;",
            ">;"
        }
    .end annotation
.end field

.field myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

.field offset:F

.field private opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

.field private oppositeOffset:F

.field resolvedOffset:F

.field resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

.field state:I

.field target:Landroid/support/constraint/solver/widgets/ResolutionNode;

.field type:I


# direct methods
.method public constructor <init>(Landroid/support/constraint/solver/widgets/ConstraintAnchor;)V
    .locals 2

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependents:Ljava/util/HashSet;

    const/4 v0, 0x0

    .line 36
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    .line 53
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    .line 58
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    return-void
.end method


# virtual methods
.method public addDependent(Landroid/support/constraint/solver/widgets/ResolutionNode;)V
    .locals 0

    .line 218
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependents:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V
    .locals 3

    .line 286
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 288
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-nez v1, :cond_0

    .line 289
    iget p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    float-to-int p0, p0

    invoke-virtual {p1, v0, p0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    goto :goto_0

    .line 291
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v1}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v1

    .line 292
    iget p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    float-to-int p0, p0

    const/4 v2, 0x6

    invoke-virtual {p1, v0, v1, p0, v2}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;II)Landroid/support/constraint/solver/ArrayRow;

    :goto_0
    return-void
.end method

.method public dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V
    .locals 0

    .line 262
    iput p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    .line 263
    iput-object p2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    int-to-float p1, p3

    .line 264
    iput p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    .line 265
    iget-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addDependent(Landroid/support/constraint/solver/widgets/ResolutionNode;)V

    return-void
.end method

.method public dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V
    .locals 0

    .line 272
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    int-to-float p1, p2

    .line 273
    iput p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    .line 274
    iget-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {p1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addDependent(Landroid/support/constraint/solver/widgets/ResolutionNode;)V

    return-void
.end method

.method public didResolve()V
    .locals 1

    const/4 v0, 0x1

    .line 73
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    .line 81
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependents:Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 82
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 3

    const/4 v0, 0x0

    .line 228
    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    const/4 v1, 0x0

    .line 229
    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    .line 230
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependents:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 231
    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 232
    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 233
    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->computedValue:F

    .line 234
    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 235
    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->oppositeOffset:F

    const/4 v0, 0x0

    .line 236
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    .line 237
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    return-void
.end method

.method public resetResolution()V
    .locals 1

    const/4 v0, 0x0

    .line 222
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    const/4 v0, 0x0

    .line 223
    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    const/4 v0, 0x0

    .line 224
    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    return-void
.end method

.method public resolve()V
    .locals 8

    .line 112
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    return-void

    .line 115
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    const/4 v2, 0x4

    if-ne v0, v2, :cond_1

    return-void

    .line 118
    :cond_1
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    if-ne v0, v1, :cond_4

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-ne v0, v1, :cond_4

    .line 123
    :cond_2
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-nez v0, :cond_3

    .line 124
    iput-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 125
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    goto :goto_0

    .line 127
    :cond_3
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 128
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    iget v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    add-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 130
    :goto_0
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    goto/16 :goto_5

    .line 131
    :cond_4
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    const/4 v2, 0x2

    const-wide/16 v3, 0x1

    if-ne v0, v2, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-ne v0, v1, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-ne v0, v1, :cond_b

    .line 139
    invoke-static {}, Landroid/support/constraint/solver/LinearSystem;->getMetrics()Landroid/support/constraint/solver/Metrics;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 140
    invoke-static {}, Landroid/support/constraint/solver/LinearSystem;->getMetrics()Landroid/support/constraint/solver/Metrics;

    move-result-object v0

    iget-wide v1, v0, Landroid/support/constraint/solver/Metrics;->centerConnectionResolved:J

    add-long/2addr v1, v3

    iput-wide v1, v0, Landroid/support/constraint/solver/Metrics;->centerConnectionResolved:J

    .line 142
    :cond_5
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 143
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iput-object v1, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 148
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->oppositeOffset:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    .line 150
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    sub-float/2addr v0, v2

    goto :goto_1

    .line 152
    :cond_6
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    sub-float/2addr v0, v2

    .line 155
    :goto_1
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mType:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->LEFT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-eq v2, v3, :cond_8

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mType:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v2, v3, :cond_7

    goto :goto_2

    .line 160
    :cond_7
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    .line 161
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalBiasPercent:F

    goto :goto_3

    .line 157
    :cond_8
    :goto_2
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    .line 158
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalBiasPercent:F

    .line 163
    :goto_3
    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    .line 164
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    .line 165
    iget-object v5, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v5}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getTarget()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v5

    iget-object v6, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v6}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getTarget()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v6

    const/4 v7, 0x0

    if-ne v5, v6, :cond_9

    const/high16 v2, 0x3f000000    # 0.5f

    move v3, v7

    move v4, v3

    :cond_9
    int-to-float v3, v3

    sub-float/2addr v0, v3

    int-to-float v4, v4

    sub-float/2addr v0, v4

    .line 174
    iget v5, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->oppositeOffset:F

    cmpl-float v1, v5, v1

    const/high16 v5, 0x3f800000    # 1.0f

    if-lez v1, :cond_a

    .line 176
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v6, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v6, v6, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    add-float/2addr v6, v4

    mul-float v4, v0, v2

    add-float/2addr v6, v4

    iput v6, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 178
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    sub-float/2addr v1, v3

    sub-float/2addr v5, v2

    mul-float/2addr v0, v5

    sub-float/2addr v1, v0

    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    goto :goto_4

    .line 180
    :cond_a
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    add-float/2addr v1, v3

    mul-float v3, v0, v2

    add-float/2addr v1, v3

    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 181
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v3, v3, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    sub-float/2addr v3, v4

    sub-float/2addr v5, v2

    mul-float/2addr v0, v5

    sub-float/2addr v3, v0

    iput v3, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 185
    :goto_4
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    .line 186
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    goto :goto_5

    .line 187
    :cond_b
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_d

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-ne v0, v1, :cond_d

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v0, :cond_d

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-ne v0, v1, :cond_d

    .line 195
    invoke-static {}, Landroid/support/constraint/solver/LinearSystem;->getMetrics()Landroid/support/constraint/solver/Metrics;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 196
    invoke-static {}, Landroid/support/constraint/solver/LinearSystem;->getMetrics()Landroid/support/constraint/solver/Metrics;

    move-result-object v0

    iget-wide v1, v0, Landroid/support/constraint/solver/Metrics;->matchConnectionResolved:J

    add-long/2addr v1, v3

    iput-wide v1, v0, Landroid/support/constraint/solver/Metrics;->matchConnectionResolved:J

    .line 198
    :cond_c
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iput-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 199
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iput-object v1, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 201
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    iget v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    add-float/2addr v0, v1

    iput v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 202
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v1, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->offset:F

    add-float/2addr v1, v2

    iput v1, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 204
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    .line 205
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    goto :goto_5

    .line 206
    :cond_d
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_e

    .line 207
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->resolve()V

    :cond_e
    :goto_5
    return-void
.end method

.method public resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V
    .locals 0

    .line 87
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 88
    iput p2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 89
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->didResolve()V

    return-void
.end method

.method sType(I)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x1

    if-ne p1, p0, :cond_0

    const-string p0, "DIRECT"

    return-object p0

    :cond_0
    const/4 p0, 0x2

    if-ne p1, p0, :cond_1

    const-string p0, "CENTER"

    return-object p0

    :cond_1
    const/4 p0, 0x3

    if-ne p1, p0, :cond_2

    const-string p0, "MATCH"

    return-object p0

    :cond_2
    const/4 p0, 0x4

    if-ne p1, p0, :cond_3

    const-string p0, "CHAIN"

    return-object p0

    :cond_3
    const/4 p0, 0x5

    if-ne p1, p0, :cond_4

    const-string p0, "BARRIER"

    return-object p0

    :cond_4
    const-string p0, "UNCONNECTED"

    return-object p0
.end method

.method public setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V
    .locals 0

    .line 281
    iput-object p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->opposite:Landroid/support/constraint/solver/widgets/ResolutionNode;

    .line 282
    iput p2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->oppositeOffset:F

    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 214
    iput p1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 63
    iget v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 64
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-ne v0, p0, :cond_0

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", RESOLVED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 67
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", RESOLVED: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 69
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " UNRESOLVED}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public update()V
    .locals 4

    .line 241
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getTarget()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 245
    :cond_0
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getTarget()Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    move-result-object v1

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-ne v1, v2, :cond_1

    const/4 v1, 0x4

    .line 246
    iput v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    .line 247
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v2

    iput v1, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    .line 249
    :cond_1
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    .line 250
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mType:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->RIGHT:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ResolutionNode;->myAnchor:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mType:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;->BOTTOM:Landroid/support/constraint/solver/widgets/ConstraintAnchor$Type;

    if-ne v2, v3, :cond_3

    :cond_2
    neg-int v1, v1

    .line 254
    :cond_3
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    return-void
.end method

.method public useAnchor(Landroid/support/constraint/solver/widgets/ConstraintAnchor;)V
    .locals 0

    .line 258
    invoke-virtual {p1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    return-void
.end method

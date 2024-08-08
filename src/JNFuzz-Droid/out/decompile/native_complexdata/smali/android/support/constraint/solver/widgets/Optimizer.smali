.class public Landroid/support/constraint/solver/widgets/Optimizer;
.super Ljava/lang/Object;
.source "Optimizer.java"


# static fields
.field static final FLAG_CHAIN_DANGLING:I = 0x1

.field static final FLAG_RECOMPUTE_BOUNDS:I = 0x2

.field static final FLAG_USE_OPTIMIZE:I = 0x0

.field public static final OPTIMIZATION_BARRIER:I = 0x2

.field public static final OPTIMIZATION_CHAIN:I = 0x4

.field public static final OPTIMIZATION_DIRECT:I = 0x1

.field public static final OPTIMIZATION_NONE:I = 0x0

.field public static final OPTIMIZATION_RATIO:I = 0x8

.field public static final OPTIMIZATION_STANDARD:I = 0x3

.field static flags:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    .line 38
    new-array v0, v0, [Z

    sput-object v0, Landroid/support/constraint/solver/widgets/Optimizer;->flags:[Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static analyze(Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 12

    .line 146
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->updateResolutionNodes()V

    .line 148
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    .line 149
    iget-object v1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v1

    .line 150
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v2

    .line 151
    iget-object v3, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v3

    .line 155
    iget v4, v0, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    const/4 v5, 0x3

    const/4 v6, 0x4

    const/4 v7, 0x0

    const/4 v8, 0x2

    const/4 v9, 0x1

    if-eq v4, v6, :cond_9

    iget v4, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    if-eq v4, v6, :cond_9

    .line 157
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v10, 0x0

    aget-object v4, v4, v10

    sget-object v11, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v11, :cond_3

    .line 158
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v4, :cond_0

    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v4, :cond_0

    .line 159
    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 160
    invoke-virtual {v2, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 161
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    invoke-virtual {v2, v0, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_0

    .line 162
    :cond_0
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_1

    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v4, :cond_1

    .line 163
    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 164
    invoke-virtual {v2, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 165
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    invoke-virtual {v2, v0, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_0

    .line 166
    :cond_1
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v4, :cond_2

    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_2

    .line 167
    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 168
    invoke-virtual {v2, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 169
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    neg-int v4, v4

    invoke-virtual {v0, v2, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_0

    .line 170
    :cond_2
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_9

    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_9

    .line 171
    invoke-virtual {v0, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 172
    invoke-virtual {v2, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 173
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    invoke-virtual {v0, v2, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 174
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v0, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    goto/16 :goto_0

    .line 176
    :cond_3
    iget-object v4, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v4, v4, v10

    sget-object v11, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v4, v11, :cond_9

    .line 177
    invoke-static {p0, v10}, Landroid/support/constraint/solver/widgets/Optimizer;->optimizableMatchConstraint(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 178
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    .line 179
    iget v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v10, v10, v7

    if-eqz v10, :cond_4

    .line 180
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v4

    int-to-float v4, v4

    iget v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    mul-float/2addr v4, v10

    float-to-int v4, v4

    .line 182
    :cond_4
    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 183
    invoke-virtual {v2, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 184
    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v10, :cond_5

    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v10, :cond_5

    .line 185
    invoke-virtual {v2, v0, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_0

    .line 186
    :cond_5
    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_6

    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v10, :cond_6

    .line 187
    invoke-virtual {v2, v0, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_0

    .line 188
    :cond_6
    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v10, :cond_7

    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_7

    neg-int v4, v4

    .line 189
    invoke-virtual {v0, v2, v4}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_0

    .line 190
    :cond_7
    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_9

    iget-object v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v10, v10, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v10, :cond_9

    .line 191
    iget v10, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v10, v10, v7

    if-nez v10, :cond_8

    .line 192
    invoke-virtual {v0, v5}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 193
    invoke-virtual {v2, v5}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 194
    invoke-virtual {v0, v2, v7}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 195
    invoke-virtual {v2, v0, v7}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    goto :goto_0

    .line 197
    :cond_8
    invoke-virtual {v0, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 198
    invoke-virtual {v2, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    neg-int v10, v4

    int-to-float v10, v10

    .line 199
    invoke-virtual {v0, v2, v10}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    int-to-float v10, v4

    .line 200
    invoke-virtual {v2, v0, v10}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 201
    invoke-virtual {p0, v4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setWidth(I)V

    .line 209
    :cond_9
    :goto_0
    iget v0, v1, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    if-eq v0, v6, :cond_13

    iget v0, v3, Landroid/support/constraint/solver/widgets/ResolutionNode;->type:I

    if-eq v0, v6, :cond_13

    .line 212
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, v9

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->FIXED:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v2, :cond_d

    .line 213
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v0, :cond_a

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v0, :cond_a

    .line 214
    invoke-virtual {v1, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 215
    invoke-virtual {v3, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 216
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    invoke-virtual {v3, v1, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    .line 217
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_13

    .line 218
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 219
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    .line 220
    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    neg-int p0, p0

    .line 219
    invoke-virtual {v1, v9, v0, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_1

    .line 222
    :cond_a
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v0, :cond_b

    .line 223
    invoke-virtual {v1, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 224
    invoke-virtual {v3, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 225
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    invoke-virtual {v3, v1, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    .line 226
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez v0, :cond_13

    .line 227
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    invoke-virtual {v0, v9, v1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_1

    .line 229
    :cond_b
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v0, :cond_c

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_c

    .line 230
    invoke-virtual {v1, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 231
    invoke-virtual {v3, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 232
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {v1, v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    .line 233
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez v0, :cond_13

    .line 234
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    invoke-virtual {v0, v9, v1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_1

    .line 236
    :cond_c
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v0, :cond_13

    .line 237
    invoke-virtual {v1, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 238
    invoke-virtual {v3, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 239
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {v1, v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 240
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v3, v1, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 241
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez v0, :cond_13

    .line 242
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    invoke-virtual {v0, v9, v1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto/16 :goto_1

    .line 245
    :cond_d
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, v9

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v2, :cond_13

    .line 246
    invoke-static {p0, v9}, Landroid/support/constraint/solver/widgets/Optimizer;->optimizableMatchConstraint(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 247
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v0

    .line 248
    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v2, v2, v7

    if-eqz v2, :cond_e

    .line 249
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    mul-float/2addr v0, v2

    float-to-int v0, v0

    .line 251
    :cond_e
    invoke-virtual {v1, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 252
    invoke-virtual {v3, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 253
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v2, :cond_f

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v2, :cond_f

    .line 254
    invoke-virtual {v3, v1, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_1

    .line 255
    :cond_f
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_10

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v2, :cond_10

    .line 256
    invoke-virtual {v3, v1, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_1

    .line 257
    :cond_10
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-nez v2, :cond_11

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_11

    neg-int p0, v0

    .line 258
    invoke-virtual {v1, v3, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(Landroid/support/constraint/solver/widgets/ResolutionNode;I)V

    goto :goto_1

    .line 259
    :cond_11
    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_13

    iget-object v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v2, :cond_13

    .line 260
    iget v2, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    cmpl-float v2, v2, v7

    if-nez v2, :cond_12

    .line 261
    invoke-virtual {v1, v5}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 262
    invoke-virtual {v3, v5}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 263
    invoke-virtual {v1, v3, v7}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 264
    invoke-virtual {v3, v1, v7}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    goto :goto_1

    .line 266
    :cond_12
    invoke-virtual {v1, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    .line 267
    invoke-virtual {v3, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setType(I)V

    neg-int v2, v0

    int-to-float v2, v2

    .line 268
    invoke-virtual {v1, v3, v2}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    int-to-float v2, v0

    .line 269
    invoke-virtual {v3, v1, v2}, Landroid/support/constraint/solver/widgets/ResolutionNode;->setOpposite(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 270
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setHeight(I)V

    .line 271
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-lez v0, :cond_13

    .line 272
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {v0}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v0

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    invoke-virtual {v0, v9, v1, p0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->dependsOn(ILandroid/support/constraint/solver/widgets/ResolutionNode;I)V

    :cond_13
    :goto_1
    return-void
.end method

.method static applyChainOptimized(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;IILandroid/support/constraint/solver/widgets/ConstraintWidget;)Z
    .locals 20

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    .line 306
    iget-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v2, v2, p2

    sget-object v3, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v2, 0x0

    const/4 v4, 0x1

    if-nez p2, :cond_3

    .line 312
    invoke-virtual/range {p0 .. p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->isRtl()Z

    move-result v1

    if-eqz v1, :cond_3

    move-object/from16 v5, p4

    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_4

    .line 316
    iget-object v6, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    add-int/lit8 v7, p3, 0x1

    aget-object v6, v6, v7

    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v6, :cond_0

    .line 318
    iget-object v6, v6, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 319
    iget-object v7, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v7, :cond_0

    iget-object v7, v6, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v7, v7, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq v7, v5, :cond_1

    :cond_0
    move-object v6, v2

    :cond_1
    if-eqz v6, :cond_2

    move-object v5, v6

    goto :goto_0

    :cond_2
    move v1, v4

    goto :goto_0

    :cond_3
    move-object/from16 v5, p4

    :cond_4
    const/4 v1, 0x2

    if-nez p2, :cond_8

    .line 339
    iget v6, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-nez v6, :cond_5

    move v6, v4

    goto :goto_1

    :cond_5
    const/4 v6, 0x0

    .line 340
    :goto_1
    iget v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-ne v7, v4, :cond_6

    move v7, v4

    goto :goto_2

    :cond_6
    const/4 v7, 0x0

    .line 341
    :goto_2
    iget v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalChainStyle:I

    if-ne v5, v1, :cond_7

    :goto_3
    move v1, v4

    goto :goto_6

    :cond_7
    const/4 v1, 0x0

    goto :goto_6

    .line 343
    :cond_8
    iget v6, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-nez v6, :cond_9

    move v6, v4

    goto :goto_4

    :cond_9
    const/4 v6, 0x0

    .line 344
    :goto_4
    iget v7, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-ne v7, v4, :cond_a

    move v7, v4

    goto :goto_5

    :cond_a
    const/4 v7, 0x0

    .line 345
    :goto_5
    iget v5, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalChainStyle:I

    if-ne v5, v1, :cond_7

    goto :goto_3

    :goto_6
    move-object/from16 v9, p4

    move-object v5, v2

    move-object v10, v5

    move-object v11, v10

    move-object/from16 v17, v11

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    :goto_7
    if-nez v8, :cond_1b

    .line 361
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object v2, v4, p2

    .line 362
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    const/16 v3, 0x8

    if-eq v4, v3, :cond_f

    if-eqz v10, :cond_b

    .line 364
    iget-object v4, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object v9, v4, p2

    :cond_b
    if-nez v11, :cond_c

    move-object v11, v9

    :cond_c
    add-int/lit8 v12, v12, 0x1

    if-nez p2, :cond_d

    .line 372
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v14, v4

    goto :goto_8

    .line 374
    :cond_d
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v14, v4

    :goto_8
    if-eq v9, v11, :cond_e

    .line 377
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v14, v4

    .line 379
    :cond_e
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v15, v4

    .line 380
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    add-int/lit8 v10, p3, 0x1

    aget-object v4, v4, v10

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v15, v4

    move-object v10, v9

    .line 383
    :cond_f
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    .line 386
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object v2, v4, p2

    .line 387
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v4

    if-eq v4, v3, :cond_17

    iget-object v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v3, v3, p2

    sget-object v4, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v3, v4, :cond_17

    add-int/lit8 v13, v13, 0x1

    if-nez p2, :cond_12

    .line 392
    iget v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-eqz v3, :cond_10

    const/4 v3, 0x0

    return v3

    :cond_10
    const/4 v3, 0x0

    .line 394
    iget v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-nez v4, :cond_11

    iget v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-eqz v4, :cond_14

    :cond_11
    return v3

    :cond_12
    const/4 v3, 0x0

    .line 398
    iget v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eqz v4, :cond_13

    return v3

    .line 400
    :cond_13
    iget v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-nez v3, :cond_16

    iget v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-eqz v3, :cond_14

    goto :goto_a

    .line 404
    :cond_14
    iget-object v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWeight:[F

    aget v3, v3, p2

    add-float v16, v16, v3

    if-nez v17, :cond_15

    move-object/from16 v17, v9

    goto :goto_9

    .line 408
    :cond_15
    iget-object v3, v5, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextMatchConstraintsWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aput-object v9, v3, p2

    :goto_9
    move-object v5, v9

    goto :goto_b

    :cond_16
    :goto_a
    const/4 v0, 0x0

    return v0

    .line 414
    :cond_17
    :goto_b
    iget-object v3, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    add-int/lit8 v4, p3, 0x1

    aget-object v3, v3, v4

    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v3, :cond_18

    .line 416
    iget-object v3, v3, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    .line 417
    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    if-eqz v4, :cond_18

    iget-object v4, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mTarget:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mOwner:Landroid/support/constraint/solver/widgets/ConstraintWidget;

    if-eq v4, v9, :cond_19

    :cond_18
    move-object v3, v2

    :cond_19
    if-eqz v3, :cond_1a

    move-object v9, v3

    goto :goto_c

    :cond_1a
    const/4 v8, 0x1

    :goto_c
    const/4 v4, 0x1

    goto/16 :goto_7

    :cond_1b
    move-object/from16 v3, p4

    .line 431
    iget-object v2, v3, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v2, v2, p3

    invoke-virtual {v2}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v2

    .line 432
    iget-object v4, v9, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    add-int/lit8 v5, p3, 0x1

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v4

    .line 434
    iget-object v8, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-eqz v8, :cond_3f

    iget-object v8, v4, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    if-nez v8, :cond_1c

    goto/16 :goto_1b

    .line 440
    :cond_1c
    iget-object v8, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v8, v8, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    const/4 v3, 0x1

    if-eq v8, v3, :cond_1d

    iget-object v8, v4, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v8, v8, Landroid/support/constraint/solver/widgets/ResolutionNode;->state:I

    if-eq v8, v3, :cond_1d

    const/4 v3, 0x0

    return v3

    :cond_1d
    const/4 v3, 0x0

    if-lez v13, :cond_1e

    if-eq v13, v12, :cond_1e

    return v3

    :cond_1e
    if-nez v1, :cond_20

    if-nez v6, :cond_20

    if-eqz v7, :cond_1f

    goto :goto_d

    :cond_1f
    const/4 v3, 0x0

    goto :goto_f

    :cond_20
    :goto_d
    if-eqz v11, :cond_21

    .line 454
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    int-to-float v3, v3

    goto :goto_e

    :cond_21
    const/4 v3, 0x0

    :goto_e
    if-eqz v10, :cond_22

    .line 457
    iget-object v8, v10, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v8, v8, v5

    invoke-virtual {v8}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v3, v8

    .line 461
    :cond_22
    :goto_f
    iget-object v8, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v8, v8, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    .line 462
    iget-object v4, v4, Landroid/support/constraint/solver/widgets/ResolutionNode;->target:Landroid/support/constraint/solver/widgets/ResolutionNode;

    iget v4, v4, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedOffset:F

    cmpg-float v17, v8, v4

    if-gez v17, :cond_23

    sub-float/2addr v4, v8

    sub-float/2addr v4, v14

    goto :goto_10

    :cond_23
    sub-float v4, v8, v4

    sub-float/2addr v4, v14

    :goto_10
    const-wide/16 v18, 0x1

    if-lez v13, :cond_2c

    if-ne v13, v12, :cond_2c

    .line 471
    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    if-eqz v1, :cond_24

    invoke-virtual {v9}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getParent()Landroid/support/constraint/solver/widgets/ConstraintWidget;

    move-result-object v1

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v1, v1, p2

    sget-object v7, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v1, v7, :cond_24

    const/4 v1, 0x0

    return v1

    :cond_24
    add-float/2addr v4, v14

    sub-float/2addr v4, v15

    if-eqz v6, :cond_25

    sub-float/2addr v15, v3

    sub-float/2addr v4, v15

    :cond_25
    if-eqz v6, :cond_26

    .line 482
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, v5

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v8, v1

    .line 483
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    if-eqz v1, :cond_26

    .line 485
    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v1, v1, p3

    invoke-virtual {v1}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v8, v1

    :cond_26
    :goto_11
    if-eqz v11, :cond_2b

    .line 489
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    if-eqz v1, :cond_27

    .line 490
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v1, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    sub-long v6, v6, v18

    iput-wide v6, v1, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    .line 491
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v1, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    add-long v6, v6, v18

    iput-wide v6, v1, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    .line 492
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v1, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    add-long v6, v6, v18

    iput-wide v6, v1, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    .line 494
    :cond_27
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    if-nez v1, :cond_29

    if-ne v11, v10, :cond_28

    goto :goto_12

    :cond_28
    const/4 v6, 0x0

    goto :goto_13

    :cond_29
    :goto_12
    int-to-float v3, v13

    div-float v3, v4, v3

    const/4 v6, 0x0

    cmpl-float v7, v16, v6

    if-lez v7, :cond_2a

    .line 498
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mWeight:[F

    aget v3, v3, p2

    mul-float/2addr v3, v4

    div-float v3, v3, v16

    .line 500
    :cond_2a
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v7

    int-to-float v7, v7

    add-float/2addr v8, v7

    .line 501
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    iget-object v9, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {v7, v9, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 503
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, v5

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    iget-object v9, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    add-float/2addr v8, v3

    invoke-virtual {v7, v9, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 505
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    .line 506
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, v5

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    .line 508
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, v5

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v8, v3

    :goto_13
    move-object v11, v1

    goto :goto_11

    :cond_2b
    const/4 v1, 0x1

    return v1

    :cond_2c
    cmpg-float v9, v4, v14

    if-gez v9, :cond_2d

    const/4 v9, 0x0

    return v9

    :cond_2d
    if-eqz v1, :cond_33

    sub-float/2addr v4, v3

    .line 523
    invoke-virtual/range {p4 .. p4}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHorizontalBiasPercent()F

    move-result v1

    mul-float/2addr v4, v1

    add-float/2addr v8, v4

    :goto_14
    if-eqz v11, :cond_32

    .line 525
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    if-eqz v1, :cond_2e

    .line 526
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v3, v1, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    sub-long v3, v3, v18

    iput-wide v3, v1, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    .line 527
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v3, v1, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    add-long v3, v3, v18

    iput-wide v3, v1, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    .line 528
    sget-object v1, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v3, v1, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    add-long v3, v3, v18

    iput-wide v3, v1, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    .line 530
    :cond_2e
    iget-object v1, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v1, v1, p2

    if-nez v1, :cond_2f

    if-ne v11, v10, :cond_31

    :cond_2f
    if-nez p2, :cond_30

    .line 534
    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v3

    int-to-float v3, v3

    goto :goto_15

    .line 536
    :cond_30
    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v3

    int-to-float v3, v3

    .line 538
    :goto_15
    iget-object v4, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v8, v4

    .line 539
    iget-object v4, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v4

    iget-object v6, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {v4, v6, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 541
    iget-object v4, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v4

    iget-object v6, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    add-float/2addr v8, v3

    invoke-virtual {v4, v6, v8}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 543
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    .line 544
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, v5

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    .line 546
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, v5

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v8, v3

    :cond_31
    move-object v11, v1

    goto :goto_14

    :cond_32
    const/4 v0, 0x1

    goto/16 :goto_1a

    :cond_33
    if-nez v6, :cond_34

    if-eqz v7, :cond_32

    :cond_34
    if-eqz v6, :cond_35

    sub-float/2addr v4, v3

    goto :goto_16

    :cond_35
    if-eqz v7, :cond_36

    sub-float/2addr v4, v3

    :cond_36
    :goto_16
    add-int/lit8 v1, v12, 0x1

    int-to-float v1, v1

    div-float v1, v4, v1

    if-eqz v7, :cond_38

    const/4 v3, 0x1

    if-le v12, v3, :cond_37

    add-int/lit8 v1, v12, -0x1

    int-to-float v1, v1

    div-float v1, v4, v1

    goto :goto_17

    :cond_37
    const/high16 v1, 0x40000000    # 2.0f

    div-float v1, v4, v1

    :cond_38
    :goto_17
    add-float v3, v8, v1

    if-eqz v7, :cond_39

    const/4 v4, 0x1

    if-le v12, v4, :cond_39

    .line 567
    iget-object v3, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v3, v3, p3

    invoke-virtual {v3}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v8

    :cond_39
    if-eqz v6, :cond_3a

    if-eqz v11, :cond_3a

    .line 571
    iget-object v4, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v4, v4, p3

    invoke-virtual {v4}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getMargin()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v3, v4

    :cond_3a
    :goto_18
    if-eqz v11, :cond_32

    .line 575
    sget-object v4, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    if-eqz v4, :cond_3b

    .line 576
    sget-object v4, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v4, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    sub-long v6, v6, v18

    iput-wide v6, v4, Landroid/support/constraint/solver/Metrics;->nonresolvedWidgets:J

    .line 577
    sget-object v4, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v4, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    add-long v6, v6, v18

    iput-wide v6, v4, Landroid/support/constraint/solver/Metrics;->resolvedWidgets:J

    .line 578
    sget-object v4, Landroid/support/constraint/solver/LinearSystem;->sMetrics:Landroid/support/constraint/solver/Metrics;

    iget-wide v6, v4, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    add-long v6, v6, v18

    iput-wide v6, v4, Landroid/support/constraint/solver/Metrics;->chainConnectionResolved:J

    .line 580
    :cond_3b
    iget-object v4, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListNextVisibleWidget:[Landroid/support/constraint/solver/widgets/ConstraintWidget;

    aget-object v4, v4, p2

    if-nez v4, :cond_3c

    if-ne v11, v10, :cond_3e

    :cond_3c
    if-nez p2, :cond_3d

    .line 584
    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getWidth()I

    move-result v6

    int-to-float v6, v6

    goto :goto_19

    .line 586
    :cond_3d
    invoke-virtual {v11}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getHeight()I

    move-result v6

    int-to-float v6, v6

    .line 588
    :goto_19
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    iget-object v8, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    invoke-virtual {v7, v8, v3}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 590
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, v5

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    iget-object v8, v2, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolvedTarget:Landroid/support/constraint/solver/widgets/ResolutionNode;

    add-float v9, v3, v6

    invoke-virtual {v7, v8, v9}, Landroid/support/constraint/solver/widgets/ResolutionNode;->resolve(Landroid/support/constraint/solver/widgets/ResolutionNode;F)V

    .line 592
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, p3

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    invoke-virtual {v7, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    .line 593
    iget-object v7, v11, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListAnchors:[Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    aget-object v7, v7, v5

    invoke-virtual {v7}, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->getResolutionNode()Landroid/support/constraint/solver/widgets/ResolutionNode;

    move-result-object v7

    invoke-virtual {v7, v0}, Landroid/support/constraint/solver/widgets/ResolutionNode;->addResolvedValue(Landroid/support/constraint/solver/LinearSystem;)V

    add-float/2addr v6, v1

    add-float/2addr v3, v6

    :cond_3e
    move-object v11, v4

    goto :goto_18

    :goto_1a
    return v0

    :cond_3f
    :goto_1b
    const/4 v0, 0x0

    return v0
.end method

.method static checkMatchParent(Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/widgets/ConstraintWidget;)V
    .locals 5

    .line 51
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v3, 0x2

    if-eq v0, v2, :cond_0

    iget-object v0, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, v1

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v1, :cond_0

    .line 54
    iget-object v0, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 55
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getWidth()I

    move-result v1

    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mMargin:I

    sub-int/2addr v1, v2

    .line 62
    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v4}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v4

    iput-object v4, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 63
    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v4, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v4}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v4

    iput-object v4, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 64
    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mLeft:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p1, v2, v0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    .line 65
    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mRight:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, v2, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p1, v2, v1}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    .line 66
    iput v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mHorizontalResolution:I

    .line 68
    invoke-virtual {p2, v0, v1}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setHorizontalDimension(II)V

    .line 70
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    sget-object v2, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->WRAP_CONTENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-eq v0, v2, :cond_3

    iget-object v0, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, v1

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_PARENT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne v0, v1, :cond_3

    .line 73
    iget-object v0, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget v0, v0, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mMargin:I

    .line 74
    invoke-virtual {p0}, Landroid/support/constraint/solver/widgets/ConstraintWidgetContainer;->getHeight()I

    move-result p0

    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mMargin:I

    sub-int/2addr p0, v1

    .line 81
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v2}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 82
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v2}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 83
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mTop:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p1, v1, v0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    .line 84
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBottom:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    invoke-virtual {p1, v1, p0}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    .line 85
    iget v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    if-gtz v1, :cond_1

    invoke-virtual {p2}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_2

    .line 86
    :cond_1
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    invoke-virtual {p1, v2}, Landroid/support/constraint/solver/LinearSystem;->createObjectVariable(Ljava/lang/Object;)Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    iput-object v2, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    .line 87
    iget-object v1, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaseline:Landroid/support/constraint/solver/widgets/ConstraintAnchor;

    iget-object v1, v1, Landroid/support/constraint/solver/widgets/ConstraintAnchor;->mSolverVariable:Landroid/support/constraint/solver/SolverVariable;

    iget v2, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mBaselineDistance:I

    add-int/2addr v2, v0

    invoke-virtual {p1, v1, v2}, Landroid/support/constraint/solver/LinearSystem;->addEquality(Landroid/support/constraint/solver/SolverVariable;I)V

    .line 89
    :cond_2
    iput v3, p2, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mVerticalResolution:I

    .line 91
    invoke-virtual {p2, v0, p0}, Landroid/support/constraint/solver/widgets/ConstraintWidget;->setVerticalDimension(II)V

    :cond_3
    return-void
.end method

.method private static optimizableMatchConstraint(Landroid/support/constraint/solver/widgets/ConstraintWidget;I)Z
    .locals 3

    .line 105
    iget-object v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    aget-object v0, v0, p1

    sget-object v1, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    .line 108
    :cond_0
    iget v0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mDimensionRatio:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 109
    iget-object p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mListDimensionBehaviors:[Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    aget-object p0, p0, v1

    sget-object p1, Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;->MATCH_CONSTRAINT:Landroid/support/constraint/solver/widgets/ConstraintWidget$DimensionBehaviour;

    if-ne p0, p1, :cond_2

    return v2

    :cond_2
    return v2

    :cond_3
    if-nez p1, :cond_6

    .line 117
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultWidth:I

    if-eqz p1, :cond_4

    return v2

    .line 120
    :cond_4
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMinWidth:I

    if-nez p1, :cond_5

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMaxWidth:I

    if-eqz p0, :cond_8

    :cond_5
    return v2

    .line 124
    :cond_6
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintDefaultHeight:I

    if-eqz p1, :cond_7

    return v2

    .line 127
    :cond_7
    iget p1, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMinHeight:I

    if-nez p1, :cond_9

    iget p0, p0, Landroid/support/constraint/solver/widgets/ConstraintWidget;->mMatchConstraintMaxHeight:I

    if-eqz p0, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v2
.end method

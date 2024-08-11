.class public Landroid/support/constraint/solver/EquationCreation;
.super Ljava/lang/Object;
.source "EquationCreation.java"


# static fields
.field private static final DEBUG:Z = false


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createRowCentering(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;
    .locals 10

    .line 141
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v9

    move-object v0, v9

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    .line 142
    invoke-virtual/range {v0 .. v8}, Landroid/support/constraint/solver/ArrayRow;->createRowCentering(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IFLandroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;

    if-eqz p8, :cond_0

    move-object v0, p0

    .line 145
    invoke-virtual {v0, v9}, Landroid/support/constraint/solver/LinearSystem;->addError(Landroid/support/constraint/solver/ArrayRow;)V

    :cond_0
    return-object v9
.end method

.method public static createRowDimensionPercent(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;FZ)Landroid/support/constraint/solver/ArrayRow;
    .locals 1

    .line 74
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    if-eqz p5, :cond_0

    .line 76
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearSystem;->addError(Landroid/support/constraint/solver/ArrayRow;)V

    .line 78
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/constraint/solver/ArrayRow;->createRowDimensionPercent(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;F)Landroid/support/constraint/solver/ArrayRow;

    move-result-object p0

    return-object p0
.end method

.method public static createRowEquals(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;
    .locals 0

    .line 36
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object p0

    .line 37
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/ArrayRow;->createRowEquals(Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    return-object p0
.end method

.method public static createRowEquals(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;
    .locals 1

    .line 45
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v0

    .line 46
    invoke-virtual {v0, p1, p2, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowEquals(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    if-eqz p4, :cond_0

    const/4 p1, 0x1

    .line 48
    invoke-virtual {p0, v0, p1}, Landroid/support/constraint/solver/LinearSystem;->addSingleError(Landroid/support/constraint/solver/ArrayRow;I)V

    :cond_0
    return-object v0
.end method

.method static createRowFromEquation(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/LinearEquation;)Landroid/support/constraint/solver/ArrayRow;
    .locals 5

    .line 169
    invoke-virtual {p1}, Landroid/support/constraint/solver/LinearEquation;->normalize()V

    .line 170
    invoke-virtual {p1}, Landroid/support/constraint/solver/LinearEquation;->moveAllToTheRight()V

    .line 172
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object p0

    .line 173
    invoke-virtual {p1}, Landroid/support/constraint/solver/LinearEquation;->getRightSide()Ljava/util/ArrayList;

    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 176
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 177
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 179
    iget-object v4, p0, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/constraint/solver/Amount;->toFloat()F

    move-result v2

    invoke-virtual {v4, v3, v2}, Landroid/support/constraint/solver/ArrayLinkedVariables;->put(Landroid/support/constraint/solver/SolverVariable;F)V

    goto :goto_1

    .line 181
    :cond_0
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/constraint/solver/Amount;->toFloat()F

    move-result v2

    iput v2, p0, Landroid/support/constraint/solver/ArrayRow;->constantValue:F

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static createRowGreaterThan(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;
    .locals 2

    .line 86
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createSlackVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 87
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v1

    .line 88
    invoke-virtual {v1, p1, p2, v0, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowGreaterThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    if-eqz p4, :cond_0

    .line 90
    iget-object p1, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {p1, v0}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    .line 91
    invoke-virtual {p0, v1, p1}, Landroid/support/constraint/solver/LinearSystem;->addSingleError(Landroid/support/constraint/solver/ArrayRow;I)V

    :cond_0
    return-object v1
.end method

.method public static createRowLowerThan(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;IZ)Landroid/support/constraint/solver/ArrayRow;
    .locals 2

    .line 112
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createSlackVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    .line 113
    invoke-virtual {p0}, Landroid/support/constraint/solver/LinearSystem;->createRow()Landroid/support/constraint/solver/ArrayRow;

    move-result-object v1

    .line 114
    invoke-virtual {v1, p1, p2, v0, p3}, Landroid/support/constraint/solver/ArrayRow;->createRowLowerThan(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/SolverVariable;I)Landroid/support/constraint/solver/ArrayRow;

    if-eqz p4, :cond_0

    .line 116
    iget-object p1, v1, Landroid/support/constraint/solver/ArrayRow;->variables:Landroid/support/constraint/solver/ArrayLinkedVariables;

    invoke-virtual {p1, v0}, Landroid/support/constraint/solver/ArrayLinkedVariables;->get(Landroid/support/constraint/solver/SolverVariable;)F

    move-result p1

    const/high16 p2, -0x40800000    # -1.0f

    mul-float/2addr p1, p2

    float-to-int p1, p1

    .line 117
    invoke-virtual {p0, v1, p1}, Landroid/support/constraint/solver/LinearSystem;->addSingleError(Landroid/support/constraint/solver/ArrayRow;I)V

    :cond_0
    return-object v1
.end method

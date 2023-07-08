.class Landroid/support/constraint/solver/LinearEquation;
.super Ljava/lang/Object;
.source "LinearEquation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/solver/LinearEquation$Type;
    }
.end annotation


# static fields
.field private static artificialIndex:I

.field private static errorIndex:I

.field private static slackIndex:I


# instance fields
.field private mCurrentSide:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;"
        }
    .end annotation
.end field

.field private mLeftSide:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;"
        }
    .end annotation
.end field

.field private mRightSide:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;"
        }
    .end annotation
.end field

.field private mSystem:Landroid/support/constraint/solver/LinearSystem;

.field private mType:Landroid/support/constraint/solver/LinearEquation$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 52
    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    .line 54
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    .line 142
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearEquation;)V
    .locals 6

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 52
    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    .line 54
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    .line 84
    iget-object v0, p1, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    .line 85
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    .line 86
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 87
    new-instance v5, Landroid/support/constraint/solver/EquationVariable;

    invoke-direct {v5, v4}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/EquationVariable;)V

    .line 88
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 90
    :cond_0
    iget-object p1, p1, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    .line 91
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1
    if-ge v2, v0, :cond_1

    .line 92
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/EquationVariable;

    .line 93
    new-instance v3, Landroid/support/constraint/solver/EquationVariable;

    invoke-direct {v3, v1}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/EquationVariable;)V

    .line 94
    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 96
    :cond_1
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    iput-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/support/constraint/solver/LinearSystem;)V
    .locals 2

    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 52
    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    .line 54
    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    .line 149
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 150
    iput-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    return-void
.end method

.method private find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/constraint/solver/SolverVariable;",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;)",
            "Landroid/support/constraint/solver/EquationVariable;"
        }
    .end annotation

    .line 504
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_1

    .line 505
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/EquationVariable;

    .line 506
    invoke-virtual {v1}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static getNextArtificialVariableName()Ljava/lang/String;
    .locals 2

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Landroid/support/constraint/solver/LinearEquation;->artificialIndex:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Landroid/support/constraint/solver/LinearEquation;->artificialIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getNextErrorVariableName()Ljava/lang/String;
    .locals 2

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "e"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Landroid/support/constraint/solver/LinearEquation;->errorIndex:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Landroid/support/constraint/solver/LinearEquation;->errorIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getNextSlackVariableName()Ljava/lang/String;
    .locals 2

    .line 64
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Landroid/support/constraint/solver/LinearEquation;->slackIndex:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Landroid/support/constraint/solver/LinearEquation;->slackIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private removeNullTerms(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;)V"
        }
    .end annotation

    .line 327
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p0, :cond_1

    .line 328
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 329
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/constraint/solver/Amount;->isNull()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move p0, v0

    :goto_1
    if-eqz p0, :cond_4

    .line 337
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 338
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_2
    if-ge v0, v1, :cond_3

    .line 339
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 340
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/constraint/solver/Amount;->isNull()Z

    move-result v3

    if-nez v3, :cond_2

    .line 341
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 344
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 345
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_4
    return-void
.end method

.method private replace(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/LinearEquation;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/constraint/solver/SolverVariable;",
            "Landroid/support/constraint/solver/LinearEquation;",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;)V"
        }
    .end annotation

    .line 483
    invoke-direct {p0, p1, p3}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 485
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 486
    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p0

    .line 487
    iget-object p1, p2, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 488
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    if-ge p2, v0, :cond_0

    .line 489
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/constraint/solver/EquationVariable;

    .line 490
    new-instance v2, Landroid/support/constraint/solver/EquationVariable;

    invoke-direct {v2, p0, v1}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/Amount;Landroid/support/constraint/solver/EquationVariable;)V

    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static resetNaming()V
    .locals 1

    const/4 v0, 0x0

    .line 74
    sput v0, Landroid/support/constraint/solver/LinearEquation;->artificialIndex:I

    .line 75
    sput v0, Landroid/support/constraint/solver/LinearEquation;->slackIndex:I

    .line 76
    sput v0, Landroid/support/constraint/solver/LinearEquation;->errorIndex:I

    return-void
.end method

.method private sideToString(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string p0, ""

    .line 835
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    move-object v3, p0

    move p0, v1

    :goto_0
    if-ge p0, v0, :cond_2

    .line 836
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    if-eqz v2, :cond_1

    .line 838
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/constraint/solver/Amount;->isPositive()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 839
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 841
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->signString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    move-object v3, v2

    move v2, v1

    goto :goto_2

    .line 845
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->signString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_2
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 848
    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-nez p0, :cond_3

    const-string v3, "0"

    :cond_3
    return-object v3
.end method

.method private simplifySide(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;)V"
        }
    .end annotation

    .line 223
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 224
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 225
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v5, v4

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_3

    .line 226
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/constraint/solver/EquationVariable;

    .line 227
    invoke-virtual {v6}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v7

    if-eqz v7, :cond_1

    if-nez v5, :cond_0

    move-object v5, v6

    goto :goto_1

    .line 231
    :cond_0
    invoke-virtual {v5, v6}, Landroid/support/constraint/solver/EquationVariable;->add(Landroid/support/constraint/solver/EquationVariable;)V

    goto :goto_1

    .line 234
    :cond_1
    invoke-virtual {v6}, Landroid/support/constraint/solver/EquationVariable;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 235
    invoke-virtual {v6}, Landroid/support/constraint/solver/EquationVariable;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/constraint/solver/EquationVariable;

    .line 236
    invoke-virtual {v7, v6}, Landroid/support/constraint/solver/EquationVariable;->add(Landroid/support/constraint/solver/EquationVariable;)V

    goto :goto_1

    .line 238
    :cond_2
    invoke-virtual {v6}, Landroid/support/constraint/solver/EquationVariable;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    invoke-virtual {v6}, Landroid/support/constraint/solver/EquationVariable;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 243
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    if-eqz v5, :cond_4

    .line 245
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 247
    :cond_4
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 248
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_2
    if-ge v3, v2, :cond_5

    .line 249
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 250
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 251
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 253
    :cond_5
    invoke-direct {p0, p1}, Landroid/support/constraint/solver/LinearEquation;->removeNullTerms(Ljava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public addArtificialVar()Landroid/support/constraint/solver/EquationVariable;
    .locals 5

    .line 755
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    .line 756
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextArtificialVariableName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2, v3}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 757
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public balance()V
    .locals 7

    .line 269
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 272
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 273
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 274
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/EquationVariable;

    .line 275
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3}, Landroid/support/constraint/solver/EquationVariable;->inverse()Landroid/support/constraint/solver/EquationVariable;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 277
    :cond_1
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 278
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->simplifySide(Ljava/util/ArrayList;)V

    const/4 v0, 0x0

    .line 280
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_1
    if-ge v3, v2, :cond_3

    .line 281
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 282
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getType()Landroid/support/constraint/solver/SolverVariable$Type;

    move-result-object v5

    sget-object v6, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v5, v6, :cond_2

    move-object v0, v4

    goto :goto_2

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-nez v0, :cond_5

    .line 288
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_3
    if-ge v3, v2, :cond_5

    .line 289
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 290
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getType()Landroid/support/constraint/solver/SolverVariable$Type;

    move-result-object v5

    sget-object v6, Landroid/support/constraint/solver/SolverVariable$Type;->SLACK:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v5, v6, :cond_4

    move-object v0, v4

    goto :goto_4

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_5
    :goto_4
    if-nez v0, :cond_7

    .line 297
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_5
    if-ge v3, v2, :cond_7

    .line 298
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 299
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getType()Landroid/support/constraint/solver/SolverVariable$Type;

    move-result-object v5

    sget-object v6, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v5, v6, :cond_6

    move-object v0, v4

    goto :goto_6

    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_7
    :goto_6
    if-nez v0, :cond_8

    return-void

    .line 308
    :cond_8
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 309
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->inverse()Landroid/support/constraint/solver/EquationVariable;

    .line 310
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/constraint/solver/Amount;->isOne()Z

    move-result v2

    if-nez v2, :cond_a

    .line 311
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v2

    .line 312
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_7
    if-ge v1, v3, :cond_9

    .line 313
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 314
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/support/constraint/solver/Amount;->divide(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 316
    :cond_9
    new-instance v1, Landroid/support/constraint/solver/Amount;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/support/constraint/solver/EquationVariable;->setAmount(Landroid/support/constraint/solver/Amount;)V

    .line 318
    :cond_a
    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Landroid/support/constraint/solver/LinearEquation;->simplifySide(Ljava/util/ArrayList;)V

    .line 319
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public clearLeftSide()V
    .locals 0

    .line 120
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public contains(Landroid/support/constraint/solver/SolverVariable;)Z
    .locals 2

    .line 527
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 530
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public equalsTo()Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    .line 166
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    return-object p0
.end method

.method public getConstant()Landroid/support/constraint/solver/Amount;
    .locals 4

    .line 410
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 411
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 412
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 413
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p0

    return-object p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getFirstUnconstrainedVariable()Landroid/support/constraint/solver/EquationVariable;
    .locals 6

    .line 439
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 440
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/EquationVariable;

    .line 441
    invoke-virtual {v3}, Landroid/support/constraint/solver/EquationVariable;->getType()Landroid/support/constraint/solver/SolverVariable$Type;

    move-result-object v4

    sget-object v5, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v4, v5, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 445
    :cond_1
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1
    if-ge v1, v0, :cond_3

    .line 446
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 447
    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->getType()Landroid/support/constraint/solver/SolverVariable$Type;

    move-result-object v3

    sget-object v4, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    if-ne v3, v4, :cond_2

    return-object v2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method public getLeftVariable()Landroid/support/constraint/solver/EquationVariable;
    .locals 2

    .line 459
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 460
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/constraint/solver/EquationVariable;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public getRightSide()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/support/constraint/solver/EquationVariable;",
            ">;"
        }
    .end annotation

    .line 518
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    return-object p0
.end method

.method public getVariable(Landroid/support/constraint/solver/SolverVariable;)Landroid/support/constraint/solver/EquationVariable;
    .locals 1

    .line 543
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 547
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object p0

    return-object p0
.end method

.method public greaterThan()Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    .line 175
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 176
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$Type;->GREATER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    return-object p0
.end method

.method public hasNegativeConstant()Z
    .locals 5

    .line 393
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 394
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/EquationVariable;

    .line 395
    invoke-virtual {v3}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 396
    invoke-virtual {v3}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/constraint/solver/Amount;->isNegative()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public i()V
    .locals 1

    .line 103
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    if-nez v0, :cond_0

    return-void

    .line 106
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-virtual {v0, p0}, Landroid/support/constraint/solver/LinearSystem;->addConstraint(Landroid/support/constraint/solver/LinearEquation;)V

    return-void
.end method

.method public inverse()V
    .locals 5

    .line 423
    new-instance v0, Landroid/support/constraint/solver/Amount;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    .line 424
    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    .line 425
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 426
    invoke-virtual {v4, v0}, Landroid/support/constraint/solver/EquationVariable;->multiply(Landroid/support/constraint/solver/Amount;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 428
    :cond_0
    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_1
    if-ge v2, v1, :cond_1

    .line 429
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/solver/EquationVariable;

    .line 430
    invoke-virtual {v3, v0}, Landroid/support/constraint/solver/EquationVariable;->multiply(Landroid/support/constraint/solver/Amount;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public isNull()Z
    .locals 4

    .line 37
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 40
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 41
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/EquationVariable;

    .line 42
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/constraint/solver/EquationVariable;

    .line 43
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->isConstant()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/constraint/solver/Amount;->isNull()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/constraint/solver/Amount;->isNull()Z

    move-result p0

    if-eqz p0, :cond_1

    return v1

    :cond_1
    return v2
.end method

.method public lowerThan()Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    .line 185
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 186
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$Type;->LOWER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    return-object p0
.end method

.method public minus(I)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    mul-int/lit8 p1, p1, -0x1

    .line 679
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinearEquation;->var(I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public minus(II)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    mul-int/lit8 p1, p1, -0x1

    .line 703
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/LinearEquation;->var(II)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public minus(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    mul-int/lit8 p1, p1, -0x1

    .line 657
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/LinearEquation;->var(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public minus(Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    const/4 v0, -0x1

    .line 645
    invoke-virtual {p0, v0, p1}, Landroid/support/constraint/solver/LinearEquation;->var(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public moveAllToTheRight()V
    .locals 4

    .line 257
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 258
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/solver/EquationVariable;

    .line 259
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v2}, Landroid/support/constraint/solver/EquationVariable;->inverse()Landroid/support/constraint/solver/EquationVariable;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 261
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public normalize()V
    .locals 2

    .line 195
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    if-ne v0, v1, :cond_0

    return-void

    .line 198
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    .line 199
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->LOWER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    .line 200
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->withSlack(I)Landroid/support/constraint/solver/LinearEquation;

    goto :goto_0

    .line 201
    :cond_1
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    sget-object v1, Landroid/support/constraint/solver/LinearEquation$Type;->GREATER_THAN:Landroid/support/constraint/solver/LinearEquation$Type;

    if-ne v0, v1, :cond_2

    const/4 v0, -0x1

    .line 202
    invoke-virtual {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->withSlack(I)Landroid/support/constraint/solver/LinearEquation;

    .line 204
    :cond_2
    :goto_0
    sget-object v0, Landroid/support/constraint/solver/LinearEquation$Type;->EQUALS:Landroid/support/constraint/solver/LinearEquation$Type;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    .line 205
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    return-void
.end method

.method public pivot(Landroid/support/constraint/solver/SolverVariable;)V
    .locals 7

    .line 354
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    .line 355
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/solver/EquationVariable;

    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    if-ne v0, p1, :cond_0

    return-void

    .line 359
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v3, v1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 360
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 361
    iget-object v5, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->inverse()Landroid/support/constraint/solver/EquationVariable;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 363
    :cond_1
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 364
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->simplifySide(Ljava/util/ArrayList;)V

    const/4 v0, 0x0

    .line 366
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v4, v1

    :goto_1
    if-ge v4, v3, :cond_3

    .line 367
    iget-object v5, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/solver/EquationVariable;

    .line 368
    invoke-virtual {v5}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v6

    if-ne v6, p1, :cond_2

    move-object v0, v5

    goto :goto_2

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v0, :cond_6

    .line 374
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 375
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->inverse()Landroid/support/constraint/solver/EquationVariable;

    .line 376
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/constraint/solver/Amount;->isOne()Z

    move-result p1

    if-nez p1, :cond_5

    .line 377
    invoke-virtual {v0}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object p1

    .line 378
    iget-object v3, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_3
    if-ge v1, v3, :cond_4

    .line 379
    iget-object v4, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/solver/EquationVariable;

    .line 380
    invoke-virtual {v4}, Landroid/support/constraint/solver/EquationVariable;->getAmount()Landroid/support/constraint/solver/Amount;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/support/constraint/solver/Amount;->divide(Landroid/support/constraint/solver/Amount;)Landroid/support/constraint/solver/Amount;

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 382
    :cond_4
    new-instance p1, Landroid/support/constraint/solver/Amount;

    invoke-direct {p1, v2}, Landroid/support/constraint/solver/Amount;-><init>(I)V

    invoke-virtual {v0, p1}, Landroid/support/constraint/solver/EquationVariable;->setAmount(Landroid/support/constraint/solver/Amount;)V

    .line 384
    :cond_5
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    return-void
.end method

.method public plus(I)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    .line 668
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinearEquation;->var(I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public plus(II)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    .line 691
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/LinearEquation;->var(II)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public plus(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    .line 634
    invoke-virtual {p0, p1, p2}, Landroid/support/constraint/solver/LinearEquation;->var(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public plus(Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 0

    .line 622
    invoke-virtual {p0, p1}, Landroid/support/constraint/solver/LinearEquation;->var(Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public remove(Landroid/support/constraint/solver/SolverVariable;)V
    .locals 2

    .line 128
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 132
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/constraint/solver/LinearEquation;->find(Landroid/support/constraint/solver/SolverVariable;Ljava/util/ArrayList;)Landroid/support/constraint/solver/EquationVariable;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 134
    iget-object p0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public replace(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/LinearEquation;)V
    .locals 1

    .line 471
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, p2, v0}, Landroid/support/constraint/solver/LinearEquation;->replace(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/LinearEquation;Ljava/util/ArrayList;)V

    .line 472
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, p1, p2, v0}, Landroid/support/constraint/solver/LinearEquation;->replace(Landroid/support/constraint/solver/SolverVariable;Landroid/support/constraint/solver/LinearEquation;Ljava/util/ArrayList;)V

    return-void
.end method

.method public setLeftSide()V
    .locals 1

    .line 113
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    iput-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    return-void
.end method

.method public setSystem(Landroid/support/constraint/solver/LinearSystem;)V
    .locals 0

    .line 158
    iput-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    return-void
.end method

.method public simplify()V
    .locals 1

    .line 213
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->simplifySide(Ljava/util/ArrayList;)V

    .line 214
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->simplifySide(Ljava/util/ArrayList;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 817
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mLeftSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->sideToString(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 818
    sget-object v1, Landroid/support/constraint/solver/LinearEquation$1;->$SwitchMap$android$support$constraint$solver$LinearEquation$Type:[I

    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mType:Landroid/support/constraint/solver/LinearEquation$Type;

    invoke-virtual {v2}, Landroid/support/constraint/solver/LinearEquation$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 821
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ">= "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 820
    :pswitch_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<= "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 819
    :pswitch_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "= "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 823
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mRightSide:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Landroid/support/constraint/solver/LinearEquation;->sideToString(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 824
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public var(I)Landroid/support/constraint/solver/LinearEquation;
    .locals 2

    .line 557
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    invoke-direct {v0, v1, p1}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;I)V

    .line 558
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public var(II)Landroid/support/constraint/solver/LinearEquation;
    .locals 2

    .line 570
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    new-instance v1, Landroid/support/constraint/solver/Amount;

    invoke-direct {v1, p1, p2}, Landroid/support/constraint/solver/Amount;-><init>(II)V

    invoke-direct {v0, v1}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/Amount;)V

    .line 571
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public var(IILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 2

    .line 609
    new-instance v0, Landroid/support/constraint/solver/Amount;

    invoke-direct {v0, p1, p2}, Landroid/support/constraint/solver/Amount;-><init>(II)V

    .line 610
    new-instance p1, Landroid/support/constraint/solver/EquationVariable;

    iget-object p2, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v1, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {p1, p2, v0, p3, v1}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/Amount;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 611
    iget-object p2, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public var(ILjava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 595
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p1, p2, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 596
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public var(Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 582
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->UNRESTRICTED:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p1, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 583
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withError()Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 731
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextErrorVariableName()Ljava/lang/String;

    move-result-object v0

    .line 732
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroid/support/constraint/solver/LinearEquation;->withError(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    .line 733
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "-"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/support/constraint/solver/LinearEquation;->withError(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public withError(I)Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    .line 768
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextErrorVariableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Landroid/support/constraint/solver/LinearEquation;->withError(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public withError(Landroid/support/constraint/solver/Amount;Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 721
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p1, p2, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/Amount;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 722
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withError(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 715
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p2, p1, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 716
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withPositiveError()Landroid/support/constraint/solver/LinearEquation;
    .locals 2

    .line 738
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextErrorVariableName()Ljava/lang/String;

    move-result-object v0

    .line 739
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "+"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/support/constraint/solver/LinearEquation;->withError(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public withSlack()Landroid/support/constraint/solver/LinearEquation;
    .locals 2

    .line 796
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextSlackVariableName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/support/constraint/solver/LinearEquation;->withSlack(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public withSlack(I)Landroid/support/constraint/solver/LinearEquation;
    .locals 1

    .line 807
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextSlackVariableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Landroid/support/constraint/solver/LinearEquation;->withSlack(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;

    return-object p0
.end method

.method public withSlack(Landroid/support/constraint/solver/Amount;Ljava/lang/String;)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 786
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->SLACK:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p1, p2, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;Landroid/support/constraint/solver/Amount;Ljava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 787
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withSlack(Ljava/lang/String;I)Landroid/support/constraint/solver/LinearEquation;
    .locals 3

    .line 780
    new-instance v0, Landroid/support/constraint/solver/EquationVariable;

    iget-object v1, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Type;->SLACK:Landroid/support/constraint/solver/SolverVariable$Type;

    invoke-direct {v0, v1, p2, p1, v2}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 781
    iget-object p1, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public withStrongError()Landroid/support/constraint/solver/LinearEquation;
    .locals 6

    .line 744
    invoke-static {}, Landroid/support/constraint/solver/LinearEquation;->getNextErrorVariableName()Ljava/lang/String;

    move-result-object v0

    .line 745
    new-instance v1, Landroid/support/constraint/solver/EquationVariable;

    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "+"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    const/4 v5, 0x1

    invoke-direct {v1, v2, v5, v3, v4}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 746
    invoke-virtual {v1}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v2

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Strength;->STRONG:Landroid/support/constraint/solver/SolverVariable$Strength;

    invoke-virtual {v2, v3}, Landroid/support/constraint/solver/SolverVariable;->setStrength(Landroid/support/constraint/solver/SolverVariable$Strength;)V

    .line 747
    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 748
    new-instance v1, Landroid/support/constraint/solver/EquationVariable;

    iget-object v2, p0, Landroid/support/constraint/solver/LinearEquation;->mSystem:Landroid/support/constraint/solver/LinearSystem;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "-"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Landroid/support/constraint/solver/SolverVariable$Type;->ERROR:Landroid/support/constraint/solver/SolverVariable$Type;

    const/4 v4, -0x1

    invoke-direct {v1, v2, v4, v0, v3}, Landroid/support/constraint/solver/EquationVariable;-><init>(Landroid/support/constraint/solver/LinearSystem;ILjava/lang/String;Landroid/support/constraint/solver/SolverVariable$Type;)V

    .line 749
    invoke-virtual {v1}, Landroid/support/constraint/solver/EquationVariable;->getSolverVariable()Landroid/support/constraint/solver/SolverVariable;

    move-result-object v0

    sget-object v2, Landroid/support/constraint/solver/SolverVariable$Strength;->STRONG:Landroid/support/constraint/solver/SolverVariable$Strength;

    invoke-virtual {v0, v2}, Landroid/support/constraint/solver/SolverVariable;->setStrength(Landroid/support/constraint/solver/SolverVariable$Strength;)V

    .line 750
    iget-object v0, p0, Landroid/support/constraint/solver/LinearEquation;->mCurrentSide:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

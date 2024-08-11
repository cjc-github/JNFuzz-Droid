.class public Landroid/support/constraint/ConstraintSet;
.super Ljava/lang/Object;
.source "ConstraintSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/constraint/ConstraintSet$Constraint;
    }
.end annotation


# static fields
.field public static final BASELINE:I = 0x5

.field private static final BASELINE_TO_BASELINE:I = 0x1

.field public static final BOTTOM:I = 0x4

.field private static final BOTTOM_MARGIN:I = 0x2

.field private static final BOTTOM_TO_BOTTOM:I = 0x3

.field private static final BOTTOM_TO_TOP:I = 0x4

.field private static final DEBUG:Z = false

.field private static final DIMENSION_RATIO:I = 0x5

.field private static final EDITOR_ABSOLUTE_X:I = 0x6

.field private static final EDITOR_ABSOLUTE_Y:I = 0x7

.field public static final END:I = 0x7

.field private static final END_MARGIN:I = 0x8

.field private static final END_TO_END:I = 0x9

.field private static final END_TO_START:I = 0xa

.field public static final GONE:I = 0x8

.field private static final GONE_BOTTOM_MARGIN:I = 0xb

.field private static final GONE_END_MARGIN:I = 0xc

.field private static final GONE_LEFT_MARGIN:I = 0xd

.field private static final GONE_RIGHT_MARGIN:I = 0xe

.field private static final GONE_START_MARGIN:I = 0xf

.field private static final GONE_TOP_MARGIN:I = 0x10

.field private static final GUIDE_BEGIN:I = 0x11

.field private static final GUIDE_END:I = 0x12

.field private static final GUIDE_PERCENT:I = 0x13

.field public static final HORIZONTAL:I = 0x0

.field private static final HORIZONTAL_BIAS:I = 0x14

.field public static final HORIZONTAL_GUIDELINE:I = 0x0

.field private static final HORIZONTAL_STYLE:I = 0x29

.field private static final HORIZONTAL_WEIGHT:I = 0x27

.field public static final INVISIBLE:I = 0x4

.field private static final LAYOUT_HEIGHT:I = 0x15

.field private static final LAYOUT_VISIBILITY:I = 0x16

.field private static final LAYOUT_WIDTH:I = 0x17

.field public static final LEFT:I = 0x1

.field private static final LEFT_MARGIN:I = 0x18

.field private static final LEFT_TO_LEFT:I = 0x19

.field private static final LEFT_TO_RIGHT:I = 0x1a

.field public static final MATCH_CONSTRAINT:I = 0x0

.field private static final ORIENTATION:I = 0x1b

.field public static final PARENT_ID:I = 0x0

.field public static final RIGHT:I = 0x2

.field private static final RIGHT_MARGIN:I = 0x1c

.field private static final RIGHT_TO_LEFT:I = 0x1d

.field private static final RIGHT_TO_RIGHT:I = 0x1e

.field public static final START:I = 0x6

.field private static final START_MARGIN:I = 0x1f

.field private static final START_TO_END:I = 0x20

.field private static final START_TO_START:I = 0x21

.field private static final TAG:Ljava/lang/String; = "ConstraintSet"

.field public static final TOP:I = 0x3

.field private static final TOP_MARGIN:I = 0x22

.field private static final TOP_TO_BOTTOM:I = 0x23

.field private static final TOP_TO_TOP:I = 0x24

.field private static final UNUSED:I = 0x2b

.field public static final VERTICAL:I = 0x1

.field private static final VERTICAL_BIAS:I = 0x25

.field public static final VERTICAL_GUIDELINE:I = 0x1

.field private static final VERTICAL_STYLE:I = 0x2a

.field private static final VERTICAL_WEIGHT:I = 0x28

.field private static final VIEW_ID:I = 0x26

.field private static final VISIBILITY_FLAGS:[I

.field public static final VISIBLE:I = 0x0

.field public static final WRAP_CONTENT:I = -0x2

.field private static mapToConstant:Landroid/util/SparseIntArray;


# instance fields
.field private mConstraints:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/support/constraint/ConstraintSet$Constraint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x3

    .line 158
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Landroid/support/constraint/ConstraintSet;->VISIBILITY_FLAGS:[I

    .line 162
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    .line 210
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintLeft_toLeftOf:I

    const/16 v3, 0x19

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 211
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintLeft_toRightOf:I

    const/16 v3, 0x1a

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 212
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintRight_toLeftOf:I

    const/16 v3, 0x1d

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 213
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintRight_toRightOf:I

    const/16 v3, 0x1e

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 214
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintTop_toTopOf:I

    const/16 v3, 0x24

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 215
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintTop_toBottomOf:I

    const/16 v3, 0x23

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 216
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintBottom_toTopOf:I

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 217
    sget-object v1, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v2, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintBottom_toBottomOf:I

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->append(II)V

    .line 218
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintBaseline_toBaselineOf:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 220
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_editor_absoluteX:I

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 221
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_editor_absoluteY:I

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 222
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintGuide_begin:I

    const/16 v2, 0x11

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 223
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintGuide_end:I

    const/16 v2, 0x12

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 224
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintGuide_percent:I

    const/16 v2, 0x13

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 225
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_orientation:I

    const/16 v2, 0x1b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 226
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintStart_toEndOf:I

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 227
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintStart_toStartOf:I

    const/16 v2, 0x21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 228
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintEnd_toStartOf:I

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 229
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintEnd_toEndOf:I

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 230
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginLeft:I

    const/16 v2, 0xd

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 231
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginTop:I

    const/16 v2, 0x10

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 232
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginRight:I

    const/16 v2, 0xe

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 233
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginBottom:I

    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 234
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginStart:I

    const/16 v2, 0xf

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 235
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_goneMarginEnd:I

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 236
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintVertical_weight:I

    const/16 v2, 0x28

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 237
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintHorizontal_weight:I

    const/16 v2, 0x27

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 238
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintHorizontal_chainStyle:I

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 239
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintVertical_chainStyle:I

    const/16 v2, 0x2a

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 243
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintHorizontal_bias:I

    const/16 v2, 0x14

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 244
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintVertical_bias:I

    const/16 v2, 0x25

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 245
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintDimensionRatio:I

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 246
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintLeft_creator:I

    const/16 v2, 0x2b

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 247
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintTop_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 248
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintRight_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 249
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintBottom_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 250
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_layout_constraintBaseline_creator:I

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 251
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginLeft:I

    const/16 v2, 0x18

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 252
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginRight:I

    const/16 v2, 0x1c

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 253
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginStart:I

    const/16 v2, 0x1f

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 254
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginEnd:I

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 255
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginTop:I

    const/16 v2, 0x22

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 256
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_marginBottom:I

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 257
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_width:I

    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 258
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_layout_height:I

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 259
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_visibility:I

    const/16 v2, 0x16

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 260
    sget-object v0, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    sget v1, Landroid/support/constraint/R$styleable;->ConstraintSet_android_id:I

    const/16 v2, 0x26

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x4
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    return-void
.end method

.method private centerHorizontally(IIIIIIIF)V
    .locals 9

    const/4 v2, 0x1

    move-object v0, p0

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 512
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v5, 0x2

    move-object v3, p0

    move v4, p1

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    .line 513
    invoke-virtual/range {v3 .. v8}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 514
    iget-object v0, v0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/ConstraintSet$Constraint;

    move/from16 v1, p8

    .line 515
    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    return-void
.end method

.method private centerVertically(IIIIIIIF)V
    .locals 9

    const/4 v2, 0x3

    move-object v0, p0

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    .line 519
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v5, 0x4

    move-object v3, p0

    move v4, p1

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    .line 520
    invoke-virtual/range {v3 .. v8}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 521
    iget-object v0, v0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/ConstraintSet$Constraint;

    move/from16 v1, p8

    .line 522
    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    return-void
.end method

.method private fillFromAttributeList(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/constraint/ConstraintSet$Constraint;
    .locals 2

    .line 1013
    new-instance v0, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>(Landroid/support/constraint/ConstraintSet$1;)V

    .line 1014
    sget-object v1, Landroid/support/constraint/R$styleable;->ConstraintSet:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 1015
    invoke-direct {p0, v0, p1}, Landroid/support/constraint/ConstraintSet;->populateConstraint(Landroid/support/constraint/ConstraintSet$Constraint;Landroid/content/res/TypedArray;)V

    .line 1016
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-object v0
.end method

.method private get(I)Landroid/support/constraint/ConstraintSet$Constraint;
    .locals 4

    .line 936
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 937
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>(Landroid/support/constraint/ConstraintSet$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 939
    :cond_0
    iget-object p0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/constraint/ConstraintSet$Constraint;

    return-object p0
.end method

.method private static lookupID(Landroid/content/res/TypedArray;II)I
    .locals 1

    .line 1005
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 1007
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    :cond_0
    return p2
.end method

.method private populateConstraint(Landroid/support/constraint/ConstraintSet$Constraint;Landroid/content/res/TypedArray;)V
    .locals 5

    .line 1021
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_0

    .line 1023
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 1058
    sget-object v2, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    const-string v2, "ConstraintSet"

    .line 1187
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown attribute 0x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "   "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Landroid/support/constraint/ConstraintSet;->mapToConstant:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1175
    :pswitch_0
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    goto/16 :goto_1

    .line 1178
    :pswitch_1
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    goto/16 :goto_1

    .line 1169
    :pswitch_2
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    goto/16 :goto_1

    .line 1172
    :pswitch_3
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalWeight:F

    goto/16 :goto_1

    .line 1181
    :pswitch_4
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mViewId:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mViewId:I

    goto/16 :goto_1

    .line 1138
    :pswitch_5
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    goto/16 :goto_1

    .line 1072
    :pswitch_6
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    goto/16 :goto_1

    .line 1075
    :pswitch_7
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    goto/16 :goto_1

    .line 1153
    :pswitch_8
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    goto/16 :goto_1

    .line 1108
    :pswitch_9
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    goto/16 :goto_1

    .line 1105
    :pswitch_a
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    goto/16 :goto_1

    .line 1147
    :pswitch_b
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    goto/16 :goto_1

    .line 1069
    :pswitch_c
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    goto/16 :goto_1

    .line 1066
    :pswitch_d
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    goto/16 :goto_1

    .line 1144
    :pswitch_e
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    goto/16 :goto_1

    .line 1102
    :pswitch_f
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    goto/16 :goto_1

    .line 1063
    :pswitch_10
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    goto/16 :goto_1

    .line 1060
    :pswitch_11
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    goto/16 :goto_1

    .line 1141
    :pswitch_12
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    goto/16 :goto_1

    .line 1159
    :pswitch_13
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    goto/16 :goto_1

    .line 1165
    :pswitch_14
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    .line 1166
    sget-object v1, Landroid/support/constraint/ConstraintSet;->VISIBILITY_FLAGS:[I

    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    aget v1, v1, v2

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    goto/16 :goto_1

    .line 1162
    :pswitch_15
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    goto/16 :goto_1

    .line 1135
    :pswitch_16
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    goto/16 :goto_1

    .line 1099
    :pswitch_17
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    goto/16 :goto_1

    .line 1096
    :pswitch_18
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    goto/16 :goto_1

    .line 1093
    :pswitch_19
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    goto/16 :goto_1

    .line 1120
    :pswitch_1a
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneTopMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneTopMargin:I

    goto/16 :goto_1

    .line 1129
    :pswitch_1b
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneStartMargin:I

    goto/16 :goto_1

    .line 1123
    :pswitch_1c
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneRightMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneRightMargin:I

    goto/16 :goto_1

    .line 1117
    :pswitch_1d
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneLeftMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneLeftMargin:I

    goto/16 :goto_1

    .line 1132
    :pswitch_1e
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneEndMargin:I

    goto :goto_1

    .line 1126
    :pswitch_1f
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneBottomMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->goneBottomMargin:I

    goto :goto_1

    .line 1111
    :pswitch_20
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    goto :goto_1

    .line 1114
    :pswitch_21
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    goto :goto_1

    .line 1150
    :pswitch_22
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    goto :goto_1

    .line 1090
    :pswitch_23
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteY:I

    goto :goto_1

    .line 1087
    :pswitch_24
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->editorAbsoluteX:I

    goto :goto_1

    .line 1184
    :pswitch_25
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    goto :goto_1

    .line 1078
    :pswitch_26
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    goto :goto_1

    .line 1081
    :pswitch_27
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    goto :goto_1

    .line 1156
    :pswitch_28
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    goto :goto_1

    .line 1084
    :pswitch_29
    iget v2, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    invoke-static {p2, v1, v2}, Landroid/support/constraint/ConstraintSet;->lookupID(Landroid/content/res/TypedArray;II)I

    move-result v1

    iput v1, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private sideToString(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    const-string p0, "undefined"

    return-object p0

    :pswitch_0
    const-string p0, "end"

    return-object p0

    :pswitch_1
    const-string p0, "start"

    return-object p0

    :pswitch_2
    const-string p0, "baseline"

    return-object p0

    :pswitch_3
    const-string p0, "bottom"

    return-object p0

    :pswitch_4
    const-string p0, "top"

    return-object p0

    :pswitch_5
    const-string p0, "right"

    return-object p0

    :pswitch_6
    const-string p0, "left"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public applyTo(Landroid/support/constraint/ConstraintLayout;)V
    .locals 7

    .line 443
    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->getChildCount()I

    move-result v0

    .line 444
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 447
    invoke-virtual {p1, v2}, Landroid/support/constraint/ConstraintLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 448
    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v4

    .line 449
    iget-object v5, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 450
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 451
    iget-object v5, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/constraint/ConstraintSet$Constraint;

    .line 452
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .line 453
    invoke-virtual {v4, v5}, Landroid/support/constraint/ConstraintSet$Constraint;->applyTo(Landroid/support/constraint/ConstraintLayout$LayoutParams;)V

    .line 454
    invoke-virtual {v3, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 455
    iget v4, v4, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 458
    :cond_1
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 459
    iget-object v2, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/ConstraintSet$Constraint;

    .line 460
    iget-boolean v3, v2, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    if-eqz v3, :cond_2

    .line 461
    new-instance v3, Landroid/support/constraint/Guideline;

    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/support/constraint/Guideline;-><init>(Landroid/content/Context;)V

    .line 462
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v3, v1}, Landroid/support/constraint/Guideline;->setId(I)V

    .line 463
    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->generateDefaultLayoutParams()Landroid/support/constraint/ConstraintLayout$LayoutParams;

    move-result-object v1

    .line 464
    invoke-virtual {v2, v1}, Landroid/support/constraint/ConstraintSet$Constraint;->applyTo(Landroid/support/constraint/ConstraintLayout$LayoutParams;)V

    .line 465
    invoke-virtual {p1, v3, v1}, Landroid/support/constraint/ConstraintLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public center(IIIIIIIF)V
    .locals 9

    move-object v6, p0

    move v4, p3

    move/from16 v7, p8

    if-gez p4, :cond_0

    .line 489
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "margin must be > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-gez p7, :cond_1

    .line 492
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "margin must be > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    cmpg-float v0, v7, v0

    if-lez v0, :cond_5

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, v7, v0

    if-lez v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x1

    if-eq v4, v0, :cond_4

    const/4 v0, 0x2

    if-ne v4, v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x3

    move-object v0, v6

    move v1, p1

    move v3, p2

    move v5, p4

    .line 504
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v2, 0x4

    move v3, p5

    move v4, p6

    move/from16 v5, p7

    .line 505
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 506
    iget-object v0, v6, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/ConstraintSet$Constraint;

    .line 507
    iput v7, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v2, 0x1

    move-object v0, v6

    move v1, p1

    move v3, p2

    move v5, p4

    .line 499
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v2, 0x2

    move v3, p5

    move v4, p6

    move/from16 v5, p7

    .line 500
    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 501
    iget-object v0, v6, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/constraint/ConstraintSet$Constraint;

    .line 502
    iput v7, v0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    :goto_1
    return-void

    .line 495
    :cond_5
    :goto_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bias must be between 0 and 1 inclusive"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public centerHorizontally(II)V
    .locals 9

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/high16 v8, 0x3f000000    # 0.5f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v5, p2

    .line 718
    invoke-virtual/range {v0 .. v8}, Landroid/support/constraint/ConstraintSet;->center(IIIIIIIF)V

    return-void
.end method

.method public centerVertically(II)V
    .locals 9

    const/4 v3, 0x3

    const/4 v4, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x0

    const/high16 v8, 0x3f000000    # 0.5f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v5, p2

    .line 728
    invoke-virtual/range {v0 .. v8}, Landroid/support/constraint/ConstraintSet;->center(IIIIIIIF)V

    return-void
.end method

.method public clear(I)V
    .locals 0

    .line 737
    iget-object p0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public clear(II)V
    .locals 2

    .line 747
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 748
    iget-object p0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 p1, 0x0

    const/4 v0, -0x1

    packed-switch p2, :pswitch_data_0

    .line 785
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "unknown constraint"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 780
    :pswitch_0
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 781
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 782
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    goto :goto_0

    .line 775
    :pswitch_1
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 776
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 777
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    goto :goto_0

    .line 772
    :pswitch_2
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    goto :goto_0

    .line 766
    :pswitch_3
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 767
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 768
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    goto :goto_0

    .line 761
    :pswitch_4
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 762
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 763
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    goto :goto_0

    .line 756
    :pswitch_5
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 757
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 758
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    goto :goto_0

    .line 751
    :pswitch_6
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 752
    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 753
    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public clone(Landroid/content/Context;I)V
    .locals 1

    .line 412
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/constraint/ConstraintLayout;

    invoke-virtual {p0, p1}, Landroid/support/constraint/ConstraintSet;->clone(Landroid/support/constraint/ConstraintLayout;)V

    return-void
.end method

.method public clone(Landroid/support/constraint/ConstraintLayout;)V
    .locals 9

    .line 421
    invoke-virtual {p1}, Landroid/support/constraint/ConstraintLayout;->getChildCount()I

    move-result v0

    .line 422
    iget-object v1, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 424
    invoke-virtual {p1, v1}, Landroid/support/constraint/ConstraintLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 425
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    .line 427
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v4

    .line 428
    iget-object v5, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 429
    iget-object v5, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 v8, 0x0

    invoke-direct {v7, v8}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>(Landroid/support/constraint/ConstraintSet$1;)V

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    :cond_0
    iget-object v5, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/constraint/ConstraintSet$Constraint;

    .line 432
    invoke-static {v5, v4, v3}, Landroid/support/constraint/ConstraintSet$Constraint;->access$100(Landroid/support/constraint/ConstraintSet$Constraint;ILandroid/support/constraint/ConstraintLayout$LayoutParams;)V

    .line 433
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    iput v2, v5, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public connect(IIIII)V
    .locals 7

    .line 608
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 609
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/support/constraint/ConstraintSet$Constraint;-><init>(Landroid/support/constraint/ConstraintSet$1;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 611
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/constraint/ConstraintSet$Constraint;

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x4

    const/4 v4, 0x6

    const/4 v5, 0x7

    const/4 v6, -0x1

    packed-switch p2, :pswitch_data_0

    .line 707
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p2}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " to "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " unknown"

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    if-ne p4, v5, :cond_1

    .line 696
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 697
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    goto :goto_0

    :cond_1
    if-ne p4, v4, :cond_2

    .line 699
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToStart:I

    .line 700
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endToEnd:I

    .line 704
    :goto_0
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    goto/16 :goto_6

    .line 702
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_1
    if-ne p4, v4, :cond_3

    .line 684
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 685
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    goto :goto_1

    :cond_3
    if-ne p4, v5, :cond_4

    .line 687
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToEnd:I

    .line 688
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startToStart:I

    .line 692
    :goto_1
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    goto/16 :goto_6

    .line 690
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_2
    const/4 p2, 0x5

    if-ne p4, p2, :cond_5

    .line 673
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 674
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 675
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 676
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 677
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    goto/16 :goto_6

    .line 679
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_3
    if-ne p4, v3, :cond_6

    .line 657
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 658
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 659
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    goto :goto_2

    :cond_6
    if-ne p4, v2, :cond_7

    .line 662
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToTop:I

    .line 663
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomToBottom:I

    .line 664
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 669
    :goto_2
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    goto/16 :goto_6

    .line 667
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_4
    if-ne p4, v2, :cond_8

    .line 642
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 643
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 644
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    goto :goto_3

    :cond_8
    if-ne p4, v3, :cond_9

    .line 646
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToBottom:I

    .line 647
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topToTop:I

    .line 648
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->baselineToBaseline:I

    .line 653
    :goto_3
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    goto :goto_6

    .line 651
    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_5
    if-ne p4, v1, :cond_a

    .line 628
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 629
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    goto :goto_4

    :cond_a
    if-ne p4, v0, :cond_b

    .line 632
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToRight:I

    .line 633
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightToLeft:I

    .line 638
    :goto_4
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    goto :goto_6

    .line 636
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "right to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_6
    if-ne p4, v1, :cond_c

    .line 615
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 616
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    goto :goto_5

    :cond_c
    if-ne p4, v0, :cond_d

    .line 618
    iput p3, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToRight:I

    .line 619
    iput v6, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftToLeft:I

    .line 624
    :goto_5
    iput p5, p1, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    :goto_6
    return-void

    .line 622
    :cond_d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Left to "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Landroid/support/constraint/ConstraintSet;->sideToString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " undefined"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constrainHeight(II)V
    .locals 0

    .line 873
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mHeight:I

    return-void
.end method

.method public constrainWidth(II)V
    .locals 0

    .line 883
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mWidth:I

    return-void
.end method

.method public create(II)V
    .locals 0

    .line 893
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    const/4 p1, 0x1

    .line 894
    iput-boolean p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    .line 895
    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->orientation:I

    return-void
.end method

.method public createHorizontalChain(II[I[FI)V
    .locals 12

    move-object v6, p0

    move-object v7, p3

    move-object/from16 v8, p4

    .line 573
    array-length v0, v7

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 574
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "must have 2 or more widgets in a chain"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-eqz v8, :cond_1

    .line 576
    array-length v0, v8

    array-length v1, v7

    if-eq v0, v1, :cond_1

    .line 577
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "must have 2 or more widgets in a chain"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    if-eqz v8, :cond_2

    .line 580
    aget v1, v7, v0

    invoke-direct {v6, v1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v1

    aget v2, v8, v0

    iput v2, v1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 582
    :cond_2
    aget v1, v7, v0

    invoke-direct {v6, v1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v1

    move/from16 v2, p5

    iput v2, v1, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalChainStyle:I

    .line 583
    aget v1, v7, v0

    const/4 v2, 0x3

    const/4 v4, 0x3

    const/4 v5, 0x0

    move-object v0, v6

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v9, 0x1

    move v10, v9

    .line 584
    :goto_0
    array-length v0, v7

    sub-int/2addr v0, v9

    if-ge v10, v0, :cond_4

    .line 585
    aget v0, v7, v10

    .line 586
    aget v1, v7, v10

    const/4 v2, 0x3

    add-int/lit8 v11, v10, -0x1

    aget v3, v7, v11

    const/4 v4, 0x4

    const/4 v5, 0x0

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 587
    aget v1, v7, v11

    const/4 v2, 0x4

    aget v3, v7, v10

    const/4 v4, 0x3

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    if-eqz v8, :cond_3

    .line 589
    aget v0, v7, v10

    invoke-direct {v6, v0}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    aget v1, v8, v10

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 592
    :cond_4
    array-length v0, v7

    sub-int/2addr v0, v9

    aget v1, v7, v0

    const/4 v2, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x0

    move-object v0, v6

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    if-eqz v8, :cond_5

    .line 594
    array-length v0, v7

    sub-int/2addr v0, v9

    aget v0, v7, v0

    invoke-direct {v6, v0}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    array-length v1, v7

    sub-int/2addr v1, v9

    aget v1, v8, v1

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    :cond_5
    return-void
.end method

.method public createVerticalChain(II[I[FI)V
    .locals 12

    move-object v6, p0

    move-object v7, p3

    move-object/from16 v8, p4

    .line 536
    array-length v0, v7

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 537
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "must have 2 or more widgets in a chain"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-eqz v8, :cond_1

    .line 539
    array-length v0, v8

    array-length v1, v7

    if-eq v0, v1, :cond_1

    .line 540
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "must have 2 or more widgets in a chain"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    if-eqz v8, :cond_2

    .line 543
    aget v1, v7, v0

    invoke-direct {v6, v1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v1

    aget v2, v8, v0

    iput v2, v1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    .line 545
    :cond_2
    aget v1, v7, v0

    invoke-direct {v6, v1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v1

    move/from16 v2, p5

    iput v2, v1, Landroid/support/constraint/ConstraintSet$Constraint;->verticalChainStyle:I

    .line 547
    aget v1, v7, v0

    const/4 v2, 0x3

    const/4 v4, 0x3

    const/4 v5, 0x0

    move-object v0, v6

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    const/4 v9, 0x1

    move v10, v9

    .line 548
    :goto_0
    array-length v0, v7

    sub-int/2addr v0, v9

    if-ge v10, v0, :cond_4

    .line 549
    aget v0, v7, v10

    .line 550
    aget v1, v7, v10

    const/4 v2, 0x3

    add-int/lit8 v11, v10, -0x1

    aget v3, v7, v11

    const/4 v4, 0x4

    const/4 v5, 0x0

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    .line 551
    aget v1, v7, v11

    const/4 v2, 0x4

    aget v3, v7, v10

    const/4 v4, 0x3

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    if-eqz v8, :cond_3

    .line 553
    aget v0, v7, v10

    invoke-direct {v6, v0}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    aget v1, v8, v10

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    :cond_3
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 556
    :cond_4
    array-length v0, v7

    sub-int/2addr v0, v9

    aget v1, v7, v0

    const/4 v2, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x0

    move-object v0, v6

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/support/constraint/ConstraintSet;->connect(IIIII)V

    if-eqz v8, :cond_5

    .line 558
    array-length v0, v7

    sub-int/2addr v0, v9

    aget v0, v7, v0

    invoke-direct {v6, v0}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    array-length v1, v7

    sub-int/2addr v1, v9

    aget v1, v8, v1

    iput v1, v0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalWeight:F

    :cond_5
    return-void
.end method

.method public load(Landroid/content/Context;I)V
    .locals 4

    .line 969
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 970
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p2

    .line 975
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    :goto_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    if-eqz v0, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 983
    :pswitch_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 984
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Landroid/support/constraint/ConstraintSet;->fillFromAttributeList(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v2

    const-string v3, "Guideline"

    .line 985
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 986
    iput-boolean v1, v2, Landroid/support/constraint/ConstraintSet$Constraint;->mIsGuideline:Z

    .line 988
    :cond_0
    iget-object v0, p0, Landroid/support/constraint/ConstraintSet;->mConstraints:Ljava/util/HashMap;

    iget v1, v2, Landroid/support/constraint/ConstraintSet$Constraint;->mViewId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 980
    :cond_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 977
    :goto_1
    :pswitch_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 1000
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    :catch_1
    move-exception p0

    .line 998
    invoke-virtual {p0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_2
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setDimensionRatio(ILjava/lang/String;)V
    .locals 0

    .line 853
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput-object p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->dimensionRatio:Ljava/lang/String;

    return-void
.end method

.method public setGuidelineBegin(II)V
    .locals 1

    .line 905
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    iput p2, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 906
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p2

    const/4 v0, -0x1

    iput v0, p2, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 907
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    const/high16 p1, 0x3f000000    # 0.5f

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    return-void
.end method

.method public setGuidelineEnd(II)V
    .locals 1

    .line 918
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    iput p2, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 919
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p2

    const/4 v0, -0x1

    iput v0, p2, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    .line 920
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    const/high16 p1, 0x3f000000    # 0.5f

    iput p1, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    return-void
.end method

.method public setGuidelinePercent(IF)V
    .locals 1

    .line 930
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object v0

    iput p2, v0, Landroid/support/constraint/ConstraintSet$Constraint;->guidePercent:F

    .line 931
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p2

    const/4 v0, -0x1

    iput v0, p2, Landroid/support/constraint/ConstraintSet$Constraint;->guideEnd:I

    .line 932
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput v0, p0, Landroid/support/constraint/ConstraintSet$Constraint;->guideBegin:I

    return-void
.end method

.method public setHorizontalBias(IF)V
    .locals 0

    .line 832
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->horizontalBias:F

    return-void
.end method

.method public setMargin(III)V
    .locals 0

    .line 798
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    packed-switch p2, :pswitch_data_0

    .line 821
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "unknown constraint"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 818
    :pswitch_0
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->endMargin:I

    goto :goto_0

    .line 815
    :pswitch_1
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->startMargin:I

    goto :goto_0

    .line 813
    :pswitch_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "baseline does not support margins"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 810
    :pswitch_3
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->bottomMargin:I

    goto :goto_0

    .line 807
    :pswitch_4
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->topMargin:I

    goto :goto_0

    .line 804
    :pswitch_5
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->rightMargin:I

    goto :goto_0

    .line 801
    :pswitch_6
    iput p3, p0, Landroid/support/constraint/ConstraintSet$Constraint;->leftMargin:I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setVerticalBias(IF)V
    .locals 0

    .line 842
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->verticalBias:F

    return-void
.end method

.method public setVisibility(II)V
    .locals 0

    .line 863
    invoke-direct {p0, p1}, Landroid/support/constraint/ConstraintSet;->get(I)Landroid/support/constraint/ConstraintSet$Constraint;

    move-result-object p0

    iput p2, p0, Landroid/support/constraint/ConstraintSet$Constraint;->visibility:I

    return-void
.end method

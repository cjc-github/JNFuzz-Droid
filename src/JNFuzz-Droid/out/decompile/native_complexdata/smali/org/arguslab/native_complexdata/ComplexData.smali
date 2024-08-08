.class public Lorg/arguslab/native_complexdata/ComplexData;
.super Ljava/lang/Object;
.source "ComplexData.java"


# instance fields
.field private data:Ljava/lang/String;

.field private index:I

.field private other:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/String;
    .locals 0

    .line 9
    iget-object p0, p0, Lorg/arguslab/native_complexdata/ComplexData;->data:Ljava/lang/String;

    return-object p0
.end method

.method public getIndex()I
    .locals 0

    .line 17
    iget p0, p0, Lorg/arguslab/native_complexdata/ComplexData;->index:I

    return p0
.end method

.method public getOther()Ljava/lang/String;
    .locals 0

    .line 25
    iget-object p0, p0, Lorg/arguslab/native_complexdata/ComplexData;->other:Ljava/lang/String;

    return-object p0
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lorg/arguslab/native_complexdata/ComplexData;->data:Ljava/lang/String;

    return-void
.end method

.method public setIndex(I)V
    .locals 0

    .line 21
    iput p1, p0, Lorg/arguslab/native_complexdata/ComplexData;->index:I

    return-void
.end method

.method public setOther(Ljava/lang/String;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lorg/arguslab/native_complexdata/ComplexData;->other:Ljava/lang/String;

    return-void
.end method

.class public abstract Lcom/abupdate/iot_libs/engine/e/a/b;
.super Lcom/abupdate/iot_libs/engine/e/a/d;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/abupdate/iot_libs/interact/response/BaseResponse;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/abupdate/iot_libs/engine/e/a/d<",
        "TT;TV;>;"
    }
.end annotation


# instance fields
.field private a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/io/File;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/abupdate/iot_libs/interact/response/BaseResponse;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/abupdate/iot_libs/engine/e/a/d;-><init>(Landroid/content/Context;Lcom/abupdate/iot_libs/interact/response/BaseResponse;)V

    .line 37
    return-void
.end method

.method private c()V
    .registers 6

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    iget-object v2, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->a:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_19
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_40

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 74
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    goto :goto_19

    .line 79
    :cond_40
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Params:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PostFileRequest"

    invoke-static {v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    return-void
.end method


# virtual methods
.method protected a()Lcom/abupdate/http_libs/response/Response;
    .registers 5

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "url:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/abupdate/iot_libs/engine/e/a/d;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PostFileRequest"

    invoke-static {v1, v0}, Lb/a/c/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    invoke-virtual {p0}, Lcom/abupdate/iot_libs/engine/e/a/b;->b()V

    .line 51
    invoke-direct {p0}, Lcom/abupdate/iot_libs/engine/e/a/b;->c()V

    .line 53
    nop

    .line 55
    const/4 v0, 0x0

    :try_start_20
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/abupdate/iot_libs/data/constant/SDKConfig;->ABUP_KEY:[B

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    const-string v2, "abup.bks"

    invoke-static {v1, v2}, Lcom/abupdate/iot_libs/utils/e;->a(Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 56
    if-eqz v1, :cond_33

    .line 57
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_33} :catch_34

    .line 61
    :cond_33
    goto :goto_38

    .line 59
    :catch_34
    move-exception v1

    .line 60
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 62
    :goto_38
    iget-object v1, p0, Lcom/abupdate/iot_libs/engine/e/a/d;->c:Ljava/lang/String;

    invoke-static {v1}, Lcom/abupdate/http_libs/HttpIotUtils;->postFile(Ljava/lang/String;)Lcom/abupdate/http_libs/request/PostFileRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->f:Ljava/io/File;

    .line 63
    const-string v3, "uploadFile"

    invoke-virtual {v1, v3, v2}, Lcom/abupdate/http_libs/request/PostFileRequest;->addFile(Ljava/lang/String;Ljava/io/File;)Lcom/abupdate/http_libs/request/PostFileRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->a:Ljava/util/Map;

    .line 64
    invoke-virtual {v1, v2}, Lcom/abupdate/http_libs/request/PostFileRequest;->map(Ljava/util/Map;)Lcom/abupdate/http_libs/request/PostFileRequest;

    move-result-object v1

    .line 65
    invoke-virtual {v1, v0}, Lcom/abupdate/http_libs/request/base/AbstractRequest;->setSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lcom/abupdate/http_libs/request/base/Request;

    move-result-object v0

    new-instance v1, Lcom/abupdate/iot_libs/utils/d;

    invoke-direct {v1}, Lcom/abupdate/iot_libs/utils/d;-><init>()V

    .line 66
    invoke-interface {v0, v1}, Lcom/abupdate/http_libs/request/base/Request;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)Lcom/abupdate/http_libs/request/base/Request;

    move-result-object v0

    .line 67
    invoke-interface {v0}, Lcom/abupdate/http_libs/request/base/Request;->exec()Lcom/abupdate/http_libs/response/Response;

    move-result-object v0

    .line 62
    return-object v0
.end method

.method public a(Ljava/util/Map;Ljava/io/File;)Lcom/abupdate/iot_libs/engine/e/a/b;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/File;",
            ")",
            "Lcom/abupdate/iot_libs/engine/e/a/b;"
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->a:Ljava/util/Map;

    .line 41
    iput-object p2, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->f:Ljava/io/File;

    .line 42
    return-object p0
.end method

.method public b()V
    .registers 6

    .line 87
    :try_start_0
    invoke-static {}, Lcom/abupdate/iot_libs/engine/DataManager;->getInstance()Lcom/abupdate/iot_libs/engine/DataManager;

    move-result-object v0

    iget-object v1, p0, Lcom/abupdate/iot_libs/engine/e/a/d;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/abupdate/iot_libs/engine/DataManager;->getEntityByProduct(Ljava/lang/String;)Lcom/abupdate/iot_libs/data/local/OtaEntity;

    move-result-object v0
    :try_end_a
    .catch Lcom/abupdate/iot_libs/engine/security/FotaException; {:try_start_0 .. :try_end_a} :catch_4a

    .line 91
    nop

    .line 92
    invoke-static {}, Lcom/abupdate/iot_libs/utils/j;->a()J

    move-result-wide v1

    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/abupdate/iot_libs/data/local/OtaEntity;->getRegisterInfo()Lcom/abupdate/iot_libs/data/remote/c;

    move-result-object v4

    iget-object v4, v4, Lcom/abupdate/iot_libs/data/remote/c;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/abupdate/iot_libs/data/local/OtaEntity;->getProductInfo()Lcom/abupdate/iot_libs/data/local/ProductInfo;

    move-result-object v4

    iget-object v4, v4, Lcom/abupdate/iot_libs/data/local/ProductInfo;->productId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/abupdate/iot_libs/data/local/OtaEntity;->getRegisterInfo()Lcom/abupdate/iot_libs/data/remote/c;

    move-result-object v0

    iget-object v0, v0, Lcom/abupdate/iot_libs/data/remote/c;->a:Ljava/lang/String;

    invoke-static {v3, v0}, Lcom/abupdate/iot_libs/engine/security/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    iget-object v3, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->a:Ljava/util/Map;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "timestamp"

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v1, p0, Lcom/abupdate/iot_libs/engine/e/a/b;->a:Ljava/util/Map;

    const-string v2, "sign"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    return-void

    .line 88
    :catch_4a
    move-exception v0

    .line 89
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 90
    return-void
.end method

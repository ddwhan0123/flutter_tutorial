class MallMainBean {
  String statusCode;
  List<ResultData> resultData;
  String resultCode;
  String message;

  MallMainBean(
      {this.statusCode, this.resultData, this.resultCode, this.message});

  MallMainBean.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['resultData'] != null) {
      resultData = new List<ResultData>();
      json['resultData'].forEach((v) {
        resultData.add(new ResultData.fromJson(v));
      });
    }
    resultCode = json['resultCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.resultData != null) {
      data['resultData'] = this.resultData.map((v) => v.toJson()).toList();
    }
    data['resultCode'] = this.resultCode;
    data['message'] = this.message;
    return data;
  }
}

class ResultData {
  String type;
  int sortKey;
  dynamic data;
  bool haveLine;

  ResultData({this.type, this.sortKey, this.data, this.haveLine});

  ResultData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sortKey = json['sortKey'];
    if (json['data'] != null) {
      //适配banner和leftNavigation类型
      if (type == 'banner' || type == 'leftNavigation') {
        data = new List<MallBannerBean>();
        json['data'].forEach((v) {
          data.add(new MallBannerBean.fromJson(v));
        });
        //文章类型item
      } else if (type == 'article') {
        data = new List<MallArticleBean>();
        json['data'].forEach((v) {
          data.add(new MallArticleBean.fromJson(v));
        });
      } else if (type == 'summary') {
        data = MallSummaryBean.fromJson(json['data']);
      } else if (type == 'gridGoodsItem') {
        data = new List<MallGoodsItemBean>();
        json['data'].forEach((v) {
          data.add(new MallGoodsItemBean.fromJson(v));
        });
      }
    }
    haveLine = json['haveLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sortKey'] = this.sortKey;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['haveLine'] = this.haveLine;
    return data;
  }
}

//banner和leftNavigation共用
class MallBannerBean {
  String img;
  Goto goto;

  MallBannerBean({this.img, this.goto});

  MallBannerBean.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    goto = json['goto'] != null ? new Goto.fromJson(json['goto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    if (this.goto != null) {
      data['goto'] = this.goto.toJson();
    }
    return data;
  }
}

class Goto {
  String type;
  String link;

  Goto({this.type, this.link});

  Goto.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['link'] = this.link;
    return data;
  }
}

class MallArticleBean {
  String pageCode;
  String title;
  String headImage;
  bool isEmployee;
  String identity;
  String nickname;
  String userTags;
  int userRelation;
  String articleMiniPicUrl;
  int effectiveTime;
  int readCount;
  bool isNioAuthorized;
  String accountId;
  String identityImage;
  int commentCount;
  int likeCount;
  String swcArticleId;
  ImUser imUser;

  MallArticleBean(
      {this.pageCode,
      this.title,
      this.headImage,
      this.isEmployee,
      this.identity,
      this.nickname,
      this.userTags,
      this.userRelation,
      this.articleMiniPicUrl,
      this.effectiveTime,
      this.readCount,
      this.isNioAuthorized,
      this.accountId,
      this.identityImage,
      this.commentCount,
      this.likeCount,
      this.swcArticleId,
      this.imUser});

  MallArticleBean.fromJson(Map<String, dynamic> json) {
    pageCode = json['pageCode'];
    title = json['title'];
    headImage = json['headImage'];
    isEmployee = json['isEmployee'];
    identity = json['identity'];
    nickname = json['nickname'];
    userTags = json['userTags'];
    userRelation = json['userRelation'];
    articleMiniPicUrl = json['articleMiniPicUrl'];
    effectiveTime = json['effectiveTime'];
    readCount = json['readCount'];
    isNioAuthorized = json['isNioAuthorized'];
    accountId = json['accountId'];
    identityImage = json['identityImage'];
    commentCount = json['commentCount'];
    likeCount = json['likeCount'];
    swcArticleId = json['swcArticleId'];
    imUser =
        json['imUser'] != null ? new ImUser.fromJson(json['imUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageCode'] = this.pageCode;
    data['title'] = this.title;
    data['headImage'] = this.headImage;
    data['isEmployee'] = this.isEmployee;
    data['identity'] = this.identity;
    data['nickname'] = this.nickname;
    data['userTags'] = this.userTags;
    data['userRelation'] = this.userRelation;
    data['articleMiniPicUrl'] = this.articleMiniPicUrl;
    data['effectiveTime'] = this.effectiveTime;
    data['readCount'] = this.readCount;
    data['isNioAuthorized'] = this.isNioAuthorized;
    data['accountId'] = this.accountId;
    data['identityImage'] = this.identityImage;
    data['commentCount'] = this.commentCount;
    data['likeCount'] = this.likeCount;
    data['swcArticleId'] = this.swcArticleId;
    if (this.imUser != null) {
      data['imUser'] = this.imUser.toJson();
    }
    return data;
  }
}

//文章的用户头像
class ImUser {
  String imId;
  Null status;
  String nick;
  String headImageUrl;

  ImUser({this.imId, this.status, this.nick, this.headImageUrl});

  ImUser.fromJson(Map<String, dynamic> json) {
    imId = json['imId'];
    status = json['status'];
    nick = json['nick'];
    headImageUrl = json['headImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imId'] = this.imId;
    data['status'] = this.status;
    data['nick'] = this.nick;
    data['headImageUrl'] = this.headImageUrl;
    return data;
  }
}

class MallSummaryBean {
  String text;

  MallSummaryBean({this.text});

  MallSummaryBean.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class MallGoodsItemBean {
  Price price;
  String subTitle;
  String spuCode;
  String img;
  String title;

  MallGoodsItemBean(
      {this.price, this.subTitle, this.spuCode, this.img, this.title});

  MallGoodsItemBean.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    subTitle = json['subTitle'];
    spuCode = json['spu_code'];
    img = json['img'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['subTitle'] = this.subTitle;
    data['spu_code'] = this.spuCode;
    data['img'] = this.img;
    data['title'] = this.title;
    return data;
  }
}

class Price {
  int type;
  String label;
  int originPricePoint;
  int feePricePoint;
  int currentUserPricePoint;

  Price(
      {this.type,
      this.label,
      this.originPricePoint,
      this.feePricePoint,
      this.currentUserPricePoint});

  Price.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    label = json['label'];
    originPricePoint = json['originPricePoint'];
    feePricePoint = json['feePricePoint'];
    currentUserPricePoint = json['currentUserPricePoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['label'] = this.label;
    data['originPricePoint'] = this.originPricePoint;
    data['feePricePoint'] = this.feePricePoint;
    data['currentUserPricePoint'] = this.currentUserPricePoint;
    return data;
  }
}

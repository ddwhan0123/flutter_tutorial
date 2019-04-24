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
  List<dynamic> data;
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

//leftNavigation和banner公用同一种bean
class MallBanner {
  String type;
  int sortKey;
  List<Data> data;
  bool haveLine;

  MallBanner({this.type, this.sortKey, this.data, this.haveLine});

  MallBanner.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sortKey = json['sortKey'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
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

class Data {
  String img;
  Goto goto;

  Data({this.img, this.goto});

  Data.fromJson(Map<String, dynamic> json) {
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
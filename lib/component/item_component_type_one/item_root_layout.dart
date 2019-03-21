import 'package:flutter/material.dart';
import './item_title.dart';
import './item_center.dart';
import './item_foot.dart';
import '../../style/style.dart' as styles;

class ItemRootLayout extends StatefulWidget {
  final int index;
  ItemRootLayout(this.index);
  @override
  State<StatefulWidget> createState() => ItemRootLayoutImp(index);
}

class ItemRootLayoutImp extends State<ItemRootLayout> {
  final int index;
  ItemRootLayoutImp(this.index);

  @override
  Widget build(BuildContext context) => new Container(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              new ItemTitleView(
                  "https://avatars3.githubusercontent.com/u/9019351?s=460&v=4",
                  "王亟亟阿米达",
                  _initImageData(this.index)),
              new ItemCenterView("完美CP|解析蔚来ES6用词感应电机组合",
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2186723599,2334303247&fm=26&gp=0.jpg"),
              new ItemFootView(this._initFootData()),
              new Container(
                decoration: new UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 1.0,
                        color: styles.ComponentStyle.UNDER_LINE_COLOR),
                    insets: EdgeInsets.fromLTRB(0, 10, 0, 10)),
              )
            ],
          )));

  List<Map> _initFootData() {
    List<Map> data = new List();
    Map map1 = new Map();
    map1['resPath'] =
        "assets/images/details_page_reading_quantity_iconxxhdpi.png";
    map1['value'] = "12.8万";
    data.add(map1);
    Map map2 = new Map();
    map2['resPath'] = "assets/images/comment.png";
    map2['value'] = "247";
    data.add(map2);
    return data;
  }

  //构建不同的角色状态
  int _initImageData(int index) {
    if (index % 2 == 0) {
      return 1;
    } else {
      return 0;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/bean/home/main/item_type_three.dart';
import 'package:flutter_sample/component/item_component_type_one/item_center.dart';
import 'package:flutter_sample/component/item_component_type_one/item_foot.dart';
import 'package:flutter_sample/component/item_component_type_one/item_title.dart';
import 'package:flutter_sample/component/item_component_type_three/item_three_root_layout.dart';
import 'package:flutter_sample/component/item_component_type_two/item_two_root_layout.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';

class ItemRootLayout extends BaseStatefullWidget {
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
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: <Widget>[
                  new ItemTitleView(
                      "https://avatars3.githubusercontent.com/u/9019351?s=460&v=4",
                      "王亟亟阿米达 " + index.toString(),
                      _initImageData(this.index)),
                  new ItemCenterView("完美CP|解析蔚来ES6用词感应电机组合",
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2186723599,2334303247&fm=26&gp=0.jpg"),
                  new ItemFootView(this._initFootData()),
                  new DividingLine(),
                ],
              )),
          new ItemRootTypeThree(initTypeThreeData()),
          renderTypeTwo(this.index),
        ],
      ));

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

  Widget renderTypeTwo(int index) {
    List<String> imgList = new List();
    imgList.add(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554207856836&di=a66deaebf77f5759f961dbbbe9ab4e31&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2FNjTP4RrKiIDYyfJ71Ay%3D2hkcQ3xVU4xZ6khTYNv8rhxGy1544879085164.jpg');
    imgList.add(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554207856836&di=a66deaebf77f5759f961dbbbe9ab4e31&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2FNjTP4RrKiIDYyfJ71Ay%3D2hkcQ3xVU4xZ6khTYNv8rhxGy1544879085164.jpg');
    imgList.add(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554207856836&di=a66deaebf77f5759f961dbbbe9ab4e31&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2FNjTP4RrKiIDYyfJ71Ay%3D2hkcQ3xVU4xZ6khTYNv8rhxGy1544879085164.jpg');
    imgList.add(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554207856836&di=a66deaebf77f5759f961dbbbe9ab4e31&imgtype=0&src=http%3A%2F%2Fdingyue.nosdn.127.net%2FNjTP4RrKiIDYyfJ71Ay%3D2hkcQ3xVU4xZ6khTYNv8rhxGy1544879085164.jpg');
    if (index % 3 == 0) {
      return new ItemRootTypeTwo('WS6/ES8最新政策&邀请试驾', imgList);
    } else {
      return new Container();
    }
  }

  HomeTypeThreeBean initTypeThreeData() {

     List<String> imgList = new List();
    imgList.add(
        'https://cdn-app.nio.com/MER/2019/4/4/0f48ee01-4f89-4eea-833d-8137a8218002_M.jpg');
    imgList.add(
        'https://cdn-app.nio.com/MER/2019/4/4/2b9d60ad-4fc6-43e8-94ed-87bba97a726a_M.jpg');
         imgList.add(
        'https://cdn-app.nio.com/MER/2019/4/4/23ae2d47-f9a2-4b0d-9817-1693779b7a93_M.jpg');
    imgList.add(
        'https://cdn-app.nio.com/MER/2019/4/4/d2f27402-22cf-4693-bc5d-ac56f8bfc9a0_M.jpg');
    return new HomeTypeThreeBean(
        momentCreateTime: '04-11',
        momentReadingVolume: '3.3',
        monentCommentCount: '123',
        username: '王鸡鸡',
        momentTitleString: '公众日第一天，咱们作为首批车主Fellow也正式上岗！报名那天就说要减肥，一想到如果我减肥成功',
        userHeaderImg:
            "https://avatars3.githubusercontent.com/u/9019351?s=460&v=4",
        userIdentity: 0,
        tipsString: '#我在车展当Fellow#',photoWall: imgList);
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

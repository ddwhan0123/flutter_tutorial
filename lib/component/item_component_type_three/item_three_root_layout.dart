import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/main/item_type_three.dart';
import 'package:flutter_sample/component/item_component_type_one/item_foot.dart';
import 'package:flutter_sample/component/item_component_type_one/item_title.dart';
import 'package:flutter_sample/component/item_component_type_three/item_three_center.dart';

/*
* 上文字，下4公格
**/
class ItemRootTypeThree extends BaseStatelessWidget {
  final HomeTypeThreeBean homeTypeThreeBean;

  ItemRootTypeThree(this.homeTypeThreeBean);
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          child: Column(
            children: <Widget>[
              renderHeader(),
              new ItemCenterTypeThree(homeTypeThreeBean.momentTitleString,
                  homeTypeThreeBean.tipsString, () {
                showToast('点击话题');
              }, homeTypeThreeBean.photoWall),
              renderFoot()
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
        ),
      ],
    );
  }

  renderHeader() {
    return new ItemTitleView(homeTypeThreeBean.userHeaderImg,
        homeTypeThreeBean.username, homeTypeThreeBean.userIdentity);
  }

  renderCenter() {}

  //底部同类型1的底部
  renderFoot() {
    List<Map> data = new List();
    Map map1 = new Map();
    map1['resPath'] =
        "assets/images/details_page_reading_quantity_iconxxhdpi.png";
    map1['value'] = homeTypeThreeBean.momentReadingVolume + '万';
    data.add(map1);
    Map map2 = new Map();
    map2['resPath'] = "assets/images/comment.png";
    map2['value'] = homeTypeThreeBean.monentCommentCount;
    data.add(map2);
    return new ItemFootView(data);
  }
}

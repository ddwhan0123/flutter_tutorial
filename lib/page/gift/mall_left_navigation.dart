import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/component/item_component_type_two/item_view_pager.dart';

class MallLeftNavigationComponent extends BaseStatelessWidget {
  final List<MallBannerBean> bannerData;
  final bool haveLine;
  MallLeftNavigationComponent({Key key, this.bannerData, this.haveLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return renderViewPager();
  }

  Widget renderViewPager() {
    List<String> list = new List();
    if (null != bannerData && bannerData.length > 0) {
      for (int k = 0; k < bannerData.length; k++) {
        list.add(bannerData[k].img);
      }
      return Container(
        child: ItemViewPagerTypeTwo(list, needBottomText: false,imageWidth:130),
        margin: EdgeInsets.only(
          left: 25,
        ),
      );
    }
    return null;
  }
}

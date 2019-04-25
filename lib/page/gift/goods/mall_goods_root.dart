import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;

class MallGridGoodsComponent extends BaseStatelessWidget {
  final List<MallGoodsItemBean> mallGoods;

  MallGridGoodsComponent(this.mallGoods);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Container(
      child: new GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          crossAxisSpacing: 10.0,
          childAspectRatio: 7 / 9,
          children: new List.generate(mallGoods.length, (index) {
            return renderGridItem(screenInstance, context, index);
          })),
      margin: EdgeInsets.only(left: 25, right: 25),
    );
  }

  Widget renderGridItem(
      ScreenUtil screenInstance, BuildContext context, int index) {
    MallGoodsItemBean bean = mallGoods[index];
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          //左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              child: Image.network(
                bean.img,
              ),
              padding: EdgeInsets.only(bottom: 4),
            ),
            Text(bean.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                    fontSize: screenInstance.setWidth(26))),
            Row(
              children: <Widget>[
                new Image.asset(
                  'assets/images/point_icon.png',
                  height: screenInstance.setWidth(32),
                  width: screenInstance.setWidth(32),
                ),
                Container(
                  child: Text(
                    bean.price.originPricePoint.toString(),
                    style:
                        TextStyle(color: styles.ComponentStyle.FOOT_TEXT_COLOR),
                  ),
                  margin: EdgeInsets.only(left: 5),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        showToast(bean.spuCode);
      },
    );
  }
}

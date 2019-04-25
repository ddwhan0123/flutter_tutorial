import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class MallBigItemComponent extends BaseStatelessWidget {
  final BigItemBean bean;
  final bool haveLine;

  MallBigItemComponent(this.bean, {this.haveLine});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(
            bean.img,
            height: screenInstance.setHeight(300),
            width: ScreenUtil.screenWidthDp,
            fit: BoxFit.fill,
          ),
          Container(
            child: Text(
              bean.title.toString(),
              style: TextStyle(
                  color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                  fontSize: screenInstance.setWidth(28)),
            ),
            margin: EdgeInsets.only(top: 5),
          ),
          Row(
            children: <Widget>[
              Image.asset(
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
                margin: EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
              )
            ],
          ),
          renderLine(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      margin: EdgeInsets.only(
        left: 25,
        right: 25,
      ),
    );
  }

  Widget renderLine() {
    if (null != this.haveLine && this.haveLine == true) {
      return Container(
        child: DividingLine(isCenter: false),
        margin: EdgeInsets.only(top: 30),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(
          bottom: haveLine ? 0 : 30,
        ),
      );
    }
  }
}

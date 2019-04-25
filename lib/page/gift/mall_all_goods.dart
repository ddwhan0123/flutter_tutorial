import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class MallAllGoodsComponent extends BaseStatelessWidget {
  final AllGoodsBean bean;
  final bool haveLine;

  MallAllGoodsComponent(this.bean, {this.haveLine});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: new Alignment(0.0, 1),
            child: GestureDetector(
              onTap: () {
                showToast('点击了全部商品');
              },
              child: Container(
                height: screenInstance.setWidth(60),
                width: screenInstance.setWidth(130),
                child: Center(
                  child: Text(
                    '全部商品',
                    style: TextStyle(
                        fontSize: screenInstance.setSp(26),
                        color: styles.ComponentStyle.APP_MAIN_COLOR),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: styles.ComponentStyle.MALL_FOCUS_BG),
              ),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 30),
    );
  }
}

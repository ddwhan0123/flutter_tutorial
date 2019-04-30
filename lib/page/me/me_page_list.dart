import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/config/application.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

//个人中心列表
class MePageList extends BaseStatefullWidget {
  @override
  State<StatefulWidget> createState() {
    return new MePageListState();
  }
}

class MePageListState extends BaseState<MePageList> {
  var dataList = [
    '我的蔚来值',
    '我的订单',
    '我的账单',
    '我的收藏',
    '我的活动',
    '我的卡包',
    '我的二维码',
    '在线支持',
    '加入蔚来',
    '设置'
  ];

  var imageList = [
    'assets/images/personal_center_nio_value_icon.png',
    'assets/images/personal_center_car_order_icon.png',
    'assets/images/personal_center_car_bill_icon.png',
    'assets/images/personal_center_my_favorite_icon.png',
    'assets/images/my_reservation_icon.png',
    'assets/images/personal_center_my_voucher_icon.png',
    'assets/images/personal_center_my_qrcode_icon.png',
    'assets/images/personal_center_custom_service_icon.png',
    'assets/images/icon_join.png',
    'assets/images/personal_center_setting_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return new ListView.builder(
        shrinkWrap: true, //兼容高度计算问题
        physics: new NeverScrollableScrollPhysics(), //禁用滚动事件
        itemCount: 10,
        itemBuilder: (BuildContext context, int position) {
          return buildItem(context, position, screenInstance);
        });
  }

  onItemClick(index, BuildContext context) {
    showToast("点击了 " + dataList[index]);
    Application.router.navigateTo(context, "/me/setting");
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index, ScreenUtil screenInstance) {
    return new Column(
      children: <Widget>[
        new GestureDetector(
          onTap: () => (onItemClick(index, context)),
          child: new Container(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Image.asset(
                      imageList[index],
                      width: 38,
                      height: 38,
                    ),
                    new Container(
                      child: new Text(dataList[index],
                          style: new TextStyle(
                              color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                              fontSize: screenInstance.setSp(30))),
                      margin: EdgeInsets.only(left: 8),
                    )
                  ],
                ),
                new Image.asset(
                  'assets/images/icon_right_arrow.png',
                  width: 18,
                  height: 18,
                ),
              ],
            ),
            width: ScreenUtil.screenWidth,
            height: screenInstance.setWidth(100),
          ),
        ),
        renderBorder(index)
      ],
    );
  }

  Widget renderBorder(int index) {
    if (index == (dataList.length - 1)) {
      return new Container();
    }
    return new DividingLine();
  }
}

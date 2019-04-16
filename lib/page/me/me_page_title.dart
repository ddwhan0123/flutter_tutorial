import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/utils/screen_util.dart';

class MePageTitle extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return renderCard();
  }

  //头部为卡皮
  Widget renderCard() {
    return new Card(
        elevation: 1.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0))),
        child: new Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          height: 200,
          width: ScreenUtil.screenWidth,
          child: new Column(
            children: <Widget>[
              renderUserHeader(),
              new DividingLine(),
              renderUserInfo(),
            ],
          ),
        ));
  }

  //头像签到
  Widget renderUserHeader() {
    return new Text("data");
  }

  //社交属性
  Widget renderUserInfo() {
    return new Text("头像111");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class MePageTitle extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return renderCard(screenInstance);
  }

  //头部为卡皮
  Widget renderCard(ScreenUtil screenInstance) {
    return new Card(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(top: 20,bottom: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: new Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          height: 170,
          width: ScreenUtil.screenWidth,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              renderUserHeader(screenInstance),
              new DividingLine(),
              renderUserInfo(screenInstance),
            ],
          ),
        ));
  }

  //头像签到
  Widget renderUserHeader(ScreenUtil screenInstance) {
    return new GestureDetector(
      onTap: () => (showToast("点击了 用户头像")),
      child: new Container(
        padding: EdgeInsets.only(
            top: screenInstance.setHeight(30),
            bottom: screenInstance.setHeight(30)),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              'assets/images/icon_me_header.png',
              height: screenInstance.setWidth(100),
              width: screenInstance.setWidth(100),
            ),
            new Container(
              child: new Text("注册/登陆",
                  style: new TextStyle(
                      color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                      fontSize: screenInstance.setSp(34))),
              margin: EdgeInsets.only(left: 16),
            )
          ],
        ),
      ),
    );
  }

  //社交属性
  Widget renderUserInfo(ScreenUtil screenInstance) {
    return Expanded(
        child: new Row(
      children: <Widget>[
        renderInfoItem(0, screenInstance, "发布", "0"),
        renderInfoItem(1, screenInstance, "关注", "2"),
        renderInfoItem(2, screenInstance, "粉丝", "3")
      ],
    ));
  }

  //每一个小子项
  Widget renderInfoItem(
      int type, ScreenUtil screenInstance, String infoTitle, String infoCount) {
    return Expanded(
        flex: 1,
        child: new GestureDetector(
            onTap: () => (showToast("点击了 " + infoTitle)),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    margin: EdgeInsets.only(bottom: 6),
                    child: new Text(infoCount,
                        style: new TextStyle(
                            color: styles.ComponentStyle.APP_MAIN_COLOR,
                            fontSize: screenInstance.setSp(30)))),
                new Text(infoTitle,
                    style: new TextStyle(
                        color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                        fontSize: screenInstance.setSp(30))),
              ],
            )));
  }
}

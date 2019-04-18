import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/me/user_info.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class MePageTitle extends BaseStatelessWidget {
  final bool isLogin;
  final bool isCheck;
  final UserInfo userInfo;
  final Function titleClick; //头部点击
  final Function checkClick; //签到点击
  MePageTitle(this.isLogin, this.isCheck, this.titleClick, this.checkClick,
      this.userInfo);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return renderCard(screenInstance);
  }

  //头部为卡皮
  Widget renderCard(ScreenUtil screenInstance) {
    //登录状态右对齐
    var rightPadding = isLogin ? 0.0 : 15.0;
    return new Card(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: new Container(
          padding: EdgeInsets.only(left: 15, right: rightPadding),
          height: 180,
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
    //是否登陆显示2种不同的 ui
    if (isLogin) {
      return renderLoginUser(screenInstance);
    } else {
      return renderLogoutUser(screenInstance);
    }
  }

  onTitleClick() {
    showToast("点击了 用户头像");
    this.titleClick();
  }

  onCheck() {
    showToast("点击了 签到");
    this.checkClick();
  }

  //登陆的样式
  Widget renderLoginUser(ScreenUtil screenInstance) {
    return new Container(
      padding: EdgeInsets.only(
          top: screenInstance.setHeight(30),
          bottom: screenInstance.setHeight(30)),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
              height: screenInstance.setWidth(120),
              width: screenInstance.setWidth(120),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(userInfo.userHeaderImg)))),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(left: 16),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Text(userInfo.userName,
                                  style: TextStyle(
                                    fontSize: screenInstance.setSp(28),
                                    color:
                                        styles.ComponentStyle.TITLE_TEXT_COLOR,
                                  )),
                              _renderIconImg(screenInstance)
                            ],
                          ),
                          new Text("认证：认证用户",
                              style: TextStyle(
                                fontSize: screenInstance.setSp(24),
                                color: styles.ComponentStyle.FOOT_TEXT_COLOR,
                              ))
                        ],
                      ),
                    ),
                    new GestureDetector(
                        onTap: () => (onCheck()),
                        child: Container(
                          height: screenInstance.setWidth(70),
                          width: screenInstance.setWidth(160),
                          child: Center(
                            child: Text(
                              isCheck
                                  ? '已签到' + userInfo.signNumeber + '天'
                                  : '点击签到',
                              style: TextStyle(
                                  fontSize: screenInstance.setSp(20),
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(isCheck
                                  ? "assets/images/sign_in_bg.9.png"
                                  : "assets/images/sign_out_bg.9.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )) //右侧的签到按钮
                  ],
                ),
                new Container(
                    margin: EdgeInsets.only(left: 14),
                    child: new Row(
                      children: <Widget>[
                        new Image.asset(
                          'assets/images/personal_integrate.png',
                          height: screenInstance.setWidth(54),
                          width: screenInstance.setWidth(54),
                        ),
                        new Text(
                          userInfo.userScore + '积分',
                          style: TextStyle(
                            fontSize: screenInstance.setSp(26),
                            color: styles.ComponentStyle.APP_MAIN_COLOR,
                          ),
                        ),
                        new GestureDetector(
                          child: new Container(
                            child: new Image.asset(
                              'assets/images/personal_go.png',
                              height: screenInstance.setWidth(24),
                              width: screenInstance.setWidth(24),
                            ),
                            margin: EdgeInsets.only(left: 5),
                          ),
                          onTap: () {
                            showToast('查看积分');
                          },
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  //未登陆的样式
  Widget renderLogoutUser(ScreenUtil screenInstance) {
    return new GestureDetector(
      onTap: () => (onTitleClick()),
      child: new Container(
        padding: EdgeInsets.only(
            top: screenInstance.setHeight(30),
            bottom: screenInstance.setHeight(30)),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              'assets/images/icon_me_header.png',
              height: screenInstance.setWidth(120),
              width: screenInstance.setWidth(120),
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

  /*
  渲染右侧Icon
  */
  Widget _renderIconImg(ScreenUtil screenInstance) {
    return new Container(
      margin: EdgeInsets.fromLTRB(screenInstance.setWidth(14), 0, 0, 0),
      width: screenInstance.setWidth(50),
      height: screenInstance.setHeight(24),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/images/user_tips_img.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        border: new Border.all(
          color: Colors.black,
          width: 1.0,
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

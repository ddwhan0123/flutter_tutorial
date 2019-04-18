import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/bean/home/me/user_info.dart';
import 'package:flutter_sample/page/me/me_page_list.dart';
import 'package:flutter_sample/page/me/me_page_title.dart';

class MeComponent extends BaseStatefulPage {
  //构造函数传参
  const MeComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MeComponentState();
  }
}

class MeComponentState extends BasePageState {
  var isLogin = false;
  var isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: new ClampingScrollPhysics(), //禁用回弹
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          new MePageTitle(isLogin, isCheck, () {
            debugPrint('--->头部点击回调');
            setState(() {
              isLogin = !isLogin;
            });
          }, () {
            debugPrint('--->签到点击回调');
            setState(() {
              isCheck = !isCheck;
            });
          }, initUserData()),
          new MePageList()
        ],
      ),
    ));
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }

  UserInfo initUserData() {
    UserInfo userInfo = new UserInfo(
        userName: '王亟鸡阿米达',
        userType: "认证用户",
        userScore: "10086",
        signNumeber: "20",
        userHeaderImg:
            'https://avatars3.githubusercontent.com/u/9019351?s=460&v=4');
    return userInfo;
  }
}

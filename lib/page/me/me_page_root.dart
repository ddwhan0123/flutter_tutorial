import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      physics: new ClampingScrollPhysics(), //禁用回弹
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          new MePageTitle(isLogin, () {
            debugPrint('--->头部点击回调');
            setState(() {
              isLogin = !isLogin;
            });
          }),
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
}

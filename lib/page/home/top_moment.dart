import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MomentComponent extends BaseStatefulPage {
  //构造函数传参
  const MomentComponent({Key key, this.data}) : super(key: key);
  final String data;

  @override
  State<StatefulWidget> createState() {
    return new MomentComponentState();
  }
}

class MomentComponentState extends BasePageState {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('存储'),
            onPressed: save,
          ),
          RaisedButton(
            child: Text('读取'),
            onPressed: _readShared,
          ),
          RaisedButton(
            child: Text('删除'),
            onPressed: _removeShared,
          )
        ],
      ),
    );
  }

  @override
  String trackPageBeginMethod() {
    return null;
  }

  @override
  String trackPageEndMethod() {
    return null;
  }

  /*
   * 存储数据
   */
  Future save() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('account', "10086");
  }

  /*
   * 读取数据
   */
  Future _readShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String account = preferences.get('account');
    if (null != account) {
      showToast(account);
    } else {
      showToast('数据为空');
    }
  }

/*
   * 删除数据
   */
  Future _removeShared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('account');
  }
}

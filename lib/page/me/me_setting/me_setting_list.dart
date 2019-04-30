import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;

class MeSettingPage extends BaseStatefullWidget {
  @override
  State<StatefulWidget> createState() {
    return MeSettingState();
  }
}

class MeSettingState extends BaseState<MeSettingPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: renderTitle(),
      ),
    );
  }

  Widget renderTitle() {
    return Text(
      '设置',
      style: TextStyle(color: styles.ComponentStyle.TITLE_TEXT_COLOR),
    );
  }
}

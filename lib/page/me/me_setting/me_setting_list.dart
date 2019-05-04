import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateful_widget.dart';
import 'package:flutter_sample/component/widget/common/app_bar.dart';
import 'package:flutter_sample/page/me/me_setting/me_setting_item.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../../style/style.dart' as styles;

class MeSettingPage extends BaseStatefullWidget {
  @override
  State<StatefulWidget> createState() {
    return MeSettingState();
  }
}

class MeSettingState extends BaseState<MeSettingPage> {
  List data = ['账号绑定', '错误反馈', '检查更新', '版本'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Scaffold(
        appBar: CommonBar(
          titleString: '设置',
          elevation: 1.0,
        ),
        body: Column(
          children: <Widget>[
            renderList(),
            renderBottom(screenInstance),
          ],
        ));
  }

  //渲染列表
  Widget renderList() {
    return Expanded(
      child: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int position) {
            return MeSettingItem(
              index: position,
              title: data[position],
            );
          }),
    );
  }

  Widget renderBottom(ScreenUtil instance) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '联系我们：',
                  style:
                      TextStyle(color: styles.ComponentStyle.FOOT_TEXT_COLOR),
                ),
                GestureDetector(
                  child: Text(
                    '400-999-6699',
                    style:
                        TextStyle(color: styles.ComponentStyle.APP_MAIN_COLOR),
                  ),
                  onTap: () {
                    showToast('拨打电话');
                  },
                )
              ],
            ),
            margin: EdgeInsets.only(bottom: 14),
          ),
          GestureDetector(
            child: Text(
              '申请注销账号',
              style: TextStyle(color: styles.ComponentStyle.FOOT_TEXT_COLOR),
            ),
            onTap: () {
              showToast("点击 注销账号");
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class ItemTitleTypeTwo extends BaseStatelessWidget {
  final titleText; //标题文字
  final Function onTitleClick;
  ItemTitleTypeTwo(this.titleText, this.onTitleClick, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var _screenInstance = ScreenUtil.getInstance();
    var ges = new GestureDetector(
      onTap: () {
        if (null != onTitleClick) {
          onTitleClick();
        }
      },
      child: new Container(
        margin: EdgeInsets.only(
            top: _screenInstance.setHeight(24),
            bottom: _screenInstance.setHeight(14)),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[renderLeft(_screenInstance), renderRight()],
        ),
      ),
    );
    return ges;
  }

  //左侧标题
  Widget renderLeft(ScreenUtil _screenInstance) {
    var title = new Text(
      this.titleText,
      style: new TextStyle(
          color: styles.ComponentStyle.TITLE_TEXT_COLOR,
          fontSize: _screenInstance.setSp(34)),
    );
    return title;
  }

  Widget renderRight() {
    return Container(
      margin: EdgeInsets.only(right: 25),
      child: new Image.asset(
        'assets/images/icon_right_arrow.png',
        width: 18,
        height: 18,
      ),
    );
  }
}

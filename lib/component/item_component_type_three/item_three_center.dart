import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class ItemCenterTypeThree extends BaseStatelessWidget {
  final String articleTitle; //大标题
  ItemCenterTypeThree(this.articleTitle);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return new Column(
      children: <Widget>[
        renderTitleText(screenInstance),
        renderGrideView(screenInstance)
      ],
    );
  }

  Widget renderTitleText(ScreenUtil screenInstance) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(
          0.0, screenInstance.setHeight(29), 0.0, screenInstance.setHeight(26)),
      child: new Text(
        this.articleTitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: new TextStyle(
            color: styles.ComponentStyle.TITLE_TEXT_COLOR,
            fontSize: screenInstance.setSp(30)),
      ),
    );
  }

  Widget renderGrideView(ScreenUtil screenInstance) {
    return new Container(
      width: ScreenUtil.screenWidthDp,
      height: ScreenUtil.screenWidthDp,
      child: new Text("data"),
    );
  }
}

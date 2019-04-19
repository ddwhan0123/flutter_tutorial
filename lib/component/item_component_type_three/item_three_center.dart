import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

class ItemCenterTypeThree extends BaseStatelessWidget {
  final String articleTitle; //大标题
  final String tipsString;
  final Function onTipsClick;
  final List<String> photoWall;
  ItemCenterTypeThree(
      this.articleTitle, this.tipsString, this.onTipsClick, this.photoWall);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        renderTitleText(screenInstance),
        renderGrideView(screenInstance, context)
      ],
    );
  }

  tipsClick() {
    this.onTipsClick();
  }

  Widget renderTitleText(
    ScreenUtil screenInstance,
  ) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(
              top: screenInstance.setHeight(14),
              bottom: screenInstance.setHeight(4)),
          child: new GestureDetector(
            onTap: () {
              tipsClick();
            },
            child: new Text(this.tipsString,
                style: new TextStyle(
                    color: styles.ComponentStyle.APP_MAIN_COLOR,
                    fontSize: screenInstance.setSp(32))),
          ),
        ),
        new Padding(
          padding:
              EdgeInsets.fromLTRB(0.0, 0.0, 0.0, screenInstance.setHeight(14)),
          child: new Text(
            this.articleTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: new TextStyle(
                color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                fontSize: screenInstance.setSp(32)),
          ),
        )
      ],
    );
  }

  Widget renderGrideView(ScreenUtil screenInstance, BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
            width: ScreenUtil.screenWidthDp,
            height: ScreenUtil.screenWidthDp - 50,
            child: new GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: new List.generate(4, (index) {
                  return renderGridItem(screenInstance, context, index);
                }))),
                new Positioned(//方法二
                  bottom: 15.0,
                  right: 15.0,
                  child: new Text(photoWall.length.toString(),style: new TextStyle(
                    color: Colors.white,
                    fontSize: screenInstance.setSp(50))),
                ),
      ],
    );
  }

  Widget renderGridItem(
      ScreenUtil screenInstance, BuildContext context, int index) {
    return new GestureDetector(
      child: Image.network(photoWall[index]),
      onTap: () {
        showToast('点击了 ' + photoWall[index]);
      },
    );
  }
}

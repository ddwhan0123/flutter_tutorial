import 'package:flutter/material.dart';
import '../../style/style.dart' as styles;
import '../../utils/ScreenUtil.dart';

class ItemTitleView extends StatelessWidget {
  final String userHeaderImg; //头像地址
  final String username; //用户名
  final int userIdentity; //用户类型标示
  ItemTitleView(this.userHeaderImg, this.username, this.userIdentity);

  /*
  *根据构造函数userIdentity的值决定是否渲染Image
  */
  _visibilityLogic(Widget child) {
    if (this.userIdentity == 0) {
       return new IgnorePointer(
        ignoring: true,
        child: new Opacity(
          opacity: 0.0,
          child: child
        )
      );
    } else if (userIdentity == 1) {
      return child;
    } else {
      //todo 其他场景还没设计
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Padding(
        padding: EdgeInsets.only(top: screenInstance.setHeight(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
                width: screenInstance.setWidth(76),
                height: screenInstance.setHeight(72),
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(this.userHeaderImg)))),
            new Padding(
              padding: EdgeInsets.only(left: screenInstance.setWidth(14)),
              child: new Text(
                username,
                textAlign: TextAlign.left,
                style: new TextStyle(
                    color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                    fontSize: screenInstance.setSp(40)),
              ),
            ),
            _visibilityLogic(_renderIconImg(screenInstance))
          ],
        ));
  }

  /*
  渲染右侧Icon
  */
  Widget _renderIconImg(ScreenUtil screenInstance) {
    return new Container(
      margin: EdgeInsets.fromLTRB(screenInstance.setWidth(14), 0, 0, 0),
      width: screenInstance.setWidth(60),
      height: screenInstance.setHeight(30),
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
}
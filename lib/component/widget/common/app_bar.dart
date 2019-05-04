import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import '../../../style/style.dart' as styles;

class CommonBar extends BaseStatelessWidget implements PreferredSizeWidget {
  final String titleString;
  final Function onBackClick;
  final PreferredSizeWidget bottom;
  final double elevation;
  CommonBar({this.titleString, this.onBackClick, this.bottom, this.elevation});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: null != elevation ? elevation : 0.0,
      title: Text(
        this.titleString ?? '',
        style: TextStyle(color: styles.ComponentStyle.TITLE_TEXT_COLOR),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return renderLeft(context);
        },
      ),
    );
  }

  Padding renderLeft(BuildContext context) {
    //包一个Padding控制按钮位置
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        icon: Image.asset(
          'assets/images/left_back_icon.png',
          width: 24,
          height: 24,
        ),
        onPressed: () {
          null != this.onBackClick ? onBackClick() : Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}

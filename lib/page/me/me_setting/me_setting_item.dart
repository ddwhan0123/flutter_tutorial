import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/component/widget/common/dividing_line.dart';
import '../../../style/style.dart' as styles;

class MeSettingItem extends BaseStatelessWidget {
  final int index;
  final String title;
  MeSettingItem({this.index, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      this.title,
                      style: TextStyle(
                          color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                          fontSize: 16),
                    ),
                    renderRight(1)
                  ],
                ),
              ),
            ),
            DividingLine(),
          ],
        ),
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
      ),
      onTap: () {
        showToast('点击item');
      },
    );
  }

  Widget renderRight(int type) {
    if (type == 1) {
      return Container(
        child: new Image.asset(
          'assets/images/icon_right_arrow.png',
          width: 18,
          height: 18,
        ),
      );
    } else {
      return Text('V3.6.0 test');
    }
  }
}

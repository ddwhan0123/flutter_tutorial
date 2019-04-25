import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';
import 'package:flutter_sample/bean/home/mall/mall_main.dart';
import '../../style/style.dart' as styles;

class MallLastTextComponent extends BaseStatelessWidget {
  final LastTextBean bean;

  MallLastTextComponent(this.bean);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: new Alignment(0.0, 1),
            child: Text(
              '- ' + bean.text + ' -',
              style: TextStyle(
                  fontSize: 16, color: styles.ComponentStyle.FOOT_TEXT_COLOR),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 30),
    );
  }
}

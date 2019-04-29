import 'package:flutter/material.dart';
import 'package:flutter_sample/page/page_one.dart';
import 'package:flutter_sample/utils/screen_util.dart';
import '../../style/style.dart' as styles;

import 'package:fluttertoast/fluttertoast.dart';

class ItemFootView extends StatefulWidget {
  final List<Map> data;
  ItemFootView(this.data);
  @override
  State<StatefulWidget> createState() {
    return new ItemFootViewImp(data);
  }
}

class ItemFootViewImp extends State<ItemFootView> {
  final List<Map> data;
  ItemFootViewImp(this.data);

  var isDown = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    var screenInstance = ScreenUtil.getInstance();
    return Padding(
      child: Row(
        children: <Widget>[
          new Text(
            '03-18',
            style: new TextStyle(
                color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                fontSize: screenInstance.setSp(24)),
          ),
          new Expanded(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _renderComment(
                  data[0]['resPath'], data[0]['value'], screenInstance,context),
              _renderComment(
                data[1]['resPath'],
                data[1]['value'],
                screenInstance,context
              )
            ],
          ))
        ],
      ),
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0, screenInstance.setHeight(30), 0.0, screenInstance.setHeight(50)),
    );
  }

  Widget _renderComment(String resPath, String value, ScreenUtil instance,BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          foregroundDecoration: BoxDecoration(
            color: isDown ? Colors.white.withOpacity(0.5) : Colors.transparent,
          ),
          child: Padding(
              child: Row(
                children: <Widget>[
                  Image.asset(resPath),
                  new Text(
                    value,
                    style: new TextStyle(
                        color: styles.ComponentStyle.TITLE_TEXT_COLOR,
                        fontSize: instance.setSp(24)),
                  ),
                ],
              ),
              padding: EdgeInsetsDirectional.fromSTEB(
                  instance.setWidth(20), 0, 0, 0))),
      onTap: () => _showToast(value, context),
      onTapDown: (d) => setState(() => this.isDown = true),
      onTapUp: (d) => setState(() => this.isDown = false),
      onTapCancel: () => setState(() => this.isDown = false),
    );
  }

  _showToast(String value, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => PageOneComponent(
                  message: '你好呀',
                )));
    Fluttertoast.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

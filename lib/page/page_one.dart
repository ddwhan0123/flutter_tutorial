import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/helpers/color_helpers.dart';

class PageOneComponent extends NioBaseStatefulPage {
  PageOneComponent(
      {String message = "Testing",
      Color color = const Color(0xFFFFFFFF),
      String result})
      : this.message = message,
        this.color = color,
        this.result = result;
  final String message;
  final Color color;
  final String result;

  @override
  State<StatefulWidget> createState() {
    return PageOneState(message: message, color: color, result: result);
  }
}

class PageOneState extends NioBasePageState<PageOneComponent> {
  PageOneState(
      {String message = "Testing",
      Color color = const Color(0xFFFFFFFF),
      String result})
      : this.message = message,
        this.color = color,
        this.result = result;
  final String message;
  final Color color;
  final String result;

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: this.color,
      child: new Padding(
        padding: new EdgeInsets.only(top: 15.0),
        child: new ConstrainedBox(
          constraints: new BoxConstraints(minHeight: 42.0),
          child: new FlatButton(
            highlightColor:
                ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(17),
            splashColor:
                ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(34),
            onPressed: () {
              if (result == null) {
                Navigator.pop(context);
              } else {
                Navigator.pop(context, result);
              }
            },
            child: new Text(
              message + " 是传来的",
              style: new TextStyle(
                fontSize: 18.0,
                color: ColorHelpers.blackOrWhiteContrastColor(color),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  String trackPageBeginMethod() {
    return "页面开始方法";
  }

  @override
  String trackPageEndMethod() {
    return "页面结束方法";
  }
}

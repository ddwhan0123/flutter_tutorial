import 'package:flutter/material.dart';
import 'package:flutter_sample/base/page/base_stateful_page.dart';
import 'package:flutter_sample/helpers/color_helpers.dart';

class PageOneComponent extends BaseStatefulPage {
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
    return PageOneState();
  }
}

class PageOneState extends BasePageState<PageOneComponent> {

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: widget.color,
      child: new Padding(
        padding: new EdgeInsets.only(top: 15.0),
        child: new ConstrainedBox(
          constraints: new BoxConstraints(minHeight: 42.0),
          child: new FlatButton(
            highlightColor:
                ColorHelpers.blackOrWhiteContrastColor(widget.color).withAlpha(17),
            splashColor:
                ColorHelpers.blackOrWhiteContrastColor(widget.color).withAlpha(34),
            onPressed: () {
              if (widget.result == null) {
                Navigator.pop(context);
              } else {
                Navigator.pop(context, widget.result);
              }
            },
            child: new Text(
              widget.message + " 是传来的",
              style: new TextStyle(
                fontSize: 18.0,
                color: ColorHelpers.blackOrWhiteContrastColor(widget.color),
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

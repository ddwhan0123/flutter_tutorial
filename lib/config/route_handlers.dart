import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/helpers/color_helpers.dart';
import 'package:flutter_sample/page/demo_simple_component.dart';
import 'package:flutter_sample/page/page_one.dart';
import 'package:flutter_sample/view/home_page.dart';

//根容器
var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomePage();
});

var pageOneHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  String colorHex = params["color_hex"]?.first;
  Color color = new Color(0xFFFFFFFF);
  String result = params["result"]?.first;
  if (colorHex != null && colorHex.length > 0) { 
    color = new Color(ColorHelpers.fromHexString(colorHex));
  }
  return new PageOneComponent( message: message, color: color, result: result);
});

var demoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = new Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = new Color(ColorHelpers.fromHexString(colorHex));
  }
  return new DemoSimpleComponent(
      message: message, color: color, result: result);
});

var demoFunctionHandler = new Handler(
    type: HandlerType.function,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String message = params["message"]?.first;
      showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text(
              "Hey Hey!",
              style: new TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: new Text("$message"),
            actions: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text("OK"),
                ),
              ),
            ],
          );
        },
      );
    });

/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = new Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = new Color(ColorHelpers.fromHexString(colorHex));
  }
  return new DemoSimpleComponent(
      message: "DEEEEEP LINK!!!", color: color, result: result);
});

import 'package:flutter/material.dart';
import './view/home_page.dart';
import 'package:flutter_boost/flutter_boost.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      ///可以在native层通过 getContainerParams 来传递参数
      'homePage': (pageName, params, _) => HomePage(),
    });

    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container());

    return app;
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
    print('---> _onRoutePushed pageName ' + pageName);
  }
}

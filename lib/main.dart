import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './view/home_page.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_sample/config/application.dart';
import 'package:flutter_sample/config/routes.dart';

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
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;

    FlutterBoost.singleton.registerPageBuilders({
      ///可以在native层通过 getContainerParams 来传递参数
      'homePage': (pageName, params, _) => renderHome(pageName, params, _),
    });

    FlutterBoost.handleOnStartPage();
  }

  Widget renderHome(String pageName, Map<dynamic, dynamic> params, String _) {
    print("---> pageName " + pageName);
    return HomePage();
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: Container(),
      onGenerateRoute: Application.router.generator,
    );

    return app;
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
    print('---> _onRoutePushed pageName ' + pageName);
  }
}

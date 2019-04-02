import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';

abstract class NioBaseStatelessPage extends BaseStatelessWidget
    with WidgetsBindingObserver {
  @protected
  String trackPageBeginMethod();

  @protected
  String trackPageEndMethod();


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.suspending:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}

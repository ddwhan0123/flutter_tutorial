import 'package:flutter/material.dart';
import 'package:flutter_sample/base/widget/base_stateless_widget.dart';

abstract class NioBaseStatelessPage extends NioBaseStatelessWidget
    with WidgetsBindingObserver {
  @protected
  String trackPageBeginMethod();

  @protected
  String trackPageEndMethod();


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        print('---> AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        print('---> AppLifecycleState.paused' + trackPageEndMethod());
        break;
      case AppLifecycleState.resumed:
        print('---> NioBaseStatelessPage AppLifecycleState.resumed' + trackPageBeginMethod());
        break;
      case AppLifecycleState.suspending:
        print('--->  AppLifecycleState.suspending');
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}

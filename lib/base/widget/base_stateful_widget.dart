import 'package:flutter/material.dart';
import 'package:flutter_sample/base/base_imp.dart';


abstract class NioBaseStatefullWidget extends StatefulWidget {
  
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }
}

abstract class NioBaseState<T extends StatefulWidget> extends State {
  trackPageBegin({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageBegin(eventID: eventID, data: data);
  }

  trackPageEnd({String eventID, Map data}) {
    BaseMethodImp.instance.trackPageEnd(eventID: eventID, data: data);
  }
}

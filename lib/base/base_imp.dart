
import 'package:flutter_sample/utils/data_service/track_service.dart';

class BaseMethodImp {
  // 工厂模式
  factory BaseMethodImp() => _getInstance();
  static BaseMethodImp get instance => _getInstance();
  static BaseMethodImp _instance;
  BaseMethodImp._internal() {
    // 初始化
  }
  static BaseMethodImp _getInstance() {
    if (_instance == null) {
      _instance = new BaseMethodImp._internal();
    }
    return _instance;
  }

  trackPageBegin({String eventID, Map data}) {
    if (null != eventID && eventID.isNotEmpty) {
      TrackService.trackBeginEvent(eventID: eventID, data: data);
    }
  }

  trackPageEnd({String eventID, Map data}) {
    if (null != eventID && eventID.isNotEmpty) {
      TrackService.trackEndEvent(eventID: eventID, data: data);
    }
  }
}

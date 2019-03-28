class TrackService {
  static trackBeginEvent({String eventID, Map data}) {
    print('---> TrackService trackBeginEvent '+eventID);
  }

  static trackEndEvent({String eventID, Map data}) {
    print('---> TrackService trackEndEvent eventID '+eventID);
  }
}

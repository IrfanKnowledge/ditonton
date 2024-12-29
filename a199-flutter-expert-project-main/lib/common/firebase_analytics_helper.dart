import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  static FirebaseAnalyticsHelper? _instance;

  FirebaseAnalyticsHelper() {
    _instance = this;
  }

  Future<void> initAsync() async {
    await firebaseAnalytics.setAnalyticsCollectionEnabled(true);
  }

  static FirebaseAnalyticsHelper get instance =>
      _instance ?? FirebaseAnalyticsHelper();
}
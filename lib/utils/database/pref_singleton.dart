import 'package:shared_preferences/shared_preferences.dart';

class PrefsSingleton {
  factory PrefsSingleton() {
    return _singleton;
  }

  PrefsSingleton._internal();

  static final PrefsSingleton _singleton = PrefsSingleton._internal();

  static SharedPreferences prefs;
}


class PreferenceNames {
  static const userId = "user_id";
  static const token = "token";
  static const swimmerCount = "swimmer_count";
  static const otp = "otp";
  static const language = "language";
  static const notifications = "notification";
}

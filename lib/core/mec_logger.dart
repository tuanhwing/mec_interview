

import 'package:flutter/foundation.dart';

class MECLogger {
  static String appName = 'MEC';

  static void log(Object object) {
    if (kDebugMode) {
      print('[Logger-$appName] ${object.toString()}');
    }
  }

  static void error(Object object) {}

  static void warning(Object object) {}
}
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

class PlatformInfo {
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static bool get isWeb => kIsWeb;
}

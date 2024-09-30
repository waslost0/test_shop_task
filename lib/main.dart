import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/app.dart';
import 'package:test_shop_task/core/theme/theme.dart';

import 'di/injection.dart';

void main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(ThemeBuilder.systemUiOverlayStyle);

  await configureDependencies();
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

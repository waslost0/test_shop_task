import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/app.dart';
import 'package:test_shop_task/core/theme/theme.dart';
import 'package:test_shop_task/core/utils/state_logger.dart';

import 'di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(ThemeBuilder.systemUiOverlayStyle);
  await configureDependencies();
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: App(),
    ),
  );
}

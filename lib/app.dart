import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/logic/navigation_provider.dart';
import 'package:test_shop_task/core/router/router.dart';
import 'package:test_shop_task/core/theme/theme.dart';

class App extends ConsumerStatefulWidget {
  const App({
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  late final AppModel model = ref.read(appModelProvider);
  late AppNavigator appNavigator = ref.read(navigatorProvider);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => initApp(),
    );
    super.initState();
  }

  Future<void> initApp() async {
    await model.init();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appModelProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: "Shop",
      routerConfig: router,
      key: appNavigator.materialAppKey,
      theme: ThemeBuilder.themeData,
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
    );
  }
}

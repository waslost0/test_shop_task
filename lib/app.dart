import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/logic/navigation_provider.dart';

class App extends ConsumerStatefulWidget {
  const App({
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  bool isInitialized = false;
  late final AppModel model = ref.read(appModelProvider);

  @override
  void initState() {
    initApp();
    super.initState();
  }

  Future<void> initApp() async {
    await model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(appModelProvider);
    return MaterialApp(
      title: "Weather",
      home: model.isInitialized
          ? const Placeholder()
          : const Placeholder(color: Colors.red),
      // theme: AppTheme().buildThemeData(),
      // home: isInitialized ? const BottomNavigation() : const SplashPage(),
      // builder: BotToastInit(),
      // navigatorObservers: [BotToastNavigatorObserver()],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      navigatorKey: ref.read(navigatorProvider).key,
    );
  }
}

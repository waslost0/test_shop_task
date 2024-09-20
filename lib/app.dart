
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/model/config.dart';

class App extends ConsumerStatefulWidget {
  final Config config;

  const App({
    required this.config,
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  bool isInitialized = false;
  late final  model;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  Future<void> initApp() async {
    model = ref.read(appModelProvider);
    await model?.init(widget.config);
    if (mounted) {
      setState(() {
        isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
      home: Placeholder(),
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
      // navigatorKey: ref.read(navigator).key,
    );
  }
}

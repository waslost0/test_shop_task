import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/logic/navigation_provider.dart';
import 'package:test_shop_task/features/auth/presentation/screen/auth_by_phone.dart';

class App extends ConsumerStatefulWidget {
  const App({
    super.key,
  });

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> {
  bool isInitialized = false;
  final _navigatorKey = GlobalKey<NavigatorState>();

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
      key: _navigatorKey,
      title: "Weather",
      home: prepareStartPage(context),
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

  Widget prepareStartPage(context) {
    final model = ref.watch(appModelProvider);
    if (!model.isInitialized) {
      return const Placeholder();
    }
    if (model.isAuthenticated) {
      return const Placeholder();
    }
    return const AuthByPhonePage();
  }
}

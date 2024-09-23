import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/core/logic/app_model.dart';
import 'package:test_shop_task/core/logic/navigation_provider.dart';
import 'package:test_shop_task/core/router/router.dart';
import 'package:test_shop_task/core/theme/theme.dart';
import 'package:test_shop_task/features/auth/presentation/screen/auth_by_phone.dart';
import 'package:test_shop_task/features/navigation/bottom_navigation.dart';

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
    final model = ref.watch(appModelProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp(
      title: "Shop",
      key: appNavigator.materialAppKey,
      navigatorKey: appNavigator.key,
      home: prepareStartPage(context),
      theme: appTheme(context),

      // theme: AppTheme().buildThemeData(),
      // builder: BotToastInit(),
      // navigatorObservers: [BotToastNavigatorObserver()],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,

    );
  }

  Widget prepareStartPage(context) {
    final model = ref.watch(appModelProvider);
    if (!model.isInitialized) {
      return const Material(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (model.isAuthenticated) {
      return const BottomNavigation();
    }
    return const AuthByPhonePage();
  }
}

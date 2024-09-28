import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Talker get talker => Talker();

// @singleton
// InternetConnectionChecker get internetConnectionChecker;
//
// @singleton
// Connectivity get connectivity;
}

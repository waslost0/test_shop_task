import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_shop_task/core/model/config.dart';
import 'package:test_shop_task/core/state/app_model_state.dart';

part 'app_model.g.dart';

// final appModel = ChangeNotifierProvider<AppModel>((ref) => AppModel(ref: ref));

@riverpod
class AppModel extends _$AppModel {
  late final Config config;

  @override
  AppModelState build() => AppModelState(
        config: config,
      );

  Future init(Config c) async {
    config = c;
  }

  Future<void> saveAuth(String accessToken) async {
    // TODO: shared pref
  }

  Future<void> deleteAuth() async {}
}

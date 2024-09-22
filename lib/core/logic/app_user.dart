import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/domain/repositories/user_repository.dart';

final appUserProvider = ChangeNotifierProvider<AppUser>(
  (ref) {
    return AppUser(
      ref,
      getIt<AuthRepository>(),
      getIt<UserRepository>(),
    );
  },
);

class AppUser extends ChangeNotifier {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  final ChangeNotifierProviderRef ref;
  UserEntity? user;

  AppUser(
    this.ref,
    this._authRepository,
    this._userRepository,
  );

  bool isAuthenticated() {
    return getAccessToken()?.isNotEmpty ?? false;
  }

  String? getAccessToken() {
    return _authRepository.getAccessToken();
  }

  Future<UserEntity?> loadUserProfile() async {
    final result = await _userRepository.getUser();
    return result.fold(
      (l) => null,
      (r) {
        user = r;
        return r;
      },
    );
  }

  Future logout() async {
    await _authRepository.deleteAccessToken();
  }
}

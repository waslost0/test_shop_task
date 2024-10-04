import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_shop_task/di/injection.dart';
import 'package:test_shop_task/features/auth/domain/repositories/auth_repository.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';
import 'package:test_shop_task/features/user/domain/repositories/user_repository.dart';

/// Provider for the [AppUser] using [ChangeNotifierProvider].
final appUserProvider = ChangeNotifierProvider<AppUser>(
  (ref) {
    return AppUser(
      getIt<AuthRepository>(),
      getIt<UserRepository>(),
    );
  },
);

/// Class responsible for managing the application user's authentication and profile information.
///
/// This class uses [ChangeNotifier] to provide state updates to listeners.
/// It interacts with [AuthRepository] and [UserRepository] to handle authentication,
/// access tokens, and user profile data.
class AppUser extends ChangeNotifier {
  final AuthRepository _authRepository;

  final UserRepository _userRepository;

  /// The current user's profile information.
  UserEntity? user;

  AppUser(
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

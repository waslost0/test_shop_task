part of "auth_local_data_source.dart";

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _accessTokenKey = "accessToken";
  final LocalStorageService _localStorageService;

  AuthLocalDataSourceImpl(
    this._localStorageService,
  );

  @override
  Future<void> deleteAccessToken() async {
    await _localStorageService.removeValue(key: _accessTokenKey);
  }

  @override
  String? getAccessToken() {
    return _localStorageService.getValue<String>(key: _accessTokenKey);
  }

  @override
  Future<void> saveAccessToken({required String accessToken}) async {
    await _localStorageService.setValue(
      key: _accessTokenKey,
      value: accessToken,
    );
  }
}

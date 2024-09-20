part of "auth_local_data_source.dart";


class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> deleteAuthModel() {
    // TODO: implement deleteAuthModel
    throw UnimplementedError();
  }
  // final LocalStorageService _localStorageService;
  //
  // const AuthLocalDataSourceImpl(this._localStorageService);
  //
  // static const String authModelKey = "authModel";
  //
  // @override
  // Future<void> deleteAuthModel() async {
  //   await _localStorageService.removeValue(key: authModelKey);
  // }
  //
  // @override
  // Future<void> saveAuthModel({required AuthModel authModel}) async {
  //   await _localStorageService.setValue(
  //     key: authModelKey,
  //     value: jsonEncode(authModel),
  //   );
  // }
}

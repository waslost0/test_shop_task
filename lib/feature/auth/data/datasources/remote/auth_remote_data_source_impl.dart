part of "auth_remote_data_source.dart";

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final BaseApi _appHttpService;

  AuthRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<bool> sendConfirmationCode({
    required String phone,
  }) async {
    final response = await _appHttpService.post(
      '',
    );
    return false;
  }

  @override
  Future<AuthResponse> login({
    required String phone,
    required String code,
  }) async {
    final response = await _appHttpService.post(
      '',
      data: {
        "phone": phone,
        "code": code,
      },
    );
    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<void> logout() async {}
}

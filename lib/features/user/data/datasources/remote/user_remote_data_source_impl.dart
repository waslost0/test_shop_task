part of "user_remote_data_source.dart";

@LazySingleton(
  as: UserRemoteDataSource,
)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final PrivateApi _appHttpService;

  UserRemoteDataSourceImpl(
    this._appHttpService,
  );

  @override
  Future<bool> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> profile() async {
    final response = await _appHttpService.get(
      'user/profile',
    );
    return User.fromJson(response.data['user']);
  }

  @override
  Future<ApiResponse> sendConfirmationCode({required String phone}) {
    // TODO: implement sendConfirmationCode
    throw UnimplementedError();
  }
}

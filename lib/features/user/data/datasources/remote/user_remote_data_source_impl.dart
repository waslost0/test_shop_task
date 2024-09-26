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

  @override
  Future<User> changeProfile(UserEntity user) async {
    FormData formData = FormData.fromMap(
      {
        if (user.file != null)
          "image": await MultipartFile.fromFile(
            user.file!.path,
            filename: "image",
          ),
        'name': user.name,
        if (user.lastname != null) 'lastname': user.lastname,
        if (user.phone != null) 'phone': user.phone,
        if (user.dateOfBirth != null) 'dateOfBirth': user.dateOfBirth,
        if (user.login != null) 'login': user.login,
        if (user.email != null) 'email': user.email,
      },
    );
    final response = await _appHttpService.postWithFile(
      'user/change-profile',
      data: formData,
    );
    return User.fromJson(response.data['user']);
  }
}

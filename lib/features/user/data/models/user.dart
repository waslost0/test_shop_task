import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:test_shop_task/core/utils/json_converter.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int userId,
    String? name,
    String? lastname,
    String? phone,
    String? email,
    String? login,
    @DateTimeJsonConverter() DateTime? dateOfBirth,
    @Default([]) List<CustomFile> images,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      id: userId,
      name: name,
      login: login,
      dateOfBirth: dateOfBirth,
      email: email,
      lastname: lastname,
      phone: phone,
      images: images,
    );
  }
}

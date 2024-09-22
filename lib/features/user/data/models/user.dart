import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/features/user/domain/entities/user_entity.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int userId,
    String? name,
    String? lastname,
    String? avatar,
    String? phone,
    String? email,
    int? dateOfBirth,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      id: userId,
      name: name,
      avatar: avatar,
      dateOfBirth: dateOfBirth,
      email: email,
      lastname: lastname,
      phone: phone,
    );
  }
}

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    String? email,
    String? name,
    String? lastname,
    String? avatar,
    String? phone,
    String? login,
    int? dateOfBirth,
    File? file,
  }) = _UserEntity;
}

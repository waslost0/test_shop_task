import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/model/custom_file.dart';
import 'package:universal_io/io.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    String? email,
    String? name,
    String? lastname,
    String? phone,
    String? login,
    DateTime? dateOfBirth,
    File? file,
    @Default([]) List<CustomFile> images,
  }) = _UserEntity;
}


extension UserEntityX on UserEntity {
  String? get avatar => images.last.url;
}

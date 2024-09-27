import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_file.freezed.dart';
part 'custom_file.g.dart';

@freezed
class CustomFile with _$CustomFile {
  factory CustomFile({
    @JsonKey(includeToJson: false, includeFromJson: false) File? file,
    String? url,
    String? blurHash,
    int? fileId,
    int? previewUrl,
    int? mimeType,
  }) = _CustomFile;

  factory CustomFile.fromJson(Map<String, dynamic> json) =>
      _$CustomFileFromJson(json);
}

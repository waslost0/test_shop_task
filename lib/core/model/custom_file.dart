import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'custom_file.freezed.dart';
part 'custom_file.g.dart';

@freezed
class CustomFile with _$CustomFile {
  factory CustomFile({
    @JsonKey(includeToJson: false, includeFromJson: false) File? file,
    String? url,
    String? blurHash,
    int? fileId,
    int? width,
    int? height,
    String? previewUrl,
    String? mimeType,
  }) = _CustomFile;

  factory CustomFile.fromJson(Map<String, dynamic> json) =>
      _$CustomFileFromJson(json);
}

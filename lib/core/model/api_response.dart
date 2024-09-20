import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    @Default(Meta(success: true)) Meta meta,
    @Default(null) dynamic data,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

extension ApiResponseExtension on ApiResponse {
  bool get isError => !meta.success;
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @Default(false) bool success,
    @Default('Unknown error') String error,
    @Default(false) bool invalidAccessToken,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

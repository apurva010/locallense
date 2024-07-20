import 'package:freezed_annotation/freezed_annotation.dart';

part 'invalid_response_model.freezed.dart';
part 'invalid_response_model.g.dart';

@freezed
class InvalidResponseModel with _$InvalidResponseModel {
  const factory InvalidResponseModel({
    @JsonKey(name: 'statusCode') required int code,
    String? message,
  }) = _InvalidResponseModel;

  factory InvalidResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InvalidResponseModelFromJson(json);
}

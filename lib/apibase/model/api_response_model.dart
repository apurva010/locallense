import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@Freezed(genericArgumentFactories: true, fromJson: true)
class APIResponse<T> with _$APIResponse<T> {
  const factory APIResponse({
    @JsonKey(name: 'statusCode') required int code,
    T? data,
    String? message,
  }) = _APIResponse;

  factory APIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    // Haven't Use => Function because having issue with freezed when we use it
    // with generic type. But works with Block Body
    // https://github.com/rrousselGit/freezed/issues/778
    return _$APIResponseFromJson(json, fromJsonT);
  }
}

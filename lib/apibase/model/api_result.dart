import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locallense/apibase/error_manager/network_exception.dart';

part 'api_result.freezed.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
sealed class ApiResult<T> with _$ApiResult<T> {
  const ApiResult._();
  const factory ApiResult.success(T? data, String? message) = Success<T>;
  const factory ApiResult.failure(NetworkExceptions error) = Failure<T>;
}

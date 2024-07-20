// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIResponse<T> _$APIResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _APIResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$APIResponse<T> {
  @JsonKey(name: 'statusCode')
  int get code => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $APIResponseCopyWith<T, APIResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<T, $Res> {
  factory $APIResponseCopyWith(
          APIResponse<T> value, $Res Function(APIResponse<T>) then) =
      _$APIResponseCopyWithImpl<T, $Res, APIResponse<T>>;
  @useResult
  $Res call({@JsonKey(name: 'statusCode') int code, T? data, String? message});
}

/// @nodoc
class _$APIResponseCopyWithImpl<T, $Res, $Val extends APIResponse<T>>
    implements $APIResponseCopyWith<T, $Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$APIResponseImplCopyWith<T, $Res>
    implements $APIResponseCopyWith<T, $Res> {
  factory _$$APIResponseImplCopyWith(_$APIResponseImpl<T> value,
          $Res Function(_$APIResponseImpl<T>) then) =
      __$$APIResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'statusCode') int code, T? data, String? message});
}

/// @nodoc
class __$$APIResponseImplCopyWithImpl<T, $Res>
    extends _$APIResponseCopyWithImpl<T, $Res, _$APIResponseImpl<T>>
    implements _$$APIResponseImplCopyWith<T, $Res> {
  __$$APIResponseImplCopyWithImpl(
      _$APIResponseImpl<T> _value, $Res Function(_$APIResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$APIResponseImpl<T>(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class _$APIResponseImpl<T> implements _APIResponse<T> {
  const _$APIResponseImpl(
      {@JsonKey(name: 'statusCode') required this.code,
      this.data,
      this.message});

  factory _$APIResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$APIResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'statusCode')
  final int code;
  @override
  final T? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'APIResponse<$T>(code: $code, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIResponseImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIResponseImplCopyWith<T, _$APIResponseImpl<T>> get copyWith =>
      __$$APIResponseImplCopyWithImpl<T, _$APIResponseImpl<T>>(
          this, _$identity);
}

abstract class _APIResponse<T> implements APIResponse<T> {
  const factory _APIResponse(
      {@JsonKey(name: 'statusCode') required final int code,
      final T? data,
      final String? message}) = _$APIResponseImpl<T>;

  factory _APIResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$APIResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  int get code;
  @override
  T? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$APIResponseImplCopyWith<T, _$APIResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

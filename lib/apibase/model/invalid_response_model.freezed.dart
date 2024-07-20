// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invalid_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvalidResponseModel _$InvalidResponseModelFromJson(Map<String, dynamic> json) {
  return _InvalidResponseModel.fromJson(json);
}

/// @nodoc
mixin _$InvalidResponseModel {
  @JsonKey(name: 'statusCode')
  int get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvalidResponseModelCopyWith<InvalidResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidResponseModelCopyWith<$Res> {
  factory $InvalidResponseModelCopyWith(InvalidResponseModel value,
          $Res Function(InvalidResponseModel) then) =
      _$InvalidResponseModelCopyWithImpl<$Res, InvalidResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'statusCode') int code, String? message});
}

/// @nodoc
class _$InvalidResponseModelCopyWithImpl<$Res,
        $Val extends InvalidResponseModel>
    implements $InvalidResponseModelCopyWith<$Res> {
  _$InvalidResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidResponseModelImplCopyWith<$Res>
    implements $InvalidResponseModelCopyWith<$Res> {
  factory _$$InvalidResponseModelImplCopyWith(_$InvalidResponseModelImpl value,
          $Res Function(_$InvalidResponseModelImpl) then) =
      __$$InvalidResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'statusCode') int code, String? message});
}

/// @nodoc
class __$$InvalidResponseModelImplCopyWithImpl<$Res>
    extends _$InvalidResponseModelCopyWithImpl<$Res, _$InvalidResponseModelImpl>
    implements _$$InvalidResponseModelImplCopyWith<$Res> {
  __$$InvalidResponseModelImplCopyWithImpl(_$InvalidResponseModelImpl _value,
      $Res Function(_$InvalidResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = freezed,
  }) {
    return _then(_$InvalidResponseModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvalidResponseModelImpl implements _InvalidResponseModel {
  const _$InvalidResponseModelImpl(
      {@JsonKey(name: 'statusCode') required this.code, this.message});

  factory _$InvalidResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvalidResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'statusCode')
  final int code;
  @override
  final String? message;

  @override
  String toString() {
    return 'InvalidResponseModel(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidResponseModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidResponseModelImplCopyWith<_$InvalidResponseModelImpl>
      get copyWith =>
          __$$InvalidResponseModelImplCopyWithImpl<_$InvalidResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvalidResponseModelImplToJson(
      this,
    );
  }
}

abstract class _InvalidResponseModel implements InvalidResponseModel {
  const factory _InvalidResponseModel(
      {@JsonKey(name: 'statusCode') required final int code,
      final String? message}) = _$InvalidResponseModelImpl;

  factory _InvalidResponseModel.fromJson(Map<String, dynamic> json) =
      _$InvalidResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  int get code;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$InvalidResponseModelImplCopyWith<_$InvalidResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

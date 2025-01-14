// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExceptionDataModel _$ExceptionDataModelFromJson(Map<String, dynamic> json) {
  return _ExceptionDataModel.fromJson(json);
}

/// @nodoc
mixin _$ExceptionDataModel {
  String? get code => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;
  List<ExceptionDataMessageModel> get messages =>
      throw _privateConstructorUsedError;

  /// Serializes this ExceptionDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExceptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExceptionDataModelCopyWith<ExceptionDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionDataModelCopyWith<$Res> {
  factory $ExceptionDataModelCopyWith(
          ExceptionDataModel value, $Res Function(ExceptionDataModel) then) =
      _$ExceptionDataModelCopyWithImpl<$Res, ExceptionDataModel>;
  @useResult
  $Res call(
      {String? code,
      String? error,
      String? detail,
      List<ExceptionDataMessageModel> messages});
}

/// @nodoc
class _$ExceptionDataModelCopyWithImpl<$Res, $Val extends ExceptionDataModel>
    implements $ExceptionDataModelCopyWith<$Res> {
  _$ExceptionDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExceptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? error = freezed,
    Object? detail = freezed,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ExceptionDataMessageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExceptionDataModelImplCopyWith<$Res>
    implements $ExceptionDataModelCopyWith<$Res> {
  factory _$$ExceptionDataModelImplCopyWith(_$ExceptionDataModelImpl value,
          $Res Function(_$ExceptionDataModelImpl) then) =
      __$$ExceptionDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? error,
      String? detail,
      List<ExceptionDataMessageModel> messages});
}

/// @nodoc
class __$$ExceptionDataModelImplCopyWithImpl<$Res>
    extends _$ExceptionDataModelCopyWithImpl<$Res, _$ExceptionDataModelImpl>
    implements _$$ExceptionDataModelImplCopyWith<$Res> {
  __$$ExceptionDataModelImplCopyWithImpl(_$ExceptionDataModelImpl _value,
      $Res Function(_$ExceptionDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExceptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? error = freezed,
    Object? detail = freezed,
    Object? messages = null,
  }) {
    return _then(_$ExceptionDataModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ExceptionDataMessageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExceptionDataModelImpl implements _ExceptionDataModel {
  const _$ExceptionDataModelImpl(
      {this.code,
      this.error,
      this.detail,
      final List<ExceptionDataMessageModel> messages = const []})
      : _messages = messages;

  factory _$ExceptionDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExceptionDataModelImplFromJson(json);

  @override
  final String? code;
  @override
  final String? error;
  @override
  final String? detail;
  final List<ExceptionDataMessageModel> _messages;
  @override
  @JsonKey()
  List<ExceptionDataMessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ExceptionDataModel(code: $code, error: $error, detail: $detail, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceptionDataModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, error, detail,
      const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ExceptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionDataModelImplCopyWith<_$ExceptionDataModelImpl> get copyWith =>
      __$$ExceptionDataModelImplCopyWithImpl<_$ExceptionDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExceptionDataModelImplToJson(
      this,
    );
  }
}

abstract class _ExceptionDataModel implements ExceptionDataModel {
  const factory _ExceptionDataModel(
          {final String? code,
          final String? error,
          final String? detail,
          final List<ExceptionDataMessageModel> messages}) =
      _$ExceptionDataModelImpl;

  factory _ExceptionDataModel.fromJson(Map<String, dynamic> json) =
      _$ExceptionDataModelImpl.fromJson;

  @override
  String? get code;
  @override
  String? get error;
  @override
  String? get detail;
  @override
  List<ExceptionDataMessageModel> get messages;

  /// Create a copy of ExceptionDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExceptionDataModelImplCopyWith<_$ExceptionDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExceptionDataMessageModel _$ExceptionDataMessageModelFromJson(
    Map<String, dynamic> json) {
  return _ExceptionDataMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ExceptionDataMessageModel {
  String? get tokenClass => throw _privateConstructorUsedError;
  String? get tokenType => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this ExceptionDataMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExceptionDataMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExceptionDataMessageModelCopyWith<ExceptionDataMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionDataMessageModelCopyWith<$Res> {
  factory $ExceptionDataMessageModelCopyWith(ExceptionDataMessageModel value,
          $Res Function(ExceptionDataMessageModel) then) =
      _$ExceptionDataMessageModelCopyWithImpl<$Res, ExceptionDataMessageModel>;
  @useResult
  $Res call({String? tokenClass, String? tokenType, String? message});
}

/// @nodoc
class _$ExceptionDataMessageModelCopyWithImpl<$Res,
        $Val extends ExceptionDataMessageModel>
    implements $ExceptionDataMessageModelCopyWith<$Res> {
  _$ExceptionDataMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExceptionDataMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenClass = freezed,
    Object? tokenType = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      tokenClass: freezed == tokenClass
          ? _value.tokenClass
          : tokenClass // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExceptionDataMessageModelImplCopyWith<$Res>
    implements $ExceptionDataMessageModelCopyWith<$Res> {
  factory _$$ExceptionDataMessageModelImplCopyWith(
          _$ExceptionDataMessageModelImpl value,
          $Res Function(_$ExceptionDataMessageModelImpl) then) =
      __$$ExceptionDataMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tokenClass, String? tokenType, String? message});
}

/// @nodoc
class __$$ExceptionDataMessageModelImplCopyWithImpl<$Res>
    extends _$ExceptionDataMessageModelCopyWithImpl<$Res,
        _$ExceptionDataMessageModelImpl>
    implements _$$ExceptionDataMessageModelImplCopyWith<$Res> {
  __$$ExceptionDataMessageModelImplCopyWithImpl(
      _$ExceptionDataMessageModelImpl _value,
      $Res Function(_$ExceptionDataMessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExceptionDataMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenClass = freezed,
    Object? tokenType = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ExceptionDataMessageModelImpl(
      tokenClass: freezed == tokenClass
          ? _value.tokenClass
          : tokenClass // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExceptionDataMessageModelImpl implements _ExceptionDataMessageModel {
  const _$ExceptionDataMessageModelImpl(
      {this.tokenClass, this.tokenType, this.message});

  factory _$ExceptionDataMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExceptionDataMessageModelImplFromJson(json);

  @override
  final String? tokenClass;
  @override
  final String? tokenType;
  @override
  final String? message;

  @override
  String toString() {
    return 'ExceptionDataMessageModel(tokenClass: $tokenClass, tokenType: $tokenType, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceptionDataMessageModelImpl &&
            (identical(other.tokenClass, tokenClass) ||
                other.tokenClass == tokenClass) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenClass, tokenType, message);

  /// Create a copy of ExceptionDataMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionDataMessageModelImplCopyWith<_$ExceptionDataMessageModelImpl>
      get copyWith => __$$ExceptionDataMessageModelImplCopyWithImpl<
          _$ExceptionDataMessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExceptionDataMessageModelImplToJson(
      this,
    );
  }
}

abstract class _ExceptionDataMessageModel implements ExceptionDataMessageModel {
  const factory _ExceptionDataMessageModel(
      {final String? tokenClass,
      final String? tokenType,
      final String? message}) = _$ExceptionDataMessageModelImpl;

  factory _ExceptionDataMessageModel.fromJson(Map<String, dynamic> json) =
      _$ExceptionDataMessageModelImpl.fromJson;

  @override
  String? get tokenClass;
  @override
  String? get tokenType;
  @override
  String? get message;

  /// Create a copy of ExceptionDataMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExceptionDataMessageModelImplCopyWith<_$ExceptionDataMessageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

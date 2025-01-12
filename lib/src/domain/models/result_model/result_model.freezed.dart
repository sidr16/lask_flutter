// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultModel<T> _$ResultModelFromJson<T extends Object?>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResultModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResultModel<T extends Object?> {
  int get count => throw _privateConstructorUsedError;
  List<T> get data => throw _privateConstructorUsedError;

  /// Serializes this ResultModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultModelCopyWith<T, ResultModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<T extends Object?, $Res> {
  factory $ResultModelCopyWith(
          ResultModel<T> value, $Res Function(ResultModel<T>) then) =
      _$ResultModelCopyWithImpl<T, $Res, ResultModel<T>>;
  @useResult
  $Res call({int count, List<T> data});
}

/// @nodoc
class _$ResultModelCopyWithImpl<T extends Object?, $Res,
    $Val extends ResultModel<T>> implements $ResultModelCopyWith<T, $Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultModelImplCopyWith<T extends Object?, $Res>
    implements $ResultModelCopyWith<T, $Res> {
  factory _$$ResultModelImplCopyWith(_$ResultModelImpl<T> value,
          $Res Function(_$ResultModelImpl<T>) then) =
      __$$ResultModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int count, List<T> data});
}

/// @nodoc
class __$$ResultModelImplCopyWithImpl<T extends Object?, $Res>
    extends _$ResultModelCopyWithImpl<T, $Res, _$ResultModelImpl<T>>
    implements _$$ResultModelImplCopyWith<T, $Res> {
  __$$ResultModelImplCopyWithImpl(
      _$ResultModelImpl<T> _value, $Res Function(_$ResultModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? data = null,
  }) {
    return _then(_$ResultModelImpl<T>(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResultModelImpl<T extends Object?> implements _ResultModel<T> {
  _$ResultModelImpl({required this.count, required final List<T> data})
      : _data = data;

  factory _$ResultModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResultModelImplFromJson(json, fromJsonT);

  @override
  final int count;
  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ResultModel<$T>(count: $count, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultModelImpl<T> &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultModelImplCopyWith<T, _$ResultModelImpl<T>> get copyWith =>
      __$$ResultModelImplCopyWithImpl<T, _$ResultModelImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResultModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResultModel<T extends Object?> implements ResultModel<T> {
  factory _ResultModel(
      {required final int count,
      required final List<T> data}) = _$ResultModelImpl<T>;

  factory _ResultModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResultModelImpl<T>.fromJson;

  @override
  int get count;
  @override
  List<T> get data;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultModelImplCopyWith<T, _$ResultModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

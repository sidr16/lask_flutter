// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultModelImpl<T> _$$ResultModelImplFromJson<T extends Object?>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResultModelImpl<T>(
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$ResultModelImplToJson<T extends Object?>(
  _$ResultModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map(toJsonT).toList(),
    };

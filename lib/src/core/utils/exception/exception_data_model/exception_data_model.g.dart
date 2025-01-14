// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExceptionDataModelImpl _$$ExceptionDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExceptionDataModelImpl(
      code: json['code'] as String?,
      error: json['error'] as String?,
      detail: json['detail'] as String?,
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) =>
                  ExceptionDataMessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExceptionDataModelImplToJson(
        _$ExceptionDataModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'error': instance.error,
      'detail': instance.detail,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_$ExceptionDataMessageModelImpl _$$ExceptionDataMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExceptionDataMessageModelImpl(
      tokenClass: json['token_class'] as String?,
      tokenType: json['token_type'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ExceptionDataMessageModelImplToJson(
        _$ExceptionDataMessageModelImpl instance) =>
    <String, dynamic>{
      'token_class': instance.tokenClass,
      'token_type': instance.tokenType,
      'message': instance.message,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl,
      'published_at': instance.publishedAt.toIso8601String(),
      'category': instance.category?.toJson(),
    };

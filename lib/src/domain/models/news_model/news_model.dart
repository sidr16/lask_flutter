import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_model/category_model.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    required String title,
    required String imageUrl,
    required DateTime publishedAt,
    CategoryModel? category,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

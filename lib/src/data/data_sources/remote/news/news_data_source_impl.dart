import 'dart:math';

import 'package:faker/faker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/exception/exception_handler.dart';
import '../../../../domain/models/category_model/category_model.dart';
import '../../../../domain/models/news_model/news_model.dart';
import '../../../../domain/models/result_model/result_model.dart';
import 'news_data_source.dart';

@Singleton(as: NewsDataSource)
class NewsDataSourceImpl implements NewsDataSource {
  final _faker = Faker();
  final _totalNewsItems = 100;
  final _categories = [
    'Technology',
    'Health',
    'Sports',
    'Business',
    'Entertainment',
  ];

  @override
  Future<ResultModel<NewsModel>> fetchNews({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500), () {});

      final startIndex = page * pageSize;
      final endIndex = min(startIndex + pageSize, _totalNewsItems);

      if (startIndex >= _totalNewsItems) {
        return ResultModel<NewsModel>(
          data: [],
          count: _totalNewsItems,
        );
      }

      final newsItems = List<NewsModel>.generate(
        endIndex - startIndex,
        (index) {
          final randomCategory = _faker.randomGenerator.element(_categories);

          return NewsModel(
            title: _faker.lorem.sentence(),
            imageUrl: _faker.image.loremPicsum(),
            publishedAt: _faker.date.dateTime(),
            category: CategoryModel(
              name: randomCategory,
              id: _faker.randomGenerator.integer(1000),
            ),
          );
        },
      );

      return ResultModel<NewsModel>(
        data: newsItems,
        count: _totalNewsItems,
      );
    } catch (error, stackTrace) {
      throw ExceptionHandler.handle(
        error,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100), () {});

      final categories = List<CategoryModel>.generate(
        _categories.length,
        (index) => CategoryModel(
          name: _faker.randomGenerator.element(_categories),
          id: _faker.randomGenerator.integer(1000),
        ),
      );

      return categories;
    } catch (error, stackTrace) {
      throw ExceptionHandler.handle(
        error,
        stackTrace: stackTrace,
      );
    }
  }
}

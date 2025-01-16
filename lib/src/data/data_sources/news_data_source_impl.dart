import 'dart:math';

import 'package:faker/faker.dart';

import '../../core/utils/exception/exception_handler.dart';
import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../domain/models/result_model/result_model.dart';
import 'news_data_source.dart';

class NewsDataSourceImpl implements NewsDataSource {
  NewsDataSourceImpl({this.totalNewsItems = 100});

  @override
  final int totalNewsItems;

  @override
  Future<ResultModel<NewsModel>> fetchNews(int page, int pageSize) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500), () {});

      final startIndex = page * pageSize;
      final endIndex = min(startIndex + pageSize, totalNewsItems);

      if (startIndex >= totalNewsItems) {
        return ResultModel<NewsModel>(
          data: [],
          count: totalNewsItems,
        );
      }

      final faker = Faker();
      final newsItems = List<NewsModel>.generate(
        endIndex - startIndex,
        (index) {
          final randomCategory = faker.randomGenerator.element([
            'Technology',
            'Health',
            'Sports',
            'Business',
            'Entertainment',
          ]);

          return NewsModel(
            title: faker.lorem.sentence(),
            imageUrl: faker.image.loremPicsum(),
            publishedAt: faker.date.dateTime(),
            category: CategoryModel(
              name: randomCategory,
              id: faker.randomGenerator.integer(1000),
            ),
          );
        },
      );

      return ResultModel<NewsModel>(
        data: newsItems,
        count: totalNewsItems,
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
      await Future.delayed(const Duration(milliseconds: 300), () {});

      final faker = Faker();
      final categories = List<CategoryModel>.generate(
        5,
        (index) => CategoryModel(
          name: faker.randomGenerator.element([
            'Technology',
            'Health',
            'Sports',
            'Business',
            'Entertainment',
          ]),
          id: faker.randomGenerator.integer(1000),
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

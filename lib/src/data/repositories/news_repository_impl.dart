import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/exception/exception_handler.dart';
import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../domain/models/result_model/result_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../data_sources/remote/news/news_api.dart';

@Singleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._newsApi);

  final NewsApi _newsApi;

  @override
  Future<Either<AppException, ResultModel<NewsModel>>> fetchNews({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  }) {
    return _newsApi.fetchNews(
      page: page,
      pageSize: pageSize,
      params: params,
    );
  }

  @override
  Future<List<CategoryModel>> fetchCategories() {
    return _newsApi.fetchCategories();
  }
}

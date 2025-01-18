import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../domain/models/result_model/result_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../data_sources/remote/news/news_api.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(this._newsApi);

  final NewsApi _newsApi;

  @override
  Future<ResultModel<NewsModel>> fetchNews(int page, int pageSize) {
    return _newsApi.fetchNews(page, pageSize);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() {
    return _newsApi.fetchCategories();
  }
}

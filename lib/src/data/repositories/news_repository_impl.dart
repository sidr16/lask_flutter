import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../domain/models/result_model/result_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../data_sources/news_data_source.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(NewsDataSource dataSource) : super() {
    _dataSource = dataSource;
  }

  late NewsDataSource _dataSource;

  @override
  Future<ResultModel<NewsModel>> fetchNews(int page, int pageSize) {
    return _dataSource.fetchNews(page, pageSize);
  }

  @override
  Future<List<CategoryModel>> fetchCategories() {
    return _dataSource.fetchCategories();
  }
}

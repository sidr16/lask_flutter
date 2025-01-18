import '../models/category_model/category_model.dart';
import '../models/news_model/news_model.dart';
import '../models/result_model/result_model.dart';

abstract class NewsRepository {
  Future<ResultModel<NewsModel>> fetchNews({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  });

  Future<List<CategoryModel>> fetchCategories();
}

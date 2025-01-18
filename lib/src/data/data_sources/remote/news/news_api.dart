import '../../../../domain/models/category_model/category_model.dart';
import '../../../../domain/models/news_model/news_model.dart';
import '../../../../domain/models/result_model/result_model.dart';

abstract class NewsApi {
  Future<ResultModel<NewsModel>> fetchNews({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  });

  Future<List<CategoryModel>> fetchCategories();
}

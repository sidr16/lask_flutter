import '../../domain/models/category_model/category_model.dart';
import '../../domain/models/news_model/news_model.dart';
import '../../domain/models/result_model/result_model.dart';

abstract class NewsDataSource {
  NewsDataSource({this.totalNewsItems = 100});

  final int totalNewsItems;

  Future<ResultModel<NewsModel>> fetchNews(int page, int pageSize);

  Future<List<CategoryModel>> fetchCategories();
}

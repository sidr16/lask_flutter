import 'package:either_dart/either.dart';

import '../../../../core/utils/exception/exception_handler.dart';
import '../../../../domain/models/category_model/category_model.dart';
import '../../../../domain/models/news_model/news_model.dart';
import '../../../../domain/models/result_model/result_model.dart';

abstract class NewsApi {
  Future<Either<AppException, ResultModel<NewsModel>>> fetchNews({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  });

  Future<List<CategoryModel>> fetchCategories();
}

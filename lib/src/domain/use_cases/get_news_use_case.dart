import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../core/utils/exception/exception_handler.dart';
import '../models/news_model/news_model.dart';
import '../models/result_model/result_model.dart';
import '../repositories/news_repository.dart';

@injectable
class GetNewsUseCase {
  const GetNewsUseCase(this._newsRepository);

  final NewsRepository _newsRepository;

  Future<Either<AppException, ResultModel<NewsModel>>> fetch({
    required int page,
    required int pageSize,
    Map<String, dynamic>? params,
  }) =>
      _newsRepository.fetchNews(page: page, pageSize: pageSize);
}

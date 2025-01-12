import '../../../core/pagination/pagination_bloc.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../../domain/repositories/news_repository.dart';

class NewsBloc extends PaginationBloc<NewsModel> {
  NewsBloc(this.repository)
      : super(
          onFetchData: repository.fetchNews,
        );

  final NewsRepository repository;
}

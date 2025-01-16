import '../../../core/bloc/pagination_bloc/pagination_bloc.dart';
import '../../../domain/models/category_model/category_model.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../../domain/repositories/news_repository.dart';

class NewsBloc extends PaginationBloc<NewsModel> {
  NewsBloc(this.repository, {this.category})
      : super(
          onFetchData: repository.fetchNews,
        );

  final NewsRepository repository;
  final CategoryModel? category;
}

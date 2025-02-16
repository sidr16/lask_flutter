import 'package:injectable/injectable.dart';

import '../../../core/bloc/pagination_bloc/pagination_bloc.dart';
import '../../../core/bloc/pagination_bloc/pagination_state.dart';
import '../../../domain/models/category_model/category_model.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../../domain/use_cases/get_news_use_case.dart';

typedef NewsState = PaginationState<NewsModel>;

@injectable
class NewsBloc extends PaginationBloc<NewsModel, CategoryModel> {
  NewsBloc(
    GetNewsUseCase getNews,
  ) : super(
          onFetchData: (page, pageSize, args) {
            return getNews.fetch(
              page: page,
              pageSize: pageSize,
              params: {},
            );
          },
        );
}

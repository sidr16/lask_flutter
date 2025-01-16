import '../../core/locators/service_locator.dart';
import '../../domain/models/category_model/category_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../bloc/categories_bloc/categories_bloc.dart';
import '../bloc/news_bloc/news_bloc.dart';

class PresentationServiceLocator {
  static void register() {
    getIt
      ..registerFactoryParam<NewsBloc, CategoryModel?, dynamic>(
        (category, _) => NewsBloc(
          getIt<NewsRepository>(),
          category: category,
        ),
      )
      ..registerSingleton<CategoriesBloc>(
        CategoriesBloc(getIt<NewsRepository>())..fetch(),
      );
  }
}

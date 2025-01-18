import '../../core/locators/service_locator.dart';
import '../../domain/models/category_model/category_model.dart';
import '../../domain/repositories/news_repository.dart';
import '../../presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../presentation/bloc/news_bloc/news_bloc.dart';

class BlocServiceLocator {
  static void register() {
    getIt
      ..registerFactoryParam<NewsBloc, CategoryModel?, dynamic>(
        (category, _) => NewsBloc(
          getIt<NewsRepository>(),
          category: category,
        ),
      )
      ..registerFactory<CategoriesBloc>(
        () => CategoriesBloc(getIt<NewsRepository>())..fetch(),
      );
  }
}

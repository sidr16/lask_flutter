import '../../core/locators/service_locator.dart';
import '../../domain/repositories/news_repository.dart';
import '../bloc/news_bloc/news_bloc.dart';

class PresentationServiceLocator {
  static void register() {
    getIt.registerLazySingleton<NewsBloc>(
      () => NewsBloc(getIt.get<NewsRepository>())..initialize(),
    );
  }
}

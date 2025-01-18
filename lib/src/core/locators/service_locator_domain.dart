import '../../core/locators/service_locator.dart';
import '../../data/data_sources/remote/news/news_api.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../domain/repositories/news_repository.dart';

class DomainServiceLocator {
  static void register() {
    getIt.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(getIt.get<NewsApi>()),
    );
  }
}

import '../../core/locators/service_locator.dart';
import '../../data/data_sources/news_data_source.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../repositories/news_repository.dart';

class DomainServiceLocator {
  static void register() {
    getIt.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(getIt.get<NewsDataSource>()),
    );
  }
}

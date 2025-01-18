import '../../core/locators/service_locator.dart';
import '../../data/data_sources/remote/news/news_api.dart';
import '../../data/data_sources/remote/news/news_api_impl.dart';

class DataServiceLocator {
  static void register() {
    getIt.registerLazySingleton<NewsApi>(NewsApiImpl.new);
  }
}

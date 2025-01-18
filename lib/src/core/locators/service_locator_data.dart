import '../../core/locators/service_locator.dart';
import '../../data/data_sources/news_data_source.dart';
import '../../data/data_sources/news_data_source_impl.dart';

class DataServiceLocator {
  static void register() {
    getIt.registerLazySingleton<NewsDataSource>(NewsDataSourceImpl.new);
  }
}

import 'package:get_it/get_it.dart';

import '../config/router/app_router.dart';
import '../providers/theme_provider.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void register() {
    getIt
      ..registerSingleton(AppRouter())
      ..registerSingleton(ThemeModeProvider());
  }
}

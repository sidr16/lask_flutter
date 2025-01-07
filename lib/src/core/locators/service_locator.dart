import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/router/app_router.dart';
import '../providers/theme_provider.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> register() async {
    final prefs = await SharedPreferences.getInstance();

    getIt
      ..registerLazySingleton(AppRouter.new)
      ..registerLazySingleton(ThemeModeProvider.new)
      ..registerLazySingleton(() => prefs);
  }
}

extension GetItX on GetIt {
  SharedPreferences get sharedPreferences => get<SharedPreferences>();

  ThemeModeProvider get themeModeProvider => get<ThemeModeProvider>();

  AppRouter get appRouter => get<AppRouter>();
}

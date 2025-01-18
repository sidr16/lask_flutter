import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/router/app_router.dart';
import '../bloc/theme_mode_bloc/theme_mode_bloc.dart';
import 'service_locator_bloc.dart';
import 'service_locator_data.dart';
import 'service_locator_domain.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> registerAsync() async {
    final prefs = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  }

  static void registerSync() {
    _registerGenerals();
    DataServiceLocator.register();
    DomainServiceLocator.register();
    BlocServiceLocator.register();
  }

  static void _registerGenerals() {
    getIt
      ..registerLazySingleton<AppRouter>(AppRouter.new)
      ..registerSingleton<ThemeModeBloc>(
        ThemeModeBloc()..initialize(),
      );
  }
}

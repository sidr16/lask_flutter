import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/locales/app_locales.dart';
import 'src/config/router/app_router.dart';
import 'src/config/theme/app_theme.dart';
import 'src/core/bloc/theme_mode_bloc/theme_mode_bloc.dart';
import 'src/core/bloc/theme_mode_bloc/theme_mode_state.dart';
import 'src/core/localization/codegen_loader.g.dart';
import 'src/core/localization/locale_keys.g.dart';
import 'src/core/locators/service_locator.dart';
import 'src/presentation/bloc/categories_bloc/categories_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await ServiceLocator.registerAsync();

  ServiceLocator.registerSync();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeModeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesBloc>(),
        ),
      ],
      child: EasyLocalization(
        assetLoader: const CodegenLoader(),
        path: AppLocales.pathToLocales,
        startLocale: AppLocales.startLocale,
        supportedLocales: AppLocales.supportedLocales,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (BuildContext context, ThemeModeState state) {
        return MaterialApp.router(
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          title: LocaleKeys.title.tr(),
          routerConfig: getIt.get<AppRouter>().router,
          themeMode: state.themeMode,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/bloc/theme_mode_bloc/theme_mode_bloc.dart';
import 'src/core/bloc/theme_mode_bloc/theme_mode_state.dart';
import 'src/core/config/router/app_router.dart';
import 'src/core/config/theme/app_theme.dart';
import 'src/core/locators/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.registerAsync();
  ServiceLocator.registerSync();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ThemeModeBloc>(),
        ),
      ],
      child: const MyApp(),
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
          title: 'Lask',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: getIt.get<AppRouter>().router,
          themeMode: state.themeMode,
        );
      },
    );
  }
}

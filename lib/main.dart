import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/core/config/router/app_router.dart';
import 'src/core/config/theme/app_theme.dart';
import 'src/core/locators/service_locator.dart';
import 'src/core/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt.get<ThemeModeProvider>(),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Lask',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          routerConfig: getIt.get<AppRouter>().router,
          themeMode: context.watch<ThemeModeProvider>().themeMode,
        );
      },
    );
  }
}

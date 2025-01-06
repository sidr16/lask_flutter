import 'package:flutter/material.dart';

import '../../../core/locators/service_locator.dart';
import '../../../core/providers/theme_provider.dart';
import 'widgets/home_page_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              getIt.get<ThemeModeProvider>().setThemeMode(ThemeMode.light);
            },
            child: const Text('Change theme to light'),
          ),
          FilledButton(
            onPressed: () {
              getIt.get<ThemeModeProvider>().setThemeMode(ThemeMode.dark);
            },
            child: const Text('Change theme to dark'),
          ),
        ],
      ),
    );
  }
}

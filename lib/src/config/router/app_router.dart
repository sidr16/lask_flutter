import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/home_page/home_page.dart';
import 'app_router_endpoints.dart';

class AppRouter {
  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  static AppRouter get instance => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  late final router = GoRouter(
    initialLocation: RouterEndpoints.home.path,
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      GoRoute(
        path: RouterEndpoints.home.path,
        name: RouterEndpoints.home.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}

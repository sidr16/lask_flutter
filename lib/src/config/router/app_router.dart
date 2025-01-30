import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../presentation/pages/explore_page/explore_page.dart';
import '../../presentation/pages/home_page/home_page.dart';
import '../../presentation/pages/navigation_page/navigation_page.dart';
import 'app_router_endpoints.dart';

@lazySingleton
class AppRouter {
  final navigatorKey = GlobalKey<NavigatorState>();

  late final router = GoRouter(
    initialLocation: RouterEndpoints.home.path,
    navigatorKey: navigatorKey,
    routes: routes,
  );

  final routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationPage(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterEndpoints.home.path,
              name: RouterEndpoints.home.name,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterEndpoints.explore.path,
              name: RouterEndpoints.explore.name,
              builder: (context, state) => const ExplorePage(),
            ),
          ],
        ),
      ],
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/assets/svg_icons.dart';
import '../../widgets/navigation/app_navigation_bar.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: AppNavigationBar(
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        currentIndex: navigationShell.currentIndex,
        items: const [
          AppNavigationBarItem(
            name: 'Home',
            icon: SvgIcons.homeAlt,
          ),
          AppNavigationBarItem(
            name: 'Explore',
            icon: SvgIcons.globeAsia,
          ),
          AppNavigationBarItem(
            name: 'Bookmark',
            icon: SvgIcons.bookHeart,
          ),
          AppNavigationBarItem(
            name: 'Profile',
            icon: SvgIcons.user,
          ),
        ],
      ),
    );
  }
}

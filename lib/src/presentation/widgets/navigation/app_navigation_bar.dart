import 'package:flutter/material.dart';

import '../../../core/config/assets/svg_icons.dart';
import '../../../core/config/constants/constants.dart';
import '../wrappers/blur_wrapper.dart';
import 'app_navigation_bar_button.dart';

class AppNavigationBarItem {
  const AppNavigationBarItem({
    required this.name,
    required this.icon,
  });

  final String name;
  final SvgIcon icon;
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.onTap,
    required this.currentIndex,
    this.items = const [],
    super.key,
  });

  final int currentIndex;
  final void Function(int index) onTap;
  final List<AppNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Spaces.large),
        topRight: Radius.circular(Spaces.large),
      ),
      child: BlurWrapper(
        child: BottomNavigationBar(
          onTap: onTap,
          elevation: 0,
          showSelectedLabels: false,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          items: List.generate(
            items.length,
            (index) {
              final item = items[index];

              return BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: AppNavigationBarButton(
                  isActive: index == currentIndex,
                  name: item.name,
                  icon: item.icon,
                ),
                label: item.name,
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/constants/constants.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../widgets/app_bar/secondary_app_bar.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = context.watch<ThemeModeProvider>();

    return SecondaryAppBar(
      leadingWidth: 230,
      toolbarHeight: preferredSize.height,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Paddings.xLarge,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, \nTrung',
              style: context.textStyles.body2Regular,
            ),
            Text(
              'Sun 9 April, 2023',
              style: context.textStyles.heading5,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: themeModeProvider.toggle,
          icon: Icon(
            themeModeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.amber,
          ),
        ),
        Gaps.medium,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(83);
}

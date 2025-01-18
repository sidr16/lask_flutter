import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../core/bloc/theme_mode_bloc/theme_mode_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../widgets/app_bar/secondary_app_bar.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = context.read<ThemeModeBloc>();

    return SecondaryAppBar(
      leadingWidth: 230,
      toolbarHeight: preferredSize.height,
      leading: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.xLarge,
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
            themeModeProvider.state.isDarkMode
                ? Icons.dark_mode
                : Icons.light_mode,
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

import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/constants/constants.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppBar({
    this.title,
    this.leading,
    this.actions = const [],
    this.leadingWidth,
    this.toolbarHeight,
    this.customPreferredSize,
    super.key,
  });

  final String? title;
  final Widget? leading;
  final List<Widget> actions;
  final double? leadingWidth;
  final double? toolbarHeight;
  final Size? customPreferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actions,
      centerTitle: false,
      leadingWidth: leadingWidth,
      toolbarHeight: toolbarHeight,
      titleSpacing: Spaces.xLarge,
      backgroundColor: context.colors.brandBlue10,
      titleTextStyle: context.textStyles.heading3,
      title: title != null ? Text(title!) : null,
    );
  }

  @override
  Size get preferredSize =>
      customPreferredSize ?? const Size.fromHeight(kToolbarHeight);
}

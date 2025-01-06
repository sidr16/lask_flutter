import 'package:flutter/material.dart';

import '../../../core/config/theme/app_theme.dart';

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppBar({
    this.title,
    this.leading,
    this.actions = const [],
    this.leadingWidth,
    this.toolbarHeight,
    super.key,
  });

  final String? title;
  final Widget? leading;
  final List<Widget> actions;
  final double? leadingWidth;
  final double? toolbarHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      leading: leading,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      backgroundColor: context.colors.brandBlue10,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

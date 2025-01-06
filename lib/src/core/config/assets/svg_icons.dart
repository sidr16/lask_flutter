import 'package:flutter/foundation.dart';

@immutable
class SvgIcon {
  const SvgIcon(
    this.path,
  );

  final String path;
}

@immutable
class SvgIcons {
  const SvgIcons._();

  static const _defaultBasePath = 'assets/icons';

  static SvgIcon _buildSvgPath(
    String iconName, [
    String basePath = _defaultBasePath,
  ]) {
    return SvgIcon('$basePath/$iconName.svg');
  }

  static final homeAlt = _buildSvgPath('home_alt');

  static final bookHeart = _buildSvgPath('book_heart');

  static final globeAsia = _buildSvgPath('globe_asia');

  static final user = _buildSvgPath('user');
}

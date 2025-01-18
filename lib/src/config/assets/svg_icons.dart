class SvgIcon {
  const SvgIcon(this.path);

  final String path;
}

class SvgIcons {
  static const _defaultBasePath = 'assets/icons';

  static const homeAlt = SvgIcon('$_defaultBasePath/home_alt.svg');

  static const bookHeart = SvgIcon('$_defaultBasePath/book_heart.svg');

  static const globeAsia = SvgIcon('$_defaultBasePath/globe_asia.svg');

  static const user = SvgIcon('$_defaultBasePath/user.svg');
}

import 'package:gap/gap.dart';

class DefaultSizes {
  static const double small = 8;
  static const double xSmall = 12;
  static const double medium = 16;
  static const double large = 24;
  static const double xLarge = 32;
}

class Spaces {
  static const double small = DefaultSizes.small;
  static const double xSmall = DefaultSizes.xSmall;
  static const double medium = DefaultSizes.medium;
  static const double large = DefaultSizes.large;
  static const double xLarge = DefaultSizes.xLarge;
}

class Radiuses {
  static const small = DefaultSizes.small;
  static const medium = DefaultSizes.medium;
  static const large = DefaultSizes.large;
  static const full = 9999.0;
}

class Gaps {
  static const small = Gap(DefaultSizes.small);
  static const xSmall = Gap(DefaultSizes.xSmall);
  static const medium = Gap(DefaultSizes.medium);
  static const large = Gap(DefaultSizes.large);
  static const xLarge = Gap(DefaultSizes.xLarge);
}

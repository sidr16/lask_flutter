import 'package:easy_localization/easy_localization.dart';

import '../formatters/text_formatter.dart';

extension StringExtension on String {
  String get toSnakeCase => TextFormatters.toSnakeCase(this);

  String etr() => 'errors.$this'.tr();
}

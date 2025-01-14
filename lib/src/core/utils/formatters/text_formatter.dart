class TextFormatters {
  static String toSnakeCase(String text) {
    if (text.isEmpty) return text;

    final regex = RegExp('(?<=[a-z])(?=[A-Z])');
    return text.split(regex).map((word) => word.toLowerCase()).join('_');
  }
}

// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "errors": {
    "connection_timeout": "Connection timeout exceeded",
    "send_timeout": "Send timeout exceeded",
    "receive_timeout": "Receive timeout exceeded",
    "bad_certificate": "Invalid certificate",
    "bad_response": "Invalid response",
    "cancel": "Request was canceled",
    "connection_error": "Connection error",
    "unknown": "Unknown error",
    "type_error": "Type error",
    "state_error": "State error",
    "range_error": "Range error",
    "format_exception": "Format error",
    "no_such_method_error": "No such method error",
    "page_not_found": "Page not found",
    "502": "Error code 520"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}

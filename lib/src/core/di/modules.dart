import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class Modules {
  @preResolve
  Future<SharedPreferences> get getSharedPrefs async =>
      SharedPreferences.getInstance();
}

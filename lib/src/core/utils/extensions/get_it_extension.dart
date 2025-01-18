import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/router/app_router.dart';

extension GetItX on GetIt {
  SharedPreferences get sharedPreferences => get<SharedPreferences>();

  AppRouter get appRouter => get<AppRouter>();
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:lask_flutter/src/config/router/app_router.dart' as _i915;
import 'package:lask_flutter/src/core/bloc/theme_mode_bloc/theme_mode_bloc.dart'
    as _i988;
import 'package:lask_flutter/src/core/di/modules.dart' as _i239;
import 'package:lask_flutter/src/data/data_sources/remote/news/news_data_source.dart'
    as _i457;
import 'package:lask_flutter/src/data/data_sources/remote/news/news_data_source_impl.dart'
    as _i986;
import 'package:lask_flutter/src/data/repositories/news_repository_impl.dart'
    as _i701;
import 'package:lask_flutter/src/domain/repositories/news_repository.dart'
    as _i512;
import 'package:lask_flutter/src/domain/use_cases/get_news_use_case.dart'
    as _i587;
import 'package:lask_flutter/src/presentation/bloc/categories_bloc/categories_bloc.dart'
    as _i775;
import 'package:lask_flutter/src/presentation/bloc/news_bloc/news_bloc.dart'
    as _i454;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => modules.getSharedPrefs,
      preResolve: true,
    );
    gh.factory<_i988.ThemeModeBloc>(() => _i988.ThemeModeBloc());
    gh.lazySingleton<_i915.AppRouter>(() => _i915.AppRouter());
    gh.singleton<_i457.NewsDataSource>(() => _i986.NewsDataSourceImpl());
    gh.singleton<_i512.NewsRepository>(
        () => _i701.NewsRepositoryImpl(gh<_i457.NewsDataSource>()));
    gh.factory<_i587.GetNewsUseCase>(
        () => _i587.GetNewsUseCase(gh<_i512.NewsRepository>()));
    gh.factory<_i775.CategoriesBloc>(
        () => _i775.CategoriesBloc(gh<_i512.NewsRepository>()));
    gh.factory<_i454.NewsBloc>(
        () => _i454.NewsBloc(gh<_i587.GetNewsUseCase>()));
    return this;
  }
}

class _$Modules extends _i239.Modules {}

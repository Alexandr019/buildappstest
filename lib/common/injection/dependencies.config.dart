// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:buildappstest/common/common.dart' as _i877;
import 'package:buildappstest/common/constant/config.dart' as _i460;
import 'package:buildappstest/common/injection/api_module.dart' as _i793;
import 'package:buildappstest/common/injection/third_party_module.dart'
    as _i326;
import 'package:buildappstest/common/network/api/posts_api.dart' as _i629;
import 'package:buildappstest/common/network/interceptor/base_interceptor.dart'
    as _i1046;
import 'package:buildappstest/common/network/interceptor/error_interceptor.dart'
    as _i296;
import 'package:buildappstest/common/network/interceptor/logger_interceptor.dart'
    as _i75;
import 'package:buildappstest/common/repository/posts_repository.dart' as _i516;
import 'package:buildappstest/feature/home/cubit/home_cubit.dart' as _i842;
import 'package:buildappstest/feature/post/cubit/post_cubit.dart' as _i1015;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final apiModule = _$ApiModule();
    gh.factory<_i583.GoRouter>(() => thirdPartyModule.router);
    gh.factory<_i974.Logger>(() => thirdPartyModule.logger);
    gh.factory<_i296.ErrorInterceptor>(() => _i296.ErrorInterceptor());
    gh.singleton<_i460.Config>(() => _i460.Config());
    gh.singleton<_i1046.RequestIdProvider>(() => _i1046.RequestIdProvider());
    gh.factory<_i1046.BaseInterceptor>(
      () => _i1046.BaseInterceptor(
        requestIdProvider: gh<_i1046.RequestIdProvider>(),
        config: gh<_i877.Config>(),
      ),
    );
    gh.factory<_i75.LoggerInterceptor>(
      () => _i75.LoggerInterceptor(logger: gh<_i974.Logger>()),
    );
    gh.factory<_i361.Dio>(
      () => apiModule.dio(
        gh<_i877.Config>(),
        gh<_i877.BaseInterceptor>(),
        gh<_i877.LoggerInterceptor>(),
        gh<_i877.ErrorInterceptor>(),
      ),
    );
    gh.factory<_i629.PostsApi>(
      () => _i629.PostsApi(gh<_i361.Dio>(), gh<_i460.Config>()),
    );
    gh.singleton<_i516.PostsRepository>(
      () => _i516.PostsRepository(gh<_i629.PostsApi>()),
    );
    gh.factory<_i842.HomeCubit>(
      () => _i842.HomeCubit(gh<_i877.PostsRepository>()),
    );
    gh.factory<_i1015.PostCubit>(
      () => _i1015.PostCubit(gh<_i516.PostsRepository>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i326.ThirdPartyModule {}

class _$ApiModule extends _i793.ApiModule {}

// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../common.dart';

@module
abstract class ApiModule {
  Dio dio(
    Config config,
    BaseInterceptor baseInterceptor,
    LoggerInterceptor logInterceptor,
    ErrorInterceptor errorInterceptor,
  ) => NetworkManager.getApiDioClient(
    baseUrl: config.baseUrl,
    interceptors: [baseInterceptor, logInterceptor, errorInterceptor],
  );
}

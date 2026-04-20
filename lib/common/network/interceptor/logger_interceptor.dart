import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LoggerInterceptor extends Interceptor {
  LoggerInterceptor({required this.logger});

  final Logger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d('HTTP=>: [${options.method}] ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final options = response.requestOptions;
    logger.d(
      '<=HTTP: [${options.method}] ${options.uri}'
      ' : ${response.statusCode} : ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    logger.e(
      '<=HTTP ERROR: [${options.method}] ${options.uri}'
      ' : ${err.response?.statusCode ?? err}'
      ' : ${err.response?.data ?? '[NO-DATA]'}',
    );
    super.onError(err, handler);
  }
}

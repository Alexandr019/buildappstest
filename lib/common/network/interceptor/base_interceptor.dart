import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../common.dart';

@injectable
class BaseInterceptor extends Interceptor {
  BaseInterceptor({required this.requestIdProvider, required this.config});

  final RequestIdProvider requestIdProvider;
  final Config config;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response<Object?> response, ResponseInterceptorHandler handler) {
    final data = response.data;
    final contentLength = response.headers.value('content-length');

    if (data is String && data.isEmpty && contentLength == '0') {
      response.data = null;
    }
    super.onResponse(response, handler);
  }
}

@singleton
class RequestIdProvider {
  int _requestCount = 0;

  String get nextUniqueRequestId => 'request:${DateTime.now().millisecondsSinceEpoch}:${_requestCount++}';
}

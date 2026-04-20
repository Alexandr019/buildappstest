import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../common.dart';

@injectable
class ErrorInterceptor extends Interceptor {
  ErrorInterceptor();

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(BaseApiException.parse(err), handler);
  }
}

import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:buildappstest/common/router/app_router.dart';


@module
abstract class ThirdPartyModule {
  GoRouter get router => GoRouter(routes: $appRoutes, initialLocation: '/home');

  Logger get logger => Logger();
}

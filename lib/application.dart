import 'package:flutter/material.dart';

import '../common/common.dart';

class Application extends StatelessWidget {
  const Application(this.routerConfig, {super.key});

  final RouterConfig<Object> routerConfig;

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return _App(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: routerConfig,
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    required this.navigatorKey,
    required this.scaffoldMessengerKey,
    required this.routerConfig,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final RouterConfig<Object> routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      key: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      routerConfig: routerConfig,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: backgroundColor,
          onPrimary: primaryColor,
          secondary: secondaryVariantColor,
          onSecondary: primaryColor,
          error: redColor,
          onError: whiteColor,
          surface: secondaryVariantColor,
          onSurface: primaryColor,
        ),
      ),
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  final String? initialDeeplink;
  MyApp({super.key, this.initialDeeplink});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        deepLinkBuilder: (PlatformDeepLink deepLink) {
          // If we got a saved deep link from 404.html, use it
          if (initialDeeplink != null) {
            // Create a fresh UrlState for the redirect
            final state = UrlState.normalizeQueryParamValue(initialDeeplink!);
            return DeepLink(state);
          }
          return deepLink;
        },
      ),
      theme: AppTheme.light(),
      themeMode: ThemeMode.light,
    );
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_2025/config/routes/app_router.dart';
import 'package:flutter_web_portfolio_2025/res/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig:_appRouter.config(),
      theme: AppTheme.light(),
      themeMode: ThemeMode.light,
      
    );
  }
}

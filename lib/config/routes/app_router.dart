import 'package:auto_route/auto_route.dart';
import 'package:flutter_web_portfolio_2025/screens/auth/login/view/login_screen.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/view/dashboard.dart';
import 'package:flutter_web_portfolio_2025/screens/screen1/screen1.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/screen2.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/screen3.dart';
import 'package:flutter_web_portfolio_2025/screens/screen4/screen4.dart';
import 'package:flutter_web_portfolio_2025/screens/screen5/screen5.dart';
import 'package:flutter_web_portfolio_2025/screens/splash/view/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: LoginRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SplashRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
            page: DashboardRoute.page,
            transitionsBuilder: TransitionsBuilders.noTransition,
            children: [
            
              CustomRoute(
                page: Route2Route.page,
                transitionsBuilder: TransitionsBuilders.noTransition,
              ),
              CustomRoute(
                page: Route3Route.page,
                transitionsBuilder: TransitionsBuilders.noTransition,
              ),
              CustomRoute(
                page: Route4Route.page,
                transitionsBuilder: TransitionsBuilders.noTransition,
              ),
              CustomRoute(
                page: Route5Route.page,
                transitionsBuilder: TransitionsBuilders.noTransition,
              ),
            ]),
      ];
}

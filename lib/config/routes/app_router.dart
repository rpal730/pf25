import 'package:auto_route/auto_route.dart';
import 'package:flutter_web_portfolio_2025/screens/auth/login/view/login_screen.dart';
import 'package:flutter_web_portfolio_2025/screens/dashboard/view/dashboard.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/restaurant_dashboard/view/restaurant_dashboard.dart';
import 'package:flutter_web_portfolio_2025/screens/restaurant_manager/view/restaurant_manager.dart';
import 'package:flutter_web_portfolio_2025/screens/screen1/screen1.dart';
import 'package:flutter_web_portfolio_2025/screens/screen2/view/screen2.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/hangman_game.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/screen3.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/tetris_game.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/tic_tac_toe_game.dart';
import 'package:flutter_web_portfolio_2025/screens/screen3/wordle_game.dart';
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
      page: TicTacToeGameRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: HangmanGameRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: TetrisGameRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: WordleGameRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: RestaurantManagerRoute.page,
      path: '/restaurant-manager',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      path: '/restaurant/:id',
      page: RestaurantDashboardRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: DashboardRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      children: [
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
      ],
    ),
  ];
}

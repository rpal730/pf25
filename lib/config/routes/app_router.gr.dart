// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [HangmanGameScreen]
class HangmanGameRoute extends PageRouteInfo<void> {
  const HangmanGameRoute({List<PageRouteInfo>? children})
    : super(HangmanGameRoute.name, initialChildren: children);

  static const String name = 'HangmanGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HangmanGameScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [RestaurantDashboardScreen]
class RestaurantDashboardRoute
    extends PageRouteInfo<RestaurantDashboardRouteArgs> {
  RestaurantDashboardRoute({required String id, List<PageRouteInfo>? children})
    : super(
        RestaurantDashboardRoute.name,
        args: RestaurantDashboardRouteArgs(id: id),
        rawPathParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'RestaurantDashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RestaurantDashboardRouteArgs>(
        orElse:
            () => RestaurantDashboardRouteArgs(id: pathParams.getString('id')),
      );
      return RestaurantDashboardScreen(id: args.id);
    },
  );
}

class RestaurantDashboardRouteArgs {
  const RestaurantDashboardRouteArgs({required this.id});

  final String id;

  @override
  String toString() {
    return 'RestaurantDashboardRouteArgs{id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RestaurantDashboardRouteArgs) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// generated route for
/// [RestaurantManagerScreen]
class RestaurantManagerRoute extends PageRouteInfo<void> {
  const RestaurantManagerRoute({List<PageRouteInfo>? children})
    : super(RestaurantManagerRoute.name, initialChildren: children);

  static const String name = 'RestaurantManagerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RestaurantManagerScreen();
    },
  );
}

/// generated route for
/// [Screen3Screen]
class Route3Route extends PageRouteInfo<void> {
  const Route3Route({List<PageRouteInfo>? children})
    : super(Route3Route.name, initialChildren: children);

  static const String name = 'Route3Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Screen3Screen();
    },
  );
}

/// generated route for
/// [Screen4Screen]
class Route4Route extends PageRouteInfo<void> {
  const Route4Route({List<PageRouteInfo>? children})
    : super(Route4Route.name, initialChildren: children);

  static const String name = 'Route4Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Screen4Screen();
    },
  );
}

/// generated route for
/// [Screen5Screen]
class Route5Route extends PageRouteInfo<void> {
  const Route5Route({List<PageRouteInfo>? children})
    : super(Route5Route.name, initialChildren: children);

  static const String name = 'Route5Route';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Screen5Screen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TetrisGameScreen]
class TetrisGameRoute extends PageRouteInfo<void> {
  const TetrisGameRoute({List<PageRouteInfo>? children})
    : super(TetrisGameRoute.name, initialChildren: children);

  static const String name = 'TetrisGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TetrisGameScreen();
    },
  );
}

/// generated route for
/// [TicTacToeGameScreen]
class TicTacToeGameRoute extends PageRouteInfo<void> {
  const TicTacToeGameRoute({List<PageRouteInfo>? children})
    : super(TicTacToeGameRoute.name, initialChildren: children);

  static const String name = 'TicTacToeGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TicTacToeGameScreen();
    },
  );
}

/// generated route for
/// [WordleGameScreen]
class WordleGameRoute extends PageRouteInfo<void> {
  const WordleGameRoute({List<PageRouteInfo>? children})
    : super(WordleGameRoute.name, initialChildren: children);

  static const String name = 'WordleGameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WordleGameScreen();
    },
  );
}

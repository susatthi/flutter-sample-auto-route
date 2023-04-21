// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    NavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationPage(),
      );
    },
    SettingsDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SettingsDetailsRouteArgs>(
          orElse: () => SettingsDetailsRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SettingsNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsNavigationPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    DashboardNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardNavigationPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    ErrorRoute.name: (routeData) {
      final args = routeData.argsAs<ErrorRouteArgs>(
          orElse: () => const ErrorRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ErrorPage(
          key: args.key,
          error: args.error,
        ),
      );
    },
    NotFoundRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotFoundPage(),
      );
    },
    MypageNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MypageNavigationPage(),
      );
    },
    MypageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MypagePage(),
      );
    },
  };
}

/// generated route for
/// [NavigationPage]
class NavigationRoute extends PageRouteInfo<void> {
  const NavigationRoute({List<PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsDetailsPage]
class SettingsDetailsRoute extends PageRouteInfo<SettingsDetailsRouteArgs> {
  SettingsDetailsRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsDetailsRoute.name,
          args: SettingsDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SettingsDetailsRoute';

  static const PageInfo<SettingsDetailsRouteArgs> page =
      PageInfo<SettingsDetailsRouteArgs>(name);
}

class SettingsDetailsRouteArgs {
  const SettingsDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SettingsDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [SettingsNavigationPage]
class SettingsNavigationRoute extends PageRouteInfo<void> {
  const SettingsNavigationRoute({List<PageRouteInfo>? children})
      : super(
          SettingsNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardNavigationPage]
class DashboardNavigationRoute extends PageRouteInfo<void> {
  const DashboardNavigationRoute({List<PageRouteInfo>? children})
      : super(
          DashboardNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ErrorPage]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    Object error = '不明なエラーです。',
    List<PageRouteInfo>? children,
  }) : super(
          ErrorRoute.name,
          args: ErrorRouteArgs(
            key: key,
            error: error,
          ),
          initialChildren: children,
        );

  static const String name = 'ErrorRoute';

  static const PageInfo<ErrorRouteArgs> page = PageInfo<ErrorRouteArgs>(name);
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    this.error = '不明なエラーです。',
  });

  final Key? key;

  final Object error;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, error: $error}';
  }
}

/// generated route for
/// [NotFoundPage]
class NotFoundRoute extends PageRouteInfo<void> {
  const NotFoundRoute({List<PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MypageNavigationPage]
class MypageNavigationRoute extends PageRouteInfo<void> {
  const MypageNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MypageNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MypageNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MypagePage]
class MypageRoute extends PageRouteInfo<void> {
  const MypageRoute({List<PageRouteInfo>? children})
      : super(
          MypageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MypageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingsDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SettingsDetailsRouteArgs>(
          orElse: () => SettingsDetailsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsDetailsPage(
          key: args.key,
          id: pathParams.getInt('id'),
        ),
      );
    },
    SettingsViewRouterRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SettingsViewRouterRouteArgs>(
          orElse: () =>
              SettingsViewRouterRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsViewRouterPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    SettingsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SettingsViewRouteArgs>(
          orElse: () => SettingsViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsViewPage(
          key: args.key,
          id: pathParams.getInt('id'),
          memoryText: args.memoryText,
        ),
      );
    },
    SettingsFavoriteRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<SettingsFavoriteRouteArgs>(
          orElse: () =>
              SettingsFavoriteRouteArgs(query: queryParams.optString('query')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsFavoritePage(
          key: args.key,
          query: args.query,
        ),
      );
    },
    SettingsRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsRouterPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    HomeRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    MypageRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MypageRouterPage(),
      );
    },
    MypageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MypagePage(),
      );
    },
    TermOfServiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermOfServicePage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
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
  };
}

/// generated route for
/// [SettingsDetailsPage]
class SettingsDetailsRoute extends PageRouteInfo<SettingsDetailsRouteArgs> {
  SettingsDetailsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsDetailsRoute.name,
          args: SettingsDetailsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsDetailsRoute';

  static const PageInfo<SettingsDetailsRouteArgs> page =
      PageInfo<SettingsDetailsRouteArgs>(name);
}

class SettingsDetailsRouteArgs {
  const SettingsDetailsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsDetailsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingsViewRouterPage]
class SettingsViewRouterRoute
    extends PageRouteInfo<SettingsViewRouterRouteArgs> {
  SettingsViewRouterRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsViewRouterRoute.name,
          args: SettingsViewRouterRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SettingsViewRouterRoute';

  static const PageInfo<SettingsViewRouterRouteArgs> page =
      PageInfo<SettingsViewRouterRouteArgs>(name);
}

class SettingsViewRouterRouteArgs {
  const SettingsViewRouterRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'SettingsViewRouterRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [SettingsViewPage]
class SettingsViewRoute extends PageRouteInfo<SettingsViewRouteArgs> {
  SettingsViewRoute({
    Key? key,
    String? memoryText,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsViewRoute.name,
          args: SettingsViewRouteArgs(
            key: key,
            memoryText: memoryText,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsViewRoute';

  static const PageInfo<SettingsViewRouteArgs> page =
      PageInfo<SettingsViewRouteArgs>(name);
}

class SettingsViewRouteArgs {
  const SettingsViewRouteArgs({
    this.key,
    this.memoryText,
  });

  final Key? key;

  final String? memoryText;

  @override
  String toString() {
    return 'SettingsViewRouteArgs{key: $key, memoryText: $memoryText}';
  }
}

/// generated route for
/// [SettingsFavoritePage]
class SettingsFavoriteRoute extends PageRouteInfo<SettingsFavoriteRouteArgs> {
  SettingsFavoriteRoute({
    Key? key,
    String? query,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsFavoriteRoute.name,
          args: SettingsFavoriteRouteArgs(
            key: key,
            query: query,
          ),
          rawQueryParams: {'query': query},
          initialChildren: children,
        );

  static const String name = 'SettingsFavoriteRoute';

  static const PageInfo<SettingsFavoriteRouteArgs> page =
      PageInfo<SettingsFavoriteRouteArgs>(name);
}

class SettingsFavoriteRouteArgs {
  const SettingsFavoriteRouteArgs({
    this.key,
    this.query,
  });

  final Key? key;

  final String? query;

  @override
  String toString() {
    return 'SettingsFavoriteRouteArgs{key: $key, query: $query}';
  }
}

/// generated route for
/// [SettingsRouterPage]
class SettingsRouterRoute extends PageRouteInfo<void> {
  const SettingsRouterRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRouterRoute';

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
/// [HomeRouterPage]
class HomeRouterRoute extends PageRouteInfo<void> {
  const HomeRouterRoute({List<PageRouteInfo>? children})
      : super(
          HomeRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

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
/// [MypageRouterPage]
class MypageRouterRoute extends PageRouteInfo<void> {
  const MypageRouterRoute({List<PageRouteInfo>? children})
      : super(
          MypageRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'MypageRouterRoute';

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

/// generated route for
/// [TermOfServicePage]
class TermOfServiceRoute extends PageRouteInfo<void> {
  const TermOfServiceRoute({List<PageRouteInfo>? children})
      : super(
          TermOfServiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermOfServiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

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

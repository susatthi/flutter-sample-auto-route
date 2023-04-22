import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../util/logger.dart';
import 'router.dart';

typedef ScreenNameExtractor = String? Function(RouteSettings settings);

String? defaultNameExtractor(RouteSettings settings) {
  return settings.name;
}

typedef RouteFilter = bool Function(Route<dynamic>? route);

bool defaultRouteFilter(Route<dynamic>? route) {
  if (route is! PageRoute) {
    return false;
  }

  // NavigationRouteは画面扱いにしない
  if (route.settings.name == NavigationRoute.name) {
    return false;
  }
  return true;
}

/// FirebaseAnalyticsObserverを参考にしている
class AnalyticsRouterObserver extends AutoRouterObserver {
  AnalyticsRouterObserver({
    this.nameExtractor = defaultNameExtractor,
    this.routeFilter = defaultRouteFilter,
  });

  final ScreenNameExtractor nameExtractor;
  final RouteFilter routeFilter;

  void _sendScreenView(Route<dynamic> route) {
    final screenName = nameExtractor(route.settings);
    if (screenName != null) {
      logger.i('[SEND_SCREEN_VIEW] $screenName');
    }
  }

  Route<dynamic> _convertRouteNameToRoute(String navigationName) {
    switch (navigationName) {
      case HomeNavigationRoute.name:
        return _generateMaterialPageRoute(name: HomeRoute.name);
      case MypageNavigationRoute.name:
        return _generateMaterialPageRoute(name: MypageRoute.name);
    }
    throw AssertionError();
  }

  MaterialPageRoute<dynamic> _generateMaterialPageRoute({
    required String name,
  }) =>
      MaterialPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) => const SizedBox(),
      );

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    super.didChangeTabRoute(route, previousRoute);

    // タブの切替でもアナリティクスに送信する
    _sendScreenView(_convertRouteNameToRoute(route.name));
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (routeFilter(route)) {
      _sendScreenView(route);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null &&
        routeFilter(previousRoute) &&
        routeFilter(route)) {
      _sendScreenView(previousRoute);
    }
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null && routeFilter(newRoute)) {
      _sendScreenView(newRoute);
    }
  }
}

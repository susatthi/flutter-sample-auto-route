import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../util/logger.dart';

class LoggerRouterObserver extends AutoRouterObserver {
  void _v(Object message) {
    logger.v('[ROUTER_OBSERVER] $message');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _v('didInitTabRoute(): ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _v('didChangeTabRoute(): ${route.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _v('didPush(): ${route.name}, prev = ${previousRoute?.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _v('didPop(): ${route.name}, prev = ${previousRoute?.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _v('didRemove(): ${route.name}, prev = ${previousRoute?.name}');
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    _v('didReplace(): ${oldRoute?.name} => ${newRoute?.name}');
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    _v('didStartUserGesture(): ${route.name}, prev = ${previousRoute?.name}');
  }

  @override
  void didStopUserGesture() {
    _v('didStopUserGesture()');
  }
}

extension on Route<dynamic> {
  String? get name => settings.name;
}

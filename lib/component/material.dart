import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  /// includePrefixMatchesを使えるようにした拡張版navigateTo()
  Future<void> navigateToX(
    PageRouteInfo route, {
    bool includePrefixMatches = false,
    OnNavigationFailure? onFailure,
  }) async {
    final path = _buildFullPath(route) ?? '';
    await navigateNamedTo(
      path,
      includePrefixMatches: includePrefixMatches,
      onFailure: onFailure,
    );
  }

  String? _buildFullPath(PageRouteInfo<dynamic> route) {
    final match = router.match(route);
    if (match == null) {
      return null;
    }

    final stringMatches = _collectStringMatches(match);
    final path = stringMatches.map((e) => e == '/' ? '' : e).join('/');
    final parameters = _collectParameters(match);
    final queryParameters = parameters.isNotEmpty
        ? parameters.map((e) => e.rawMap).reduce((value, element) {
            element.addAll(value);
            return element;
          })
        : null;
    final uri = Uri(path: path, queryParameters: queryParameters);
    return uri.toString();
  }

  List<String> _collectStringMatches(
    RouteMatch<dynamic> currentMatch, [
    List<String>? all,
  ]) {
    all ??= [];
    if (currentMatch.stringMatch.isNotEmpty) {
      all.add(currentMatch.stringMatch);
    }
    if (currentMatch.hasChildren) {
      return _collectStringMatches(currentMatch.children!.first, all);
    }
    return all;
  }

  List<Parameters> _collectParameters(
    RouteMatch<dynamic> currentMatch, [
    List<Parameters>? all,
  ]) {
    all ??= [];
    if (currentMatch.queryParams.isNotEmpty) {
      all.add(currentMatch.queryParams);
    }
    if (currentMatch.hasChildren) {
      return _collectParameters(currentMatch.children!.first, all);
    }
    return all;
  }
}

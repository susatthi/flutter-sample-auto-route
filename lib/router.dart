import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/navigation.dart';
import 'feature/cart/page/cart_page.dart';
import 'feature/dashboard/page/dashboard_page.dart';
import 'feature/error/page/not_found_page.dart';
import 'feature/settings/page/settings_details_page.dart';
import 'feature/settings/page/settings_page.dart';

part 'router.gr.dart';

final routerProvider = Provider((ref) {
  return AppRouter();
});

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: NavigationRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: DashboardNavigationRoute.page,
              path: 'dashboard',
              children: [
                AutoRoute(
                  initial: true,
                  page: DashboardRoute.page,
                ),
              ],
            ),
            AutoRoute(
              page: SettingsNavigationRoute.page,
              path: 'settings',
              children: [
                AutoRoute(
                  initial: true,
                  page: SettingsRoute.page,
                ),
                AutoRoute(
                  page: SettingsDetailsRoute.page,
                  path: ':id',
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          page: CartRoute.page,
          path: '/cart',
          fullscreenDialog: true,
        ),
        AutoRoute(
          page: NotFoundRoute.page,
          path: '*',
        ),
      ];
}

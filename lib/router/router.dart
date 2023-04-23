import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/error/page/error_page.dart';
import '../feature/error/page/not_found_page.dart';
import '../feature/home/page/home_page.dart';
import '../feature/loading/page/loading_page.dart';
import '../feature/root/page/root_page.dart';
import '../feature/settings/page/settings_details_page.dart';
import '../feature/settings/page/settings_page.dart';
import '../feature/settings/page/settings_view_page.dart';
import '../feature/user/page/mypage_page.dart';
import '../feature/user/page/sign_in_page.dart';
import '../feature/user/page/term_of_service_page.dart';
import '../feature/user/state/user.dart';
import '../util/logger.dart';
import 'route_type.dart';

part 'router.gr.dart';

final routerProvider = Provider((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(this.ref);

  final Ref ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/sign-in',
          page: SignInRoute.page,
          type: const NoAnimationRouteType(),
        ),
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          type: const NoAnimationRouteType(),
          children: [
            // ネストルーティングするためにAppRouterを挟む
            AutoRoute(
              initial: true,
              page: HomeRouterRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: HomeRoute.page,
                ),
                AutoRoute(
                  path: 'settings',
                  page: SettingsRouterRoute.page,
                  children: [
                    AutoRoute(
                      initial: true,
                      page: SettingsRoute.page,
                    ),
                    AutoRoute(
                      path: ':id',
                      page: SettingsViewRouterRoute.page,
                      children: [
                        AutoRoute(
                          initial: true,
                          page: SettingsViewRoute.page,
                        ),
                        AutoRoute(
                          path: 'details',
                          page: SettingsDetailsRoute.page,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            AutoRoute(
              path: 'mypage',
              page: MypageRouterRoute.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: MypageRoute.page,
                ),
                AutoRoute(
                  path: 'term-of-service',
                  page: TermOfServiceRoute.page,
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: '*',
          page: NotFoundRoute.page,
          type: const NoAnimationRouteType(),
        ),
      ];

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final routeName = resolver.route.name;
    logger.i('CALLED onNavigation(): $routeName');

    // ユーザーの状態に応じて処理をわける
    // App()でユーザー状態が確定するまで待っているので、このタイミングでは確定している
    final signedIn = ref.read(signedInProvider).requireValue;
    if (!signedIn) {
      // 未サインイン

      if ([
        SignInRoute.name,
        LoadingRoute.name,
        ErrorRoute.name,
      ].contains(routeName)) {
        logger.i('$routeName は未サインインでも表示する');
        return resolver.next();
      }

      logger.i('未サインインなのでサインイン画面にリダイレクト');
      router.replace(const SignInRoute());
    } else {
      // サインイン済み

      if ([
        SignInRoute.name,
      ].contains(routeName)) {
        logger.i('サインイン済みなのに $routeName を開こうとした場合トップ画面にリダイレクト');
        router.push(const RootRoute());
        return;
      }

      logger.i('サインイン済みなので $routeName を表示する');
      resolver.next();
    }
  }
}

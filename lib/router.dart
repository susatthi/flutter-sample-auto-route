import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/navigation.dart';
import 'feature/error/page/error_page.dart';
import 'feature/error/page/not_found_page.dart';
import 'feature/home/page/home_page.dart';
import 'feature/loading/page/loading_page.dart';
import 'feature/settings/page/settings_details_page.dart';
import 'feature/settings/page/settings_page.dart';
import 'feature/user/page/mypage_page.dart';
import 'feature/user/page/sign_in_page.dart';
import 'feature/user/page/term_of_service_page.dart';
import 'feature/user/state/user.dart';
import 'util/logger.dart';

part 'router.gr.dart';

final routerProvider = Provider((ref) {
  return AppRouter(ref);
});

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(this.ref);

  final Ref ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign-in',
        ),
        AutoRoute(
          page: NavigationRoute.page,
          path: '/',
          children: [
            // ネストルーティングするためにAppRouterを挟む
            AutoRoute(
              initial: true,
              page: HomeNavigationRoute.page,
              path: 'home',
              children: [
                AutoRoute(
                  initial: true,
                  page: HomeRoute.page,
                ),
                AutoRoute(
                  page: SettingsRoute.page,
                  path: 'settings',
                ),
                AutoRoute(
                  page: SettingsDetailsRoute.page,
                  path: 'settings/:id',
                ),
              ],
            ),
            AutoRoute(
              page: MypageNavigationRoute.page,
              path: 'mypage',
              children: [
                AutoRoute(
                  initial: true,
                  page: MypageRoute.page,
                ),
                AutoRoute(
                  page: TermOfServiceRoute.page,
                  path: 'term-of-service',
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          page: LoadingRoute.page,
          path: '/loading',
        ),
        AutoRoute(
          page: ErrorRoute.page,
          path: '/error',
        ),
        AutoRoute(
          page: NotFoundRoute.page,
          path: '*',
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
      // サインイン済み

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
      // 未サインイン

      if ([
        SignInRoute.name,
      ].contains(routeName)) {
        logger.i('サインイン済みなのに $routeName を開こうとした場合トップ画面にリダイレクト');
        router.push(const NavigationRoute());
        return;
      }

      logger.i('サインイン済みなので $routeName を表示する');
      resolver.next();
    }
  }
}

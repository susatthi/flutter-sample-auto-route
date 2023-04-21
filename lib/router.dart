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
    final signedInAsyncValue =
        ref.watch(userProvider).whenData((user) => user != null);

    signedInAsyncValue.when<void>(
      data: (signedIn) {
        // 無条件で表示する画面
        if ([
          SignInRoute.name,
          LoadingRoute.name,
          ErrorRoute.name,
        ].contains(routeName)) {
          logger.i('$routeName は無条件で表示する');
          return resolver.next();
        }

        if (!signedIn) {
          logger.i('未サインインなのでサインイン画面にリダイレクト');
          router.replaceAll([const SignInRoute()]);
        } else if (routeName == SignInRoute.name) {
          logger.i('サインイン済みなのにサインイン画面を開こうとした場合トップ画面にリダイレクト');
          router.pushAll([const NavigationRoute()]);
          return;
        } else {
          logger.i('サインイン済みなので $routeName を表示する');
          resolver.next();
        }
      },
      error: (e, s) {
        logger.i('エラーが発生したのでエラー画面にリダイレクト');
        router.replaceAll([ErrorRoute(error: e)]);
      },
      loading: () {
        if (LoadingRoute.name == routeName) {
          logger.i('$routeName は無条件で表示する');
          return resolver.next();
        }

        logger.i('ユーザーの状態が未確定なので確定するまで待つ');
        router.replaceAll([const LoadingRoute()]);
      },
    );
  }
}

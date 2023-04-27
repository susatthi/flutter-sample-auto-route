import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/dialog.dart';
import 'component/loading.dart';
import 'component/scaffold_messenger.dart';
import 'component/widget_ref.dart';
import 'feature/error/page/error_page.dart';
import 'feature/loading/page/loading_page.dart';
import 'feature/user/service/user_service.dart';
import 'feature/user/state/user.dart';
import 'router/logger_router_observer.dart';
import 'router/router.dart';
import 'util/logger.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue(
      signInStateProvider,
      completeMessage: 'サインインしました。',
      onComplete: (_) {
        ref.read(routerProvider).replace(const RootRoute());
      },
    );

    ref.handleAsyncValue(
      signOutStateProvider,
      completeMessage: 'サインアウトしました。',
      onComplete: (_) {
        ref.read(routerProvider).replace(const RootRoute());
      },
    );

    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(
        // ディープリンクでページスタックを積むようにする
        includePrefixMatches: true,
        // オブザーバーを登録
        navigatorObservers: () => [
          LoggerRouterObserver(),
        ],
      ),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      builder: (context, child) {
        final value = ref.watch(signedInProvider);
        return value.when(
          data: (signedIn) {
            final isLoading = ref.watch(overlayLoadingProvider);
            logger.i(
              'MaterialApp.builder():'
              ' signedIn = $signedIn,'
              ' isLoading = $isLoading',
            );
            return Navigator(
              key: ref.watch(navigatorKeyProvider),
              onPopPage: (route, dynamic _) => false,
              pages: [
                MaterialPage<Widget>(
                  child: Stack(
                    children: [
                      child!,
                      if (isLoading) const OverlayLoading(),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (e, s) {
            logger.i('エラーが発生したのでエラー表示');
            return ErrorPage(error: e);
          },
          loading: () {
            logger.i('ユーザー状態が確定するまでローディング表示');
            return const LoadingPage();
          },
        );
      },
    );
  }
}

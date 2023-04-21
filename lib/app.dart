import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/dialogs.dart';
import 'component/loading.dart';
import 'component/scaffold_messenger.dart';
import 'component/widget_ref.dart';
import 'feature/user/service/user_service.dart';
import 'router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue(
      signInStateProvider,
      completeMessage: 'サインインしました。',
    );

    ref.handleAsyncValue(
      signOutStateProvider,
      completeMessage: 'サインアウトしました。',
    );

    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(
        // 画面リロードしたときにページスタックを積むようにする
        includePrefixMatches: true,
      ),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(overlayLoadingProvider);
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
      ),
    );
  }
}

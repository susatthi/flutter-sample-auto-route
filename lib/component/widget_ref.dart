import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dialog.dart';
import 'loading.dart';
import 'scaffold_messenger.dart';

extension WidgetRefEx on WidgetRef {
  /// AsyncValueを良い感じに処理する
  void handleAsyncValue<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    void Function(T data)? onComplete,
    bool loading = true,
    String? completeMessage,
  }) {
    /// ローディングを表示する
    void showLoading() {
      if (loading) {
        read(overlayLoadingProvider.notifier).update((_) => true);
      }
    }

    /// ローディングを非表示にする
    void hideLoading() {
      read(overlayLoadingProvider.notifier).update((_) => false);
    }

    /// 完了メッセージを表示する
    void showCompleteMessage() {
      if (completeMessage == null) {
        return;
      }

      // SnackBarを表示する
      final messengerState = read(scaffoldMessengerKeyProvider).currentState;
      messengerState?.showSnackBar(
        SnackBar(
          content: Text(completeMessage),
        ),
      );
    }

    /// エラーダイアログを表示する
    Future<void> showErrorDialog(Object e, StackTrace s) async {
      read(overlayLoadingProvider.notifier).update((_) => false);
      await showDialog<void>(
        context: read(navigatorKeyProvider).currentContext!,
        builder: (context) => ErrorDialog(
          message: e.toString(),
        ),
      );
    }

    listen<AsyncValue<T>>(
      provider,
      (previous, next) async {
        await next.when(
          skipLoadingOnRefresh: false,
          data: (data) async {
            hideLoading();
            showCompleteMessage();
            onComplete?.call(data);
          },
          error: (e, s) async {
            await showErrorDialog(e, s);
          },
          loading: () {
            showLoading();
          },
        );
      },
      onError: (e, s) async {
        await showErrorDialog(e, s);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/user_service.dart';

class SignOutConfirmDialog extends ConsumerWidget {
  const SignOutConfirmDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('確認'),
      content: const Text('サインアウトしますか？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('いいえ'),
        ),
        FilledButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await ref.read(userServiceProvider).signOut();
          },
          child: const Text('はい'),
        ),
      ],
    );
  }
}

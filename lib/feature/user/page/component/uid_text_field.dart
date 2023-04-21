import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/user.dart';

final uidTextEditingControllerProvider = Provider.autoDispose(
  (ref) {
    final uid = ref.watch(userProvider).value?.uid;
    final controller = TextEditingController(text: uid);
    ref.onDispose(controller.dispose);
    return controller;
  },
);

class UidTextField extends ConsumerWidget {
  const UidTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(uidTextEditingControllerProvider);
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('ユーザーID'),
        border: OutlineInputBorder(),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return '入力してください。';
        }
        return null;
      },
      autofocus: true,
    );
  }
}

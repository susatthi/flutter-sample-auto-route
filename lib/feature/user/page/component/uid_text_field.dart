import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uidTextEditingControllerProvider = Provider.autoDispose(
  (ref) {
    final controller = TextEditingController();
    ref.onDispose(controller.dispose);
    return controller;
  },
);

class UidTextField extends ConsumerStatefulWidget {
  const UidTextField({super.key});

  @override
  ConsumerState<UidTextField> createState() => _UidTextFieldState();
}

class _UidTextFieldState extends ConsumerState<UidTextField> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(uidTextEditingControllerProvider);
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('ユーザーID'),
        border: OutlineInputBorder(),
      ),
      onChanged: (text) {
        setState(() {});
      },
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

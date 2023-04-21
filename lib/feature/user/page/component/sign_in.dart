
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/user_service.dart';
import 'uid_text_field.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        if (formKey != null && !formKey!.currentState!.validate()) {
          return;
        }

        final uid = ref.read(uidTextEditingControllerProvider).text;
        await ref.read(userServiceProvider).signIn(uid: uid);
      },
      child: const Text('サインイン'),
    );
  }
}

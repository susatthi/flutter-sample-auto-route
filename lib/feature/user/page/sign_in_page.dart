import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/user_service.dart';
import 'component/uid_text_field.dart';

@RoutePage()
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInStateProvider, (_, next) {
      print(next);
    });

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
            maxHeight: 400,
          ),
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const UidTextField(),
          const SizedBox(height: 40),
          _SignInButton(formKey: _formKey),
        ],
      ),
    );
  }
}

class _SignInButton extends ConsumerWidget {
  const _SignInButton({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () async {
        if (!formKey.currentState!.validate()) {
          return;
        }

        final uid = ref.read(uidTextEditingControllerProvider).text;
        await ref.read(userServiceProvider).signIn(uid: uid);
      },
      child: const Text('サインイン'),
    );
  }
}

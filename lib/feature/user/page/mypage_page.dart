import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/user.dart';
import 'component/sign_out.dart';
import 'component/uid_text_field.dart';
import 'component/update_uid.dart';

@RoutePage()
class MypageNavigationPage extends AutoRouter {
  const MypageNavigationPage({super.key});
}

@RoutePage()
class MypagePage extends ConsumerWidget {
  const MypagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('ユーザーID'),
              subtitle: Text(ref.watch(userProvider).value?.uid ?? ''),
              onTap: () => showModalBottomSheet<void>(
                context: context,
                builder: (context) => const _EditUidBottomSheet(),
              ),
            ),
            ListTile(
              title: const Text('サインアウト'),
              onTap: () => showDialog<void>(
                context: context,
                builder: (_) => const SignOutConfirmDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditUidBottomSheet extends ConsumerStatefulWidget {
  const _EditUidBottomSheet();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditUidBottomSheetState();
}

class _EditUidBottomSheetState extends ConsumerState<_EditUidBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: UidTextField(),
            ),
          ),
          UpdateUidButton(formKey: _formKey),
        ],
      ),
    );
  }
}

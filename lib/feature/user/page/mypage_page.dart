import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../component/widget_ref.dart';
import '../../../router/app_router.dart';
import '../service/user_service.dart';
import '../state/user.dart';
import 'component/sign_out.dart';
import 'component/uid_text_field.dart';
import 'component/update_uid.dart';

@RoutePage()
class MypageRouterPage extends AutoRouter {
  const MypageRouterPage({super.key});
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
              trailing: const _EditUidButton(),
            ),
            ListTile(
              title: const Text('利用規約'),
              onTap: () async {
                await context.navigateTo(const TermOfServiceRoute());
              },
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

class _EditUidButton extends StatelessWidget {
  const _EditUidButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showModalBottomSheet<void>(
        context: context,
        builder: (context) => const _EditUidBottomSheet(),
      ),
      child: const Text('変更'),
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
    ref.handleAsyncValue(
      updateUidStateProvider,
      completeMessage: 'ユーザーIDを更新しました。',
      onComplete: (_) {
        Navigator.of(context).pop();
      },
    );

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

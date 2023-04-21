import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../component/widget_ref.dart';
import '../../service/user_service.dart';
import 'uid_text_field.dart';

class UpdateUidButton extends ConsumerWidget {
  const UpdateUidButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.handleAsyncValue(
      updateUidStateProvider,
      completeMessage: 'ユーザーIDを更新しました。',
    );

    return TextButton(
      onPressed: () async {
        if (formKey != null && !formKey!.currentState!.validate()) {
          return;
        }

        final uid = ref.read(uidTextEditingControllerProvider).text;
        await ref.read(userServiceProvider).updateUid(newUid: uid);
      },
      child: const Text('保存'),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.dart';

@RoutePage()
class SettingsViewRouterPage extends AutoRouter {
  const SettingsViewRouterPage({
    super.key,
    @PathParam('id') required this.id,
  });

  final int id;
}

@RoutePage()
class SettingsViewPage extends ConsumerWidget {
  const SettingsViewPage({
    super.key,
    @PathParam.inherit('id') required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('設定'),
      ),
      body: ColoredBox(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$id'),
              ElevatedButton(
                onPressed: () async {
                  await context.navigateTo(SettingsDetailsRoute());
                },
                child: const Text('詳細'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

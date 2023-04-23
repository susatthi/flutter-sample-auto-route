import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.dart';

@RoutePage()
class SettingsRouterPage extends AutoRouter {
  const SettingsRouterPage({super.key});
}

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('設定'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('設定$index'),
            onTap: () async {
              await context.navigateTo(
                SettingsViewRoute(id: index),
              );
            },
          );
        },
      ),
    );
  }
}

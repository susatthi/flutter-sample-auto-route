import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/app_router.dart';

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
    @PathParam.inherit() required this.id,
    this.memoryText,
  });

  final int id;
  final String? memoryText;

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
              Text('id = $id'),
              Text('memoryText = $memoryText'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await context.navigateTo(SettingsDetailsRoute());
                },
                child: const Text('詳細'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await context.navigateTo(SettingsFavoriteRoute());
                },
                child: const Text('お気に入り'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

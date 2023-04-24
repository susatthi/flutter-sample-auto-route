import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.dart';

@RoutePage()
class HomeRouterPage extends AutoRouter {
  const HomeRouterPage({super.key});
}

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.navigateTo(const SettingsRouterRoute());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ColoredBox(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.navigateTo(
                    SettingsRouterRoute(
                      children: [
                        SettingsViewRouterRoute(
                          id: 10,
                          children: [
                            SettingsDetailsRoute(),
                          ],
                        )
                      ],
                    ),
                  );
                },
                child: const Text('設定10の詳細'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await context.navigateTo(
                    SettingsRouterRoute(
                      children: [
                        SettingsViewRouterRoute(
                          id: 10,
                          children: const [
                            SettingsFavoriteRoute(),
                          ],
                        )
                      ],
                    ),
                  );
                },
                child: const Text('設定20のお気に入り'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

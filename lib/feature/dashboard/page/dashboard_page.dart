import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router.dart';

@RoutePage()
class DashboardNavigationPage extends AutoRouter {
  const DashboardNavigationPage({super.key});
}

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ダッシュボード'),
        actions: [
          IconButton(
            onPressed: () async {
              await context.router.navigate(const CartRoute());
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: const ColoredBox(
        color: Colors.amber,
        child: Center(
          child: Text('ダッシュボード'),
        ),
      ),
    );
  }
}
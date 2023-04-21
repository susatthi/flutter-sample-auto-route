import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NotFoundPage extends ConsumerWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 エラー'),
      ),
      body: const ColoredBox(
        color: Colors.red,
        child: Center(
          child: Text('ページが見つかりません。'),
        ),
      ),
    );
  }
}

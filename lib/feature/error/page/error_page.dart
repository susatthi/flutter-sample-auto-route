import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    super.key,
    this.error = '不明なエラーです。',
  });

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: ColoredBox(
        color: Colors.red,
        child: Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}

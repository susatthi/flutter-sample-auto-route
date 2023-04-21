import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class TermOfServicePage extends ConsumerWidget {
  const TermOfServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('利用規約'),
      ),
      body: const ColoredBox(
        color: Colors.orange,
        child: Center(
          child: Text('利用規約'),
        ),
      ),
    );
  }
}

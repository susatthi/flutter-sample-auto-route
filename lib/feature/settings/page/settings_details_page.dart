import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsDetailsPage extends ConsumerWidget {
  const SettingsDetailsPage({
    super.key,
    @PathParam.inherit('id') required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定詳細'),
      ),
      body: ColoredBox(
        color: Colors.green,
        child: Center(
          child: Text('$id'),
        ),
      ),
    );
  }
}

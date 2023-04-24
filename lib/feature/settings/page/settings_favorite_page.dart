import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsFavoritePage extends ConsumerWidget {
  const SettingsFavoritePage({
    super.key,
    @QueryParam() this.query,
  });

  final String? query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: const Text('お気に入り'),
      ),
      body: ColoredBox(
        color: Colors.yellow,
        child: Center(
          child: Text(query ?? 'null'),
        ),
      ),
    );
  }
}

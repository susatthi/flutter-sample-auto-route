import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'feature/user/repository/user_adapter.dart';
import 'feature/user/repository/user_repository.dart';
import 'feature/user/state/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // パスの#を除去する
  setPathUrlStrategy();

  // Hiveの初期化
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  final userBox = await Hive.openBox<User>(hiveBoxNameUserData);

  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWith((ref) {
          return UserRepository(box: userBox);
        }),
      ],
      child: const App(),
    ),
  );
}

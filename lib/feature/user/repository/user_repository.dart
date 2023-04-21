import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../state/user.dart';

const hiveBoxNameUserData = 'userData';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  throw UnimplementedError();
});

class UserRepository {
  const UserRepository({
    required this.box,
  });

  final Box<User> box;

  static const keyName = 'user';
  static const delaySeconds = 4;

  Future<void> put(User user) async {
    // 擬似的に遅延させる
    await Future<void>.delayed(const Duration(seconds: delaySeconds));
    await box.put(keyName, user);
  }

  Future<void> delete() async {
    // 擬似的に遅延させる
    await Future<void>.delayed(const Duration(seconds: delaySeconds));
    await box.delete(keyName);
  }

  Future<User?> get() async {
    // 擬似的に遅延させる
    await Future<void>.delayed(const Duration(seconds: delaySeconds));
    return box.get(keyName, defaultValue: null);
  }

  Stream<User?> changes() {
    return box.watch(key: keyName).map<User?>((event) => event.value as User?);
  }
}

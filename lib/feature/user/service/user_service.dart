import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/user_repository.dart';
import '../state/user.dart';

final signInStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'signInStateProvider',
);

final signOutStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'signOutStateProvider',
);

final updateUidStateProvider = StateProvider<AsyncValue<void>>(
  (_) => const AsyncValue.data(null),
  name: 'updateUidStateProvider',
);

final userServiceProvider = Provider(
  UserService.new,
);

class UserService {
  const UserService(this.ref);

  final Ref ref;

  UserRepository get userRepository => ref.read(userRepositoryProvider);

  Future<void> signIn({
    required String uid,
  }) async {
    final notifier = ref.read(signInStateProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await userRepository.put(User(uid: uid));
    });
  }

  Future<void> signOut() async {
    final notifier = ref.read(signOutStateProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await userRepository.delete();
    });
  }

  Future<void> updateUid({
    required String newUid,
  }) async {
    final notifier = ref.read(updateUidStateProvider.notifier);
    notifier.state = const AsyncValue.loading();
    notifier.state = await AsyncValue.guard(() async {
      await userRepository.put(User(uid: newUid));
    });
  }
}

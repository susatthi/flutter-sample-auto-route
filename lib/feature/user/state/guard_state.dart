import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'guard_state.freezed.dart';

@freezed
class GuardState with _$GuardState {
  const factory GuardState({
    /// サインイン済みかどうか
    required bool signedIn,
  }) = _GuardState;
}

final guardStateProvider = StateProvider<AsyncValue<GuardState>>(
  (ref) {
    // uidが変更された場合は通知しないように、user != null
    // の状態に変化があったときだけ状態を変更する
    ref.listen(userProvider, (previous, next) {
      final prevSignedIn = previous?.toGuardState();
      final nextSignedIn = next.toGuardState();
      if (nextSignedIn != null && prevSignedIn != nextSignedIn) {
        ref.controller.state = AsyncValue.data(nextSignedIn);
      }
    });
    return const AsyncValue.loading();
  },
  name: 'guardStateProvider',
);

extension on AsyncValue<User?> {
  // AsyncValue<User?> => GuardState?
  // ユーザー状態が未確定ならnullを返す
  GuardState? toGuardState() {
    if (isLoading || hasError) {
      return null;
    }

    return GuardState(
      signedIn: requireValue != null,
    );
  }
}

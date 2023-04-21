import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/user_repository.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    /// ユーザーID
    required String uid,
  }) = _User;
}

final userStreamProvider = StreamProvider((ref) {
  return ref.watch(userRepositoryProvider).changes();
});

final userProvider = FutureProvider((ref) async {
  ref.listen(userStreamProvider, (previous, next) {
    ref.state = next;
  });
  return ref.watch(userRepositoryProvider).get();
});

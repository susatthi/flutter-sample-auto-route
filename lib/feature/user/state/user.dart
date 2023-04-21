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

final userProvider = StreamProvider((ref) {
  return ref.watch(userRepositoryProvider).changes();
});

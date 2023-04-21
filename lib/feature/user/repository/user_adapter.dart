import 'package:hive_flutter/adapters.dart';

import '../state/user.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  int get typeId => 0;

  @override
  User read(BinaryReader reader) {
    final uid = reader.readString();
    return User(uid: uid);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.uid);
  }
}

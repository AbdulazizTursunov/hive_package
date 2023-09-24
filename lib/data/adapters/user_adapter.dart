

import 'package:hive/hive.dart';
import 'package:hive_package/data/model/user_model.dart';

class UserAdapter extends TypeAdapter<UserModel>{
  @override
  UserModel read(BinaryReader reader) {
    final name = reader.read() as String;
    final surName = reader.read() as String;
    final age = reader.read() as int;


    return UserModel(name: name, age: age, surname: surName);
  }

  @override
  final int typeId = 0;

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer..write(obj.name)
    ..write(obj.surname)
    ..write(obj.age);
  }
  
}
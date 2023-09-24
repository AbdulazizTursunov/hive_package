import 'package:hive/hive.dart';

class UserModel  extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(0)
  final String surname;
  @HiveField(1)
  final int age;

  UserModel({required this.name, required this.age, required this.surname});


}

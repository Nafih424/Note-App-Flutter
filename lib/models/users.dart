

import 'package:hive_flutter/adapters.dart';
part 'users.g.dart';

@HiveType(typeId: 2)
class User{
  @HiveField(0)
  int? id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  User({this.id,required this.username,required this.password});

}
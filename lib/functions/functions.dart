

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/LoginScreen.dart';
import 'package:note_app/models/notes.dart';
import 'package:note_app/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<Note>> notes = ValueNotifier([]);
String? currentUsername;
Future<void>addNote(Note value)async{
  final noteDb = await Hive.openBox<Note>('note_db');
  await noteDb.add(value);
  getAllNotes();
}


Future getAllNotes()async{
  print("inside");
  final noteDb = await Hive.openBox<Note>('note_db');
  final user_note = noteDb.values.where((note) => note.username == currentUsername);
  // noteDb.clear();
  print(user_note);
  notes.value.clear();
  notes.value.addAll(user_note);
  filtered_note = notes.value;
  notes.notifyListeners();
  
}


Future deleteNote(String index)async{
  print(index);
  final noteDb = await Hive.openBox<Note>('note_db');
  final user_note = noteDb.values.where((note) => note.id == index).toList();
  // final item = filtered_note[index];
  // print(item.title);
  print(user_note.toList()[0]);
  if(user_note != null){
    final keyToDelete = noteDb.keyAt(noteDb.values.toList().indexOf(user_note[0]));
    noteDb.delete(keyToDelete);
    getAllNotes();
  }
  // noteDb.deleteAt(index);
  
}


Future<void>addUser(User value, BuildContext context)async{
  final userDb = await Hive.openBox<User>('user_db');
  print(value.username + " username");
  final username = value.username;
  final existingUser = userDb.values.firstWhere((user) => user.username == username,orElse: ()=> User(username: "null", password: "null"));
  print(existingUser);
  if(existingUser.username == "null"){
    await userDb.add(value);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  
  getAllUsers();
}


Future getAllUsers()async{
  print("inside");
  final userDb = await Hive.openBox<User>('user_db');
  // noteDb.clear();
  print(userDb.values);
  
}

Future loginAccount(username,password)async{
  final userDb = await Hive.openBox<User>('user_db');

  final user = userDb.values.firstWhere((user) => user.username == username);

  if(user != null){
    if(user.password == password){
      print("success");
      final _shared = await SharedPreferences.getInstance();
      _shared.setString("username", user.username);
      currentUsername = user.username;
      return true;
    }else{
      return false;
    }
  }else{
    return false;
  }
}


Future <void> logOut(BuildContext context)async{
  final _shared = await SharedPreferences.getInstance();
  _shared.remove("username");
  currentUsername = null;
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
}


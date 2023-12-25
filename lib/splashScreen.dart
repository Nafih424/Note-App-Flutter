import 'package:flutter/material.dart';
import 'package:note_app/LoginScreen.dart';
import 'package:note_app/NotesScreen.dart';
import 'package:note_app/functions/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    print("good");
    checkLogin();
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
  Future<void> checkLogin()async{
    print("hello iam inside");
    final _shared = await SharedPreferences.getInstance();
    currentUsername = _shared.getString("username");
    print("Type of intValue: ${currentUsername.runtimeType}");
    if(currentUsername != null){
      print(currentUsername! + " this i suser");
      getAllNotes();
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NoteScreen()));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NoteScreen()), (route) => false);

    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    }
}
}
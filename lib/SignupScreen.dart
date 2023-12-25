import 'package:flutter/material.dart';
import 'package:note_app/LoginScreen.dart';
import 'package:note_app/functions/functions.dart';
import 'package:note_app/models/users.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _username = TextEditingController();
  final _password = TextEditingController();
  final _c_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 120, 16, 0),
                child: Text("Hey! \nCreate Your Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
                    child: Image(image: AssetImage('assets/images/googe_icon.png'),width: 30,))
                ],
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                child: TextField(
                  controller: _username,

                  style: TextStyle(color: Colors.white),
                  
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    prefixIcon:  Icon(Icons.person,color: Colors.grey.shade700,),

                    fillColor: Colors.grey.shade800,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _password,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon:  Icon(Icons.password,color: Colors.grey.shade700,),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _c_password,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon:  Icon(Icons.password,color: Colors.grey.shade700,),
                    fillColor: Colors.grey.shade800,
                    filled: true,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                    ),
                ),
              ),
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 100,top: 20,right: 100,bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    signUp(_username.text,_password.text,_c_password.text,context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text("SIGNUP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3),),
                    ),
                  ),
                ),
              ),
              Center(child: GestureDetector(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              },child: Text("Already Have Account? Login.",style: TextStyle(color: Colors.grey.shade600,wordSpacing: 1),)))
            ],
          ),
        ),
      ),
    );
  }
}

void signUp(username,password,c_password,BuildContext context){
  if(password == c_password){
    addUser(User(username: username, password: password),context);
  }
}
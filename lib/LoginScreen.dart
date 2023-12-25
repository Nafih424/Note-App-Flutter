import 'package:flutter/material.dart';
import 'package:note_app/NotesScreen.dart';
import 'package:note_app/SignupScreen.dart';
import 'package:note_app/functions/functions.dart';




class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _username = TextEditingController();

  final _password = TextEditingController();

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
                child: Text("Hey! \nWelcome Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
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
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.only(left: 100,top: 20,right: 100,bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    login(_username.text,_password.text,context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text("LOGIN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 3),),
                    ),
                  ),
                ),
              ),
              Center(child: GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
              },child: Text("No Account? Create a Account.",style: TextStyle(color: Colors.grey.shade600,wordSpacing: 1),)))
            ],
          ),
        ),
      ),
    );
    
  }
}

void login(username,password,BuildContext context)async{
  bool result = await loginAccount(username,password);
  if(result){
    print("dcsd");
    getAllNotes();
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> const NoteScreen()));
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const NoteScreen()), (route) => false);
  }
}



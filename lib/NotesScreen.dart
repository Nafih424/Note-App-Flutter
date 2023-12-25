
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/colors/colors.dart';
import 'package:note_app/editScreen.dart';
import 'package:note_app/functions/functions.dart';
import 'package:note_app/models/notes.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  // List<Note>filtered_note = [];
  bool sorted = false;

  randomColor(){
  Random random = Random();
  return backgroundColors[random.nextInt(backgroundColors.length)];
  }


  

  void searchNote(String searchText){
    setState(() {
      filtered_note =  notes.value.where((element) => element.title.toLowerCase().contains(searchText)).toList();
      print(filtered_note);  
    });
  }

  sortNotes(List<Note> notes){
    if(sorted){
      notes.sort((a, b) => a.editedTime.compareTo(b.editedTime),);
    }else{
      notes.sort((b, a) => a.editedTime.compareTo(b.editedTime),);
    }
    sorted = !sorted;
    return notes;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notes",style: TextStyle(fontSize: 30,color: Colors.white),),
                Row(
                  children: [
                    IconButton(onPressed: (){setState(() {
                      filtered_note = sortNotes(filtered_note); 
                    });}, icon:Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.sort,
                        color: Colors.white,
                        )
                        )
                      ),
                      IconButton(onPressed: (){
                        logOut(context);
                      }, icon:Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.grey.shade800.withOpacity(0.8),borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                        )
                        )
                      ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                onChanged: (value){
                  searchNote(value);
                },
                style: const TextStyle(fontSize: 16,color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  hintText: "Search Notes",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search,color: Colors.white,),
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: const BorderSide(color: Colors.transparent)),
            
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: notes,
                builder: (BuildContext ctx, List<Note> notes, Widget? child) {
                  return ListView.builder(
                    itemCount: filtered_note.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          color: randomColor(),
                          child: ListTile(
                            title: RichText(
                              text:  TextSpan(
                                text: '${filtered_note[index].title} \n',
                                style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,height: 1.5),
                                children: [
                                  TextSpan(
                                    text: filtered_note[index].content,
                                    style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,height: 1.5),
                                  )
                                ]
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("${filtered_note[index].id}",style: TextStyle(color: Colors.grey.shade800,fontSize: 10,fontStyle: FontStyle.italic),),
                            ),
                            trailing: IconButton(onPressed: (){deleteNote(filtered_note[index].id);}, icon: const Icon(Icons.delete)),
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            )
          ],
        ),
        
      ),
    floatingActionButton: FloatingActionButton(onPressed: ()async{
      final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const EditScreem(),));
      if(result != null){

        addNote(Note(title: result[0], content: result[1], editedTime: DateTime.now(),username: currentUsername!));

        // setState(() {
        //   // notes.add(Note(id: notes.length, title: result[0], content: result[1], editedTime: DateTime.now()));
        //   addNote(Note(title: result[0], content: result[1], editedTime: DateTime.now()));
        // });
      }
    },child: const Icon(Icons.add,size: 38,),),  
    );
  }
}


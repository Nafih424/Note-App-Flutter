import 'package:flutter/material.dart';

class EditScreem extends StatefulWidget {
  const EditScreem({super.key});

  @override
  State<EditScreem> createState() => _EditScreemState();

  

}

class _EditScreemState extends State<EditScreem> {
  final _title_text = TextEditingController();
  final _content_text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 40,width: 40,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: Colors.grey.shade800.withOpacity(0.8),),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: IconButton(onPressed:(){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
            )),

            const SizedBox(height: 5,),

            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: _title_text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey.shade700,fontSize: 30)
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                  ),TextField(
                    controller: _content_text,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Content Here",
                      hintStyle: TextStyle(color: Colors.grey.shade700,fontSize: 16)
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.normal),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context,[_title_text.text,_content_text.text]);
        
      },child: const Icon(Icons.save,size:40,),),
    );
  }
}
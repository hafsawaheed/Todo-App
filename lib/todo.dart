import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
 
 var output = "";
 List<dynamic> lst = [1,2,3];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context,index){
        return Container(
          height: 50,
          color: Colors.red[100],
          margin:EdgeInsets.only(top:15),
          child: ListTile(
            title: Text("${lst[index]}"),
            trailing: Container(
              width:50 ,
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                   showDialog(context: context, builder: (context){
                    return AlertDialog(
                   title: Text("Add Item"),
                   content: TextField(
                   onChanged: (value){
                   output= value;
                   }
                   ),
                 actions: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                     lst.replaceRange(index,index+1,{output});
                });
                Navigator.of(context).pop();
              }, child: Text("Add"))
            ],
          );
        });
                  },child: Icon(Icons.edit)),
                   GestureDetector(onTap:(){
                    setState(() {
                      lst.removeAt(index);
                    });
                  },child: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        );
      }),
      backgroundColor: Colors.pinkAccent[700],
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Add Item"),
            content: TextField(
              onChanged: (value){
                output= value;
              }
            ),
            actions: [
              ElevatedButton(onPressed: (){
                setState(() {
                  lst.add(output);
                });
                Navigator.of(context).pop();
              }, child: Text("Add"))
            ],
          );
        });
      },child: Text("Add"),
      backgroundColor: Colors.indigo[300],),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
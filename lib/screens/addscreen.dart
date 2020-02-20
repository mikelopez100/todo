import 'package:flutter/material.dart';


class Addscreen extends StatelessWidget {
  TextEditingController taskCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a new task")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        TextField(controller: taskCtrl,),
        RaisedButton(child: Text("Add"), onPressed: (){
          //go back to the previous screen
          //and return the value in the textbox
          print(taskCtrl.text);
          Navigator.pop(context, taskCtrl.text);
        },)
      ],),
    );
  }
}
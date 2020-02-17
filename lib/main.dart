import 'package:flutter/material.dart';
import 'package:todolist/utils/persistence.dart';
import 'screens/homescreen.dart';
import 'models/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<List<Task>>(
        future: readTaskList(),
        builder: (ctx, snapshot){
          if(snapshot.hasData){
            return Homescreen(snapshot.data);
          }else if(snapshot.hasError){
            return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          );
          }else{
            print(snapshot.connectionState);
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          }
        },
      ),
    );
  }
}


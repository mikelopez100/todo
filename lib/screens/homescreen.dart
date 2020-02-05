import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/addscreen.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Task> tasks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Task t1 = Task("do the dishes", false);
    Task t2 = Task("take out the trash", false);
    Task t3 = Task("tap out schweller", false);
    tasks = [t1, t2, t3];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //navigate to a new screen
          //receive a value when i come back from the screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addscreen()),
            );

          //how do a make a new task from that value
          Task t = Task("asdf", false);

          //add it to the list of tasks
          tasks.add(t);
        },
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Todo List"),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView.builder(
        itemBuilder: (ctx, i) {
          return CheckboxListTile(
              title: Text(tasks[i].text),
              value: tasks[i].completed,
              onChanged: (bool b) {
                tasks[i].completed = b;
                setState(() {});
              });
        },
        itemCount: tasks.length,
      )),
    );
  }
}

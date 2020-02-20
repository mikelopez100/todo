import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/addscreen.dart';
import 'package:todolist/utils/persistence.dart';

class Homescreen extends StatefulWidget {
  List<Task> tasks;

  Homescreen(this.tasks);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
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
          String taskText = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addscreen()),
          );

          if (taskText != null) {
            //how do a make a new task from that value
            Task t = Task(taskText, false);

            //add it to the list of tasks
            widget.tasks.add(t);

            //save list of tasks to file system
            writeTaskList(widget.tasks);
          }
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
          return Dismissible(
            key: UniqueKey(),
            child: CheckboxListTile(
                activeColor: Colors.grey,
                title: Text(
                    
                    widget.tasks[i].text != null ? widget.tasks[i].text : "", 
                    style: TextStyle(color : widget.tasks[i].completed ? (Colors.grey) : (Colors.black)),),
                value: widget.tasks[i].completed,
                onChanged: (bool b) {
                  widget.tasks[i].completed = b;
                  writeTaskList(widget.tasks);
                  if(b){
                  widget.tasks.add((widget.tasks[i]));
                  widget.tasks.remove((widget.tasks[i]));
                  
                  }
                  setState(() {});
                }),
            onDismissed: (direction) {
              widget.tasks.removeAt(i);
              setState(() {writeTaskList(widget.tasks);});
            },
          );
        },
        itemCount: widget.tasks.length,
      )),
    );
  }
}

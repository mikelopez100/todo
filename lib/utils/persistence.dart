import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/task.dart';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
      final path = await _localPath;
      return File('$path/tasks.json');
  }

Future<File> writeTaskList(List<Task> list) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString(jsonEncode(list));
}

Future<List<Task>> readTaskList() async {
  try {
    final file = await _localFile;

    // Read the file.
    String contents = await file.readAsString();

    List<dynamic> listOfMaps =  jsonDecode(contents);
    List<Task> listOfTasks = [];
    listOfMaps.forEach((m){
      listOfTasks.add(Task.fromJson(m));
    });
    return listOfTasks;
  } catch (e) {

    try{
      writeTaskList([]);
      return [];
    }catch (e){
      print(e.toString());
      return null;
    }

  }
}
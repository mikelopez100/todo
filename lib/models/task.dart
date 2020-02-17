class Task{
  String text;
  bool completed;
  Task(this.text, this.completed);

   Task.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        completed = json['completed'];


  Map<String, dynamic> toJson() =>
    {
      'text': text,
      'completed': completed,
    };
}
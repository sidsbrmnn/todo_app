class Task{
  final String  task;
  bool isComplete;

  Task({this.task, this.isComplete = false});

  void toggleDone(){
    isComplete = !isComplete;
  }
}
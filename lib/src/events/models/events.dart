class Event{
  final String time;
  final String task;
  final String category;
  bool isComplete;
  Event({this.time, this.category, this.task, this.isComplete = false});

  void toggleDone(){
    isComplete = !isComplete;
  }
}
class Todo {
  String? id;
  String? todoText;
  bool? isDone;

  Todo({required this.id, required this.todoText, this.isDone});

  static List<Todo> todoList() {
    return [
      Todo(
        id: "01",
        todoText: "todo test item 1",
      ),
      Todo(
        id: "02",
        todoText: "todo test item 2",
      ),
      Todo(
        id: "03",
        todoText: "todo test item 3",
      ),
      Todo(
        id: "04",
        todoText: "todo test item 4",
      ),
      Todo(
        id: "05",
        todoText: "todo test item 5",
      ),
      Todo(
        id: "06",
        todoText: "todo test item 6",
      )
    ];
  }
}

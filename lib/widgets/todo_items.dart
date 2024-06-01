import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import '../model/todo.dart';

class ToDoItems extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeletedItem;
  const ToDoItems(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeletedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
        onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone != null ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdblue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdblack,
              decoration:
                  todo.isDone != null ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdred, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeletedItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}

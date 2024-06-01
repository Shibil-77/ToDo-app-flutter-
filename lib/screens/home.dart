// ignore_for_file: unused_element

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/colors.dart';
import '../model/todo.dart';
import 'package:todo_app/widgets/todo_items.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final todosList = Todo.todoList();
  final addTodoItem = TextEditingController();
  List<Todo> _foundTodo = [];

  @override
  void initState() {
    _foundTodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBgColor,
        appBar: _buildAppbar(),
        // ignore: avoid_unnecessary_containers
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  serachBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "All ToDos",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        // ignore: unused_local_variable
                        for (Todo todo in _foundTodo)
                          ToDoItems(
                            todo: todo,
                            onToDoChanged: handleTodoChange,
                            onDeletedItem: handleTodoDelete,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(bottom: 20, left: 20, right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0.0),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: addTodoItem,
                      decoration: InputDecoration(
                          hintText: "Add a new todo item",
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          handleAddTodoItem(addTodoItem.text);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tdblue, elevation: 10),
                      ))
                ],
              ),
            )
          ],
        ));
  }

  handleTodoChange(Todo todo) {
    setState(() {
      if (todo.isDone == true) {
        print("todo is done");
        todo.isDone = false;
      } else {
        todo.isDone = true;
        print("todo is not done");
      }
    });
  }

  handleTodoDelete(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  handleAddTodoItem(String toDo) {
    setState(() {
      todosList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    addTodoItem.clear();
  }

  runfilter(String enteredKeyword) {
    List<Todo>? result = [];
    if (enteredKeyword.isEmpty) {
      result = todosList;
    } else {
      result = todosList
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    //  @override
    // ignore: use_function_type_syntax_for_parameters
    setState(() {
      _foundTodo = result!;
    });
  }

  Widget serachBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => runfilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: tdblack,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 25, minHeight: 20),
            border: InputBorder.none,
            hintText: 'Serach',
            hintStyle: TextStyle(color: tdgrey)),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdBgColor,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdblack,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 40,
            color: tdblack,
          )
        ],
      ),
    );
  }
}

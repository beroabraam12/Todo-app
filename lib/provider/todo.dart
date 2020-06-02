import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class Todo with ChangeNotifier {
  List<TodoModel> _todos = [
    TodoModel(
        id: "1",
        name: "Todo1 here is my first todo ever in my life",
        desc:
            "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua. Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint occae cat cupidatat non proident, sunt in culpa qui officia.",
        date: DateTime.now(),
        time: TimeOfDay.now(),
        image: "assets/cart.png",
        color: Color(0xFFFEA64C),
        done: false),
    TodoModel(
        id: "2",
        name: "Todo1 here is my first todo ever in my life",
        desc: "dasdasdasdasdasdasdasdas",
        date: DateTime.now(),
        time: TimeOfDay.now(),
        image: "assets/gm.png",
        color: Color(0xFFFE1E9A),
        done: false),
    TodoModel(
        id: "3",
        name: "Todo1 here is my first todo ever in my life",
        desc: "dasdasdasdasdasdasdasdas",
        date: DateTime.now(),
        time: TimeOfDay.now(),
        image: "assets/location.png",
        color: Color(0xFF254DDE),
        done: false),
  ];
  List doneTodos = [];
  bool editMode = false;
  int marked = 0;
  List<TodoModel> get todos {
    return [..._todos];
  }

  addTodos(id, color, name, date, desc, selectIcon, time) {
    _todos.add(TodoModel(
      id: id.toString(),
      color: color,
      name: name,
      date: date,
      desc: desc,
      image: selectIcon,
      time: time,
      done: false,
    ));
    notifyListeners();
  }

  editTodo() {
    if (editMode) {
      _todos.forEach((element) {
        if (element.done == true) {
          doneTodos.add(element);
          marked++;
        }
      });
      _todos.removeWhere((element) => element.done == true);
      editMode = !editMode;
    } else {
      editMode = !editMode;
    }
    notifyListeners();
  }
}

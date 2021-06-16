import 'dart:ui';

import 'package:flutter/material.dart';

class ToDo {
  String sname = '', lname = '';
  DateTime date = DateTime(0);
  Color? color = Colors.red[300];
  bool done = false;
  ToDo(this.sname, this.lname, this.date, this.color);
  ToDo.fromNothing();
  void setDone() {
    this.done = true;
  }
}

class ToDoCollector {
  List<ToDo> ToDoList = <ToDo>[];
  ToDoCollector();
  void AddToDoThing(ToDo thing) {
    ToDoList.add(thing);
  }
}

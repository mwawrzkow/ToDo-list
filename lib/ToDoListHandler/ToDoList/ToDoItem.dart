import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<void> updateGlobals() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("AMOUNT", ToDoList.length);
    for (int i = 0; i < ToDoList.length; i++) {
      sp.setString('lname' + i.toString(), ToDoList[i].lname);
      sp.setString('sname' + i.toString(), ToDoList[i].sname);
      sp.setString('date' + i.toString(), ToDoList[i].date.toString());
      sp.setString(
          'color' + i.toString(), ToDoList[i].color!.value.toRadixString(16));
    }
  }

  void removeAt(int idx) {
    ToDoList.removeAt(idx);
    updateGlobals();
  }

  Future<void> AddToDoThing(ToDo thing) async {
    ToDoList.add(thing);
    updateGlobals();
  }
}

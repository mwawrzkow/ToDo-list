import 'package:flutter/material.dart';
import 'package:todolist/ToDoListHandler/ToDoList/ToDoCreator/ToDoCreator.dart';
import 'ToDoList/ToDoItem.dart';

class ListofThingsToDo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: mainPage(title: 'ToDo List Manager'),
    );
  }
}

class mainPage extends StatefulWidget {
  mainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListOfThingsToDo createState() => _ListOfThingsToDo();
}

class _ListOfThingsToDo extends State<mainPage> {
  ToDoCollector collector = ToDoCollector();
  void AddItem() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoCreator()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(title: Text("ToDo List")),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 * (index % 4)],
                  height: 100,
                  child: Text('Item:' + collector.ToDoList[index].Short),
                );
              },
              childCount: collector.ToDoList.length - 1,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: AddItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
    // throw UnimplementedError();
  }
}

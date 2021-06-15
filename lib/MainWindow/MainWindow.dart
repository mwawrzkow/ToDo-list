import 'package:flutter/material.dart';
import '../ToDoListHandler/ToDoListHandler.dart';
import '../ToDoListHandler/ToDoList/ToDoItem.dart';

class MyApp extends StatelessWidget {
  ToDoCollector collector = ToDoCollector();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'ToDo List Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void ShowToDoList() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListofThingsToDo()));
    setState(() {});
  }

  void AddToDo() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 600.0,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("ToDo List"),
              background: Image(
                fit: BoxFit.fill,
                image:
                    NetworkImage('https://picsum.photos/seed/picsum/1280/720'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 * (index % 4)],
                  height: 100,
                  child: ElevatedButton(
                      onPressed: ShowToDoList,
                      child: const Text('Show ToDoList')),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: AddToDo,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todolist/ToDoListHandler/ToDoList/ToDoCreator/ToDoCreator.dart';
import 'package:todolist/ToDoListHandler/ToDoList/ToDoItem.dart';
import 'List.dart';

class ListofThingsToDo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPage(title: 'ToDo List Manager'),
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
  void setItem(int idx) {
    setState(() {
      toDoCollector.removeAt(idx);
    });
  }

  void initState() {
    super.initState();

    // for (var i = 0; i < 3; i++) {
    //   toDoCollector.AddToDoThing(
    //       ToDo('Test', 'Test 1 ', DateTime.now(), Colors.black));
    // }
  }

  void showToDo(int index) {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
              pinned: true,
              expandedHeight: 600.0,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "ToDo List",
                  style: TextStyle(color: Colors.black),
                ),
                background: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://wallpaperaccess.com/full/2603548.jpg')),
              )),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: toDoCollector.ToDoList[index].color,
                  height: 100,
                  child: Dismissible(
                    onDismissed: (DismissDirection direction) {
                      setItem(index);
                    },
                    key: new ObjectKey(toDoCollector.ToDoList[index]),
                    background: new Container(
                        color: const Color.fromRGBO(183, 28, 28, 0.8),
                        child: const ListTile(
                            leading: const Icon(Icons.delete,
                                color: Colors.white, size: 36.0))),
                    secondaryBackground: new Container(
                        color: const Color.fromRGBO(183, 28, 28, 0.8),
                        child: const ListTile(
                            trailing: const Icon(Icons.delete,
                                color: Colors.white, size: 36.0))),
                    child: Column(
                      children: <Widget>[
                        Row(children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          Spacer(
                            flex: 5,
                          ),
                          Center(
                              child: TextButton(
                            child: Text(toDoCollector.ToDoList[index].sname,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                            onPressed: () => {showToDo(index)},
                          )),
                          Spacer(
                            flex: 5,
                          )
                        ]),
                        Row(
                          children: [
                            Spacer(
                              flex: 10,
                            ),
                            Text(toDoCollector.ToDoList[index].date
                                .toString()
                                .split(' ')[0])
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: toDoCollector.ToDoList.length,
            ),
            itemExtent: 65,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final value = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ToDoCreator(),
            ),
          );
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.teal[900],
      ),
    );
    // throw UnimplementedError();
  }
}

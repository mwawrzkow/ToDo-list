import 'package:flutter/material.dart';
import '../ToDoItem.dart';

class ToDoCreator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoCreatorPage(title: 'ToDo List Manager'),
    );
  }
}

class ToDoCreatorPage extends StatefulWidget {
  ToDoCreatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ToDoCreatorPage createState() => _ToDoCreatorPage();
}

class _ToDoCreatorPage extends State<ToDoCreatorPage> {
  void getList() {
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new reminder'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.check),
            )
          ],
        ),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: TextFormField(
                  autocorrect: true,
                  autofocus: true,
                  decoration: const InputDecoration(
                      labelText: 'Short Name',
                      hintText: 'Provide short name for your reminder'),
                  maxLength: 36,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextFormField(
                  autocorrect: true,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Provide description for your reminder'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Row(
                  children: <Widget>[
                    Text('Reminder will remind in ' +
                        '${selectedDate.toLocal()}'.split(' ')[0]),
                    Spacer(
                      flex: 50,
                    ),
                    TextButton(
                      onPressed: selectDate,
                      child: Text('Select Date'),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
    // throw UnimplementedError();
  }
}

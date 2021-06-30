import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/ToDoListHandler/List.dart';
import '../../ToDoListHandler.dart';
import '../ToDoItem.dart';

bool shouldLoadDefaultValues = false;
int indexOfEditedComponent = -1;

class ToDoCreator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ToDoCreatorPage(title: 'ToDo List Manager'),
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
  String sname = '', lname = '';
  late TextEditingController _sname, _lname;
  Color screenColorPicker = Colors.white;

  @override
  void initState() {
    super.initState();
    if (shouldLoadDefaultValues) {
      _sname = new TextEditingController(
          text: toDoCollector.ToDoList[indexOfEditedComponent].sname);
      _lname = new TextEditingController(
          text: toDoCollector.ToDoList[indexOfEditedComponent].lname);
      sname = toDoCollector.ToDoList[indexOfEditedComponent].sname;
      lname = toDoCollector.ToDoList[indexOfEditedComponent].lname;
      selectedDate = toDoCollector.ToDoList[indexOfEditedComponent].date;
      screenColorPicker = toDoCollector.ToDoList[indexOfEditedComponent].color!;
    } else {
      _sname = new TextEditingController();
      _lname = new TextEditingController();
    }
  }

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
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(Icons.check),
                onPressed: () async {
                  if (!shouldLoadDefaultValues)
                    toDoCollector.AddToDoThing(
                        ToDo(sname, lname, selectedDate, screenColorPicker));
                  else {
                    toDoCollector.ToDoList[indexOfEditedComponent] =
                        ToDo(sname, lname, selectedDate, screenColorPicker);
                    toDoCollector.updateGlobals();
                  }
                  Navigator.pop(context);
                },
              ),
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
                  onChanged: (value) => sname = value,
                  controller: _sname,
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
                  controller: _lname,
                  onChanged: (value) => lname = value,
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
              ),
              Card(
                elevation: 2,
                child: ColorPicker(
                  // Use the screenPickerColor as start color.
                  color: screenColorPicker,
                  // Update the screenPickerColor using the callback.
                  onColorChanged: (Color color) =>
                      setState(() => screenColorPicker = color),
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  heading: Text(
                    'Select color',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subheading: Text(
                    'Select color shade',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              )
            ],
          ),
        ));
    // throw UnimplementedError();
  }
}

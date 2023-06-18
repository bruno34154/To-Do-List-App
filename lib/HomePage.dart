import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  int counter = 0;
  String textScreen = '';
  List<String> textScreenArray = [];
  String getText = '';
  int checked = 0;
  bool isChecked = false;

  Widget TextInScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ...textScreenArray
            .map((name) => Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 96, 157, 238),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0))),
                    width: double.infinity,
                    height: 50,
                    child: Stack(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            left: 50.0,
                          ),
                          child: Text(
                            name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )),
                      new CheckboxExample(),
                    ]))))
            .toList(),
      ],
    );
  }

  TextToDoList() {
    return TextField(
        onChanged: (text) => {
              getText = text,
            },
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.create),
            hintText: 'Informe uma tarefa'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            child: TextInScreen()),
        Container(child: TextToDoList()),
      ])),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
                setState(() {
                  counter++;
                  //textScreen += '$counter - $getText \n\n\n';
                  textScreenArray.add('$counter - $getText \n\n\n');
                })
              }),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.black,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

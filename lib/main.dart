import 'package:flutter/material.dart';
import 'src/model/Todo.dart';


void main() => runApp(MyTodoApp());

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo!",
      home: TodoState(),
    );
  }
}

class TodoState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTodoAppState();
  }
}

class MyTodoAppState extends State<TodoState> {
  final List<Todo> todos = [Todo('oiii', done: true), Todo('teste')];
  String newTodo = '';
  final TextEditingController textEditingController = TextEditingController();

  Iterable<Widget> _buildTodoList() {
    return todos.map((Todo t) {
      return GestureDetector(
          onTap: () {
            setState(() {
              t.done = !t.done;
            });
          },
          child: FractionallySizedBox(
            widthFactor: .9,
            child: Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(3),
                ),
              ),
              child: Text(
                t.text,
                textAlign: TextAlign.center
                  ,
                style: TextStyle(
                  fontSize: 25.0,
                  decoration:
                      t.done ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
          ));
    });
  }

  Widget _buildInput() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        onSubmitted: (String value) {
          setState(() {
            todos.add(Todo(value));
            textEditingController.clear();
          });
        },
        controller: textEditingController,
        autocorrect: false,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
        ),
      ),
      body: Column(
        children: List<Widget>()
          ..add(_buildInput())
          ..addAll(_buildTodoList()),
      ),
    );
  }
}


import 'package:flutter/material.dart';

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
  final List<Todo> todos = [Todo('oiiiSimp', done: true), Todo('teste')];
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
        child: Text(
          t.text,
          style: TextStyle(
            fontSize: 25.0,
            decoration:
                t.done ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      );
    });
  }

  Widget _buildInput() {
    return TextField(
      onSubmitted: (String value) {
        setState(() {
          todos.add(Todo(value));
          textEditingController.clear();
        });
      },
      controller: textEditingController,
      autocorrect: false,
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

class Todo {
  String text;
  bool done;

  Todo(this.text, {this.done = false});
}

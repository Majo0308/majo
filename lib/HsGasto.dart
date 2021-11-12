import 'package:pruebasss/drawer_menu.dart';
import 'package:flutter/material.dart';

class Gasto extends StatelessWidget {
   final List<Todo3> todos;

  Gasto({Key? key, required this.todos}) : super(key: key);

  static const String routeName = '/HsGasto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasto"),
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class Todo3 {
  final String title;
  final String description;

  Todo3(this.title, this.description);
}
void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: Gasto(
      todos: List.generate(
        20,
        (i) => Todo3(
              'Gasto $i',
              'Una Descripción del Gasto $i',
            ),
      ),
    ),
  ));
}
class DetailScreen extends StatelessWidget {
  // Declara un campo que contenga el objeto Todo
  final Todo3 todo;

  // En el constructor, se requiere un objeto Todo
  DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usa el objeto Todo para crear nuestra UI
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

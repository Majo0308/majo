import 'package:pruebasss/drawer_menu.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {

  static const String routeName = '/contact';
  final List<Todo> todos;

  Contact({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      backgroundColor: Colors.purple,
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
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
void main() {
  runApp(MaterialApp(
    title: 'Passing Data',
    home: Contact(
      todos: List.generate(
        20,
        (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ),
      ),
    ),
  ));
}
class DetailScreen extends StatelessWidget {
  // Declara un campo que contenga el objeto Todo
  final Todo todo;

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

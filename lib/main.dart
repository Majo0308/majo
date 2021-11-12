import 'package:pruebasss/HsGasto.dart';
import 'package:pruebasss/movies.dart';
import 'package:pruebasss/profile.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String home = Home.routeName;
  static const String gasto = Gasto.routeName;
  static const String profile = Ingreso.routeName;
  static const String movies = Prestamo.routeName;
  static const String contacts = Contact.routeName;



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo Drawer Menu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        home: (context) => Home(),
        gasto: (context) => Gasto(todos: List.generate(
        20,
        (i) => Todo3(
              'Gasto $i',
              'La descripción del Gasto, etiqueta, foto, etc $i',
            ),
        ),),
        profile: (context) => Ingreso(todos: List.generate(
        20,
        (i) => Todo2(
              'Ingreso $i',
              'La descripción del Ingreso, etiqueta, foto, etc $i',
            ),
      ),),
        contacts: (context) => Contact(todos: List.generate(
        20,
        (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ),
      ),),
        movies: (context) => Prestamo(todos: List.generate(
        20,
        (i) => Todo1(
              'Préstamo $i',
              'La descripción del Préstamo, etiqueta, foto, etc $i',
            ),
      ),),
        contacts: (context) => Contact(todos: List.generate(
        20,
        (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ),
      ),),
      },
      home: Home(),
    );
  }
}
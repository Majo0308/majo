import 'package:pruebasss/main.dart';

class User {
  final String titulo;
  final String fecha;
  final int relevancia;
  final int categoria;
  final String descripcion;

  User({
    //constructor
    required this.titulo,
    required this.fecha,
    required this.relevancia,
    required this.categoria,
    required this.descripcion,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      titulo: json['titulo'],
      fecha: json['fecha'],
      relevancia: json['relevancia'],
      categoria: json['categoria'],
      descripcion: json['descripcion'],
    );
  }
}
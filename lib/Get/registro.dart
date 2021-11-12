import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pruebasss/User2.dart';


class Relevancia_get extends StatefulWidget {
  Relevancia_get({Key? key}) : super(key: key);

  @override
  _Relevancia_getState createState() => _Relevancia_getState();
}

class _Relevancia_getState extends State<Relevancia_get> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  TextEditingController relevanciaController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  int i = 0;
  final String url =
      'https://apiagenda120211108203647.azurewebsites.net/api/Relevancias/';
  Future<void> getData(String relevancia) async {
    final response = await http.get(Uri.parse(url + relevancia.toString()), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);
      if (vacio == false) {
        User user = User.fromJson(jsonData[i]);
        lim = jsonData.length;

        //tituloController.text = 'titulo: ' + user.titulo;
        tituloController.text = 'Titulo: ' + user.titulo;
        fechaController.text = 'Fecha:' + user.fecha;
        if (user.relevancia == 0) {
          relevanciaController.text = 'Relevancia: Importante';
        }
        if (user.relevancia == 1) {
          relevanciaController.text = 'Relevancia: Secundario';
        }
        if (user.categoria == 0) {
          categoriaController.text = 'Categoria: Personal';
        }
        if (user.categoria == 1) {
          categoriaController.text = 'Categoria: Familiar';
        }
        if (user.categoria == 2) {
          categoriaController.text = 'Categoria: Escolar';
        }
        if (user.categoria == 3) {
          categoriaController.text = 'Categoria: Cumpleaños';
        }

        descripcionController.text = 'Descripcion: ' + user.descripcion;
      }
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  int? _value = 0;
  bool vacio = false;
  int lim = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("MOSTRAR POR RELEVANCIA"),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: DropdownButtonFormField(
              alignment: Alignment.center,
              decoration: InputDecoration(
                hintText: 'RELEVANCIA',
                prefixIcon: Icon(Icons.event),
                border: OutlineInputBorder(),
              ),
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("IMPORTANTE"),
                  value: 0,
                ),
                DropdownMenuItem(
                  child: Text("SECUNDARIO"),
                  value: 1,
                ),
              ],
              onChanged: (int? value) {
                setState(() {
                  _value = value;
                  i = -1;
                });
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.pink[600],
                    onPrimary: Colors.white,
                    minimumSize: Size(200, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  if (_value == 0) {
                    getData('0');
                  }
                  if (_value == 1) {
                    getData('1');
                  }
                  i++;
                  if (i > lim - 1) {
                    i = 0;
                  }
                },
                child: Text('Siguiente',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textScaleFactor: 1,)),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: TextFormField(
                controller: tituloController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'TITULO',
                  prefixIcon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                )),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: TextFormField(
                controller: fechaController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'FECHA',
                  prefixIcon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                )),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: TextFormField(
                controller: categoriaController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'CATEGORIA',
                  prefixIcon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                )),
          ),
          Container(
            alignment: Alignment.center,
            //color: Colors.grey[300],
            width: 300,
            // height: 70,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(0.0),
            child: TextFormField(
                controller: descripcionController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'DESCRIPCION',
                  prefixIcon: Icon(Icons.event),
                  border: OutlineInputBorder(),
                )),
          ),
        ]))));
  }
}
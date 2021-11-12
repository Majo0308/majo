import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pruebasss/User2.dart';



class InformacionEventoWidget extends StatelessWidget {
  const InformacionEventoWidget({Key? key, required this.tipo, required this.etiqueta, required this.descripcion, required this.monto}) : super(key: key);
  final int tipo;
  final String etiqueta;
  final String descripcion;
  final int monto;
  /*"id": 0,
  "tipo": 0,
  "etiqueta": "string",
  "descripcion": "string",
  "monto": 0*/
  

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(

  alignment: Alignment.center,
  width: 300,
  padding: EdgeInsets.all(5.0),
  margin: EdgeInsets.all(0.0),
  child: Text(tipo.toString()),

),Container(

  alignment: Alignment.center,
  width: 300,
  padding: EdgeInsets.all(5.0),
  margin: EdgeInsets.all(0.0),
  child: Text(etiqueta),

),Container(

  alignment: Alignment.center,
  width: 300,
  padding: EdgeInsets.all(5.0),
  margin: EdgeInsets.all(0.0),
  child: Text(descripcion),

),Container(

  alignment: Alignment.center,
  width: 300,
  padding: EdgeInsets.all(5.0),
  margin: EdgeInsets.all(0.0),
  child: Text(monto.toString()),

),
      ],
    );
  }
}
class Relevancia_get extends StatefulWidget {
  Relevancia_get({Key? key}) : super(key: key);

  @override
  _Relevancia_getState createState() => _Relevancia_getState();
}

class _Relevancia_getState extends State<Relevancia_get> {

  List<Widget> widgetsListView = [];
  int i = 0;
  //final String url =
    //  'https://apiagenda120211108203647.azurewebsites.net/api/Relevancias/';
    final String url = "https://contamales.azurewebsites.net/api/Registros";
  Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;

       
      
    } else {
      throw Exception('Error al llamar al API');
    }
  }

  Future<List> getLista(String relevancia) async {
    final response = await http.get(Uri.parse(url + relevancia), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;

    } else {
      throw Exception('Error al llamar al API');
    }
  }

 List<Widget> generarWidgets(List<dynamic> lista){

  List<Widget> widgets = [Text("a")];
  for(int i=0; i<lista.length; i++) {
    widgets.add( InformacionEventoWidget(tipo: lista[i]["tipo"], etiqueta: lista[i]["etiqueta"], descripcion: lista[i]["descripcion"], monto: lista[i]["monto"]),);}
   return widgets;
 } //estara asi un rato

  bool vacio = false;
  int lim = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("MOSTRAR POR RELEVANCIA"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height*0.8,
          child: Column(
            children: [ ElevatedButton(
              child: Text('Siguiente'),
                        onPressed: ()  async{print("queso");


                    List<dynamic> datos =await  getData();
                    print("Api Sirvio");
                    print(datos);
                    setState(() {
                      widgetsListView = generarWidgets(datos);
                    });},),

                  Container(height: 500, child: ListView( children: widgetsListView,))
            ],
            /*
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            
             
           ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pink[600],
                      onPrimary: Colors.white,
                      minimumSize: Size(200, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: ()  async{
                    List<dynamic> datos =await  getData();
                    setState(() {
                      widgetsListView = generarWidgets(datos);
                    });

                  },
                  child: Text('Siguiente',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        textScaleFactor: 1,),),

            Container(child: ListView(children: this.widgetsListView),),
            

          
          ],
          
          
          ),
          ),*/),
        ),);
  }
}
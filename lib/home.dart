import 'package:pruebasss/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'Get/registro.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContaMales"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        widthFactor: 200.0,
        child: Column(children: [
          Container(
            width: 1000.0,
            height: 300,
            decoration:
                new BoxDecoration(), /*
              image: new DecorationImage(fit: BoxFit.fill, image: NetworkImage('https://w0.peakpx.com/wallpaper/416/130/HD-wallpaper-ajolote-xd.jpg'),),
          ),*/
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 2),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Search artist, maker, department...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset('assets/images/preview.jpg',
                    width: 1000.0, height: 80.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset('assets/images/preview1.jpg',
                    width: 1000.0, height: 80.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset('assets/images/preview2.jpg',
                    width: 1000.0, height: 80.0),
              ),
            ),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ingreso"), shadowColor: Colors.orange),
      body: Center(
        child: Container(
            width: 500,
            child: Column(
              children: [
                Image(
                    image: AssetImage('assets/images/IMG-20211110-WA0001.jpg')),
                Padding(padding: new EdgeInsets.all(20.0)),
                Text(
                  'Monto',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(10.0),
                      hintText: 'Please enter a search term'),
                ),
                ElevatedButton(
                  child: Text('Tragos'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Relevancia_get()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Comida'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tablas()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('Uber'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tablas()),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class Tablas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gasto"), shadowColor: Colors.orange),
      body: Center(
        child: DataTable(columns: [
          DataColumn(label: Text('Gastos')),
          DataColumn(
            label: Text('Monto'),
          )
        ], rows: [
          DataRow(cells: [
            DataCell(Text("Comida")),
            DataCell(Text('30')),
          ]),
          DataRow(cells: [
            DataCell(Text('Uber')),
            DataCell(Text('50')),
          ]),
          DataRow(cells: [
            DataCell(Text('Trago')),
            DataCell(Text('100')),
          ]),
          DataRow(cells: [
            DataCell(Text('Total')),
            DataCell(Text('180')),
          ]),
        ]),
      ),
    );
  }
}

class IngTablas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gasto"), shadowColor: Colors.pink),
      body: Center(
        child: DataTable(columns: [
          DataColumn(label: Text('Ingreso')),
          DataColumn(
            label: Text('Monto'),
          )
        ], rows: [
          DataRow(cells: [
            DataCell(Text("Mesada")),
            DataCell(Text('100')),
          ]),
          DataRow(cells: [
            DataCell(Text('Sueldo')),
            DataCell(Text('2500')),
          ]),
          DataRow(cells: [
            DataCell(Text('Plata que encontré en la calle')),
            DataCell(Text('90')),
          ]),
          DataRow(cells: [
            DataCell(Text('Total')),
            DataCell(Text('2690')),
          ]),
        ]),
      ),
    );
  }
}

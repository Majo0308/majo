
//import 'dart:html';
//import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'main.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
          _buildDrawerHeader(),
          _buildDrawerItem(icon: Icons.shopping_cart,  text:'Historial de Gastos', onTap: () => {
              Navigator.pushReplacementNamed(context, MyApp.gasto)
          }),
          _buildDrawerItem(icon: Icons.attach_money, text: 'Historial de Ingresos', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.profile)
          }),
          _buildDrawerItem(icon: Icons.child_friendly_sharp, text: 'Historial de préstamo', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.movies)
          }),
          Divider(),
          _buildDrawerItem(icon: Icons.menu, text: 'Volver al menu', onTap: () => {
            Navigator.pushReplacementNamed(context, MyApp.home)
          }),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }


  Widget _buildDrawerHeader() {
    return DrawerHeader(

        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          
          //image: Image.network('https://www.okchicas.com/wp-content/uploads/2019/05/Wallpaper-bonitos-para-celular-1-1.jpg'),
          image: DecorationImage(
                fit: BoxFit.cover,
                image:  AssetImage('assets/images/abstract-memphis-background-geometric-elements-vector.jpg'))),
        
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              
              child: Text("ContaMales",
                  style: TextStyle(
                     // background: Rect.largest,
                      //backgroundColor: Colors.orange,
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _buildDrawerItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
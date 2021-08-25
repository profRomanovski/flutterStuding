import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed:() {},
          ),
          iconTheme: IconThemeData(color: Colors.white),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.settings)
            ),
          ],
        ),
        body: mainContent(),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

Widget mainContent(){
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  searchBar(),
                  Divider(),
                  title(),
                  Divider(),
                  weatherLogo(),
                ],
              ),
            )
        )
      ],
    ),
  );
}

Widget searchBar(){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Icon(Icons.search, size: 30, color: Colors.white,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Text('Enter City Name',
          style: TextStyle(fontSize: 15, color: Colors.white),),
      ),
    ],
  );
}

Widget title(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget> [
      Text('Chmelnytska oblast, UA',
        style: TextStyle(fontSize: 30, color: Colors.white),),
      Divider(),
      Text('Friday, Aug 26, 2021',
        style: TextStyle(fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),)
    ],
  );
}
Widget weatherLogo(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(Icons.wb_sunny, size: 60, color: Colors.white,),
      SizedBox(width: 16.0),
      Column(
        children: <Widget>[
          Text('17 °C', style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          Text(
            'LIGHT SNOW',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      )
    ],
  );
}
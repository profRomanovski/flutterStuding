import 'dart:io';

import 'package:flutter/cupertino.dart';
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
                  SizedBox(width: 0, height: 40),
                  weatherLogo(),
                  SizedBox(width: 0, height: 40,),
                  weatherInfo(),
                  SizedBox(width: 0, height: 40,),
                  appTitle(),
                  Divider(),
                  weatherList(),
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
Widget weatherInfo(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget> [
      Column(
        children: [
          Icon(
            Icons.wb_cloudy_sharp,
            size: 30,
            color: Colors.white,
          ),
          Text(
            '5',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            'km/h',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.wb_cloudy_sharp,
            size: 30,
            color: Colors.white,
          ),
          Text(
            '3',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            '%',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
      Column(
        children: [
          Icon(
            Icons.wb_cloudy_sharp,
            size: 30,
            color: Colors.white,
          ),
          Text(
            '20',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            '%',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}
Widget appTitle(){
  return Text('7-DAY WEATHER FORECAST',
    style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w300
    ),
  );
}

class WeatherItem{
  String day = '';
  int temperature = 0;
  String degree = '';
  IconData icon = Icons.wb_sunny;
  WeatherItem(String day, int temperature){
    this.degree = '°C';
    this.icon = Icons.wb_sunny;
    this.day = day;
    this.temperature = temperature;
  }
}
Widget weatherList(){
  List<WeatherItem> items = [];
  items.add(WeatherItem('Friday', 20));
  items.add(WeatherItem('Saturday', 15));
  items.add(WeatherItem('Sunday', 18));
  items.add(WeatherItem('Monday', 22));

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 20.0),
    height: 100,
    child: ListView.separated(
      itemCount: items.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index){
      return Container(
                width: 150,
                color: Colors.white.withOpacity(0.2),
                child: Column(
                  children: <Widget>[
                    SizedBox(width: 0,height: 10),
                    Text('${items[index].day}',
                    style: TextStyle(fontSize: 22,
                        color: Colors.white,
                    fontWeight: FontWeight.w400),
                    ),
                    SizedBox(width: 0,height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${items[index].temperature} ',
                          style: TextStyle(fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Text('${items[index].degree} ',
                          style: TextStyle(fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(items[index].icon,
                        size: 30,
                        color: Colors.white),
                      ],
                    ),
                  ],
                ),
              );
    }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 15, height: 0,);
    },
    ),
  );
}
import 'package:flutter/material.dart';

void main() {
  runApp(Content());
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.indigo[200],
          appBar: AppBar(
            title: Text('Chapter2'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tap "-" to decrement',
                  style: TextStyle(fontSize: 20),
                ),
                CounterWidget(),
                Text(
                  'Tap "+" to increment',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

class CounterState extends State<CounterWidget> {
  int count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        border: Border.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                count--;
              });
            },
            icon: Icon(
              Icons.remove,
              size: 40,
            ),
          ),
          Text(
            '$count',
            style: TextStyle(fontSize: 30),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            icon: Icon(Icons.add, size: 40),
          ),
        ],
      ),
    );
  }
}

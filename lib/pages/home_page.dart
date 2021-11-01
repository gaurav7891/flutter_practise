import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double days = 10;
    String name = "Flutter";
    bool _isMale = false;
    num temp = 30.5; // takes both integer and double
    var day = 'Tuesday';
    const pi = 3.14; // value cannot be modified
    final x = 12; // data can be modified

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

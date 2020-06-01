import 'package:flutter/material.dart';
import 'package:todo/pages/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      routes: {
        ListPage.routeName: (BuildContext context) => ListPage(),
      },
    );
  }
}

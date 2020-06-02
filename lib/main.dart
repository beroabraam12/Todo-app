import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/list.dart';
import 'package:todo/pages/list_done.dart';

import 'provider/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Todo(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          ListPage.routeName: (BuildContext context) => ListPage(),
          ListDonePage.routeName: (BuildContext context) => ListDonePage(),
        },
      ),
    );
  }
}

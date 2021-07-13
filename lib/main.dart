import 'package:flutter/material.dart';
import './util/dbhelper.dart';
import './models/list_items.dart';
import './models/shopping_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DbHelper helper = DbHelper();
    helper.testDb();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}

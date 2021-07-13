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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping List'),
        ),
        body: ShList(),
      ),
    );
  }
}

class ShList extends StatefulWidget {
  @override
  _ShListState createState() => _ShListState();
}

class _ShListState extends State<ShList> {
  DbHelper helper = DbHelper();

  @override
  Widget build(BuildContext context) {
    showData();
    return Container();
  }

  Future showData() async {
    await helper.openDb();
    ShoppingList list = ShoppingList(0, 'Bakery', 2);
    int listId = await helper.insertList(list);
    ListItem item = ListItem(0, listId, 'Bread', 'note', '1 kg');
    int itemId = await helper.insertItem(item);
    print('List Id: ' + listId.toString());
    print('Item Id: ' + itemId.toString());
  }
}

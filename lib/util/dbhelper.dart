import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  final int version = 1;
  Database? db;

  Future<Database> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (Database database, int version) {
        database.execute(
            '''CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)''');
        database.execute(
            '''CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT,
            note TEXT, ' + 'FOREIGN KEY(idList) REFERENCES lists(id))''');
      }, version: version);
    }
    return db!;
  }
}

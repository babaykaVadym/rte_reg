import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rte_cubit/models/db/data_base_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "mai.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, type TEXT, eventId  INTEGER, posts INTEGER, userId INTEGER)");
  }

  Future<int> saveUser(DataBaseMaodel user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  Future<List<DataBaseMaodel>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    List<DataBaseMaodel> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user = new DataBaseMaodel(list[i]["type"], list[i]["eventId"],
          list[i]["posts"], list[i]["userId"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(id) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM User WHERE posts = ?', [id]);
    return res;
  }

  /*Future<bool> update(DataBaseMaodel user) async {
    var dbClient = await db;

    int res = await dbClient.update("User", user.toMap(),
        where: "id = ?", whereArgs: <int>[user.id]);

    return res > 0 ? true : false;
  }*/
}

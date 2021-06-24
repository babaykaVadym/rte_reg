import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'contact_db.dart';

class ContactDatabaseHelper {
  static final ContactDatabaseHelper _instance =
      new ContactDatabaseHelper.internal();

  factory ContactDatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  ContactDatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "contact.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Contact(id INTEGER PRIMARY KEY, userId INTEGER)");
  }

  Future<int> saveUser(ContactDataBaseMaodel user) async {
    var dbClient = await db;
    int res = await dbClient.insert("Contact", user.toMap());
    return res;
  }

  Future<List<ContactDataBaseMaodel>> getUser() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Contact');
    List<ContactDataBaseMaodel> employees = new List();
    for (int i = 0; i < list.length; i++) {
      var user = new ContactDataBaseMaodel(list[i]["userId"]);
      user.setUserId(list[i]["id"]);
      employees.add(user);
    }
    print(employees.length);
    return employees;
  }

  Future<int> deleteUsers(id) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM Contact WHERE userId = ?', [id]);
    return res;
  }
}

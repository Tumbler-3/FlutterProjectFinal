import 'package:a_flutter/data_handler/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBCommands {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDatabase();
      return _db;
    }
  }

  initDatabase() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'users.db');
    var db =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE users (
      name TEXT NOT NULL,
      username TEXT UNIQUE NOT NULL,
      email TEXT UNIQUE NOT NULL,
      password TEXT NOT NULL);''');
    });
    return db;
  }

  Future<int> saveUser(UserModel newUser) async {
    var dbClient = await db;
    var result = await dbClient!.insert('users', newUser.toMap());
    return result;
  }

  Future<Map<String, Object?>> validLogin(String username, String password) async {
    var dbClient = await db;
    var result = await dbClient?.rawQuery('SELECT * FROM users WHERE '
        'username = $username AND password = $password');
    return result![0];
  }

  Future<List<Map<String, Object?>>?> valid(String column, String text) async{
    var dbClient = await db;
    List<Map<String, Object?>>? result = await dbClient?.rawQuery(
        "SELECT * FROM users WHERE $column = '$text'");
    return result;
  }

}

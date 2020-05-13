import 'dart:async';
import 'package:flutterapp/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {

  factory DBService() {
    _instance ??= DBService._internalConstructor();
    return _instance;
  }

  DBService._internalConstructor();

  static DBService _instance;
  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'tms_app.db'),
      version: 1,
      onCreate: _onCreate
    );
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE user(id INTEGER PRIMARY KEY, token TEXT)',
    );
  }

  Future<bool> isLoggedIn() async {
    final Database dbClient = await db;
    final List<Map<String, dynamic>> user = await dbClient.query('user');
    return user.isEmpty;
  }

  Future<int> saveUser(User user) async {
    final Database dbClient = await db;
    final int res = await dbClient.insert('user', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);
    return res;
  }

  Future<void> deleteUser(int id) async {
    final Database dbClient = await db;
    await dbClient.delete('user', where: 'id = ?', whereArgs: <int>[id],);
  }
}
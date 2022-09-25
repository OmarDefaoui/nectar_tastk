import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "notes.db";
  static const _databaseVersion = 1;
  static const table = "my_table";
  static const columnId = "id";
  static const columnTitle = "title";
  static const columnBody = "body";
  static const columnDate = "date";
  static Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    //Create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTitle TEXT NOT NULL,
            $columnBody TEXT NOT NULL,
            $columnDate TEXT NOT NULL
          );
          ''');
  }

  Future<int?> insert(Map<String, dynamic> note) async {
    Database? db = await instance.database;
    return await db?.insert(table, note);
  }

  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> update(Map<String, dynamic> note) async {
    Database? db = await instance.database;
    return await db?.update(table, note,
        where: '$columnId = ?', whereArgs: [note[columnId]]);
  }

  Future<List<Map<String, dynamic>>?> queryAllNotes() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }
}

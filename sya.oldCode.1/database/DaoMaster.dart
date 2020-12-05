/*import 'package:path/path.dart';
import 'package:sqlite3/sqlite3.dart';*/
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// Master of the different transaction with the DB
class DaoMaster {
  static Database db;
  static int _version = 1;
  static String _path = "sya.db";

  static Future open() async {
    db = await openDatabase(_path, version: _version,
        onCreate: onCreate);
  }

  static Future onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS Memory(themeColor TEXT,
                                  defaultLogin TEXT
                                 )''');

    await db.execute('''
CREATE TABLE IF NOT EXISTS User(login TEXT,
                                hashedPassword TEXT
                               )''');

    await db.execute('''
CREATE TABLE IF NOT EXISTS WebSite(name TEXT,
                                   login TEXT,
                                   cryptedPassword TEXT,
                                   userID INT,
                                   FOREIGN KEY (userID) REFERENCES User(rowid) 
                                  )''');

    await db.execute("INSERT OR IGNORE INTO Memory(rowid, themeColor) VALUES (1, 'light')");
  }

  static Future close() async => db.close();

  static Future<int> insert(String table, Map<String, dynamic> values) async {
    await open();

    int id = await db.insert(table, values);

    await close();

    return id;
  }

  static Future<List<Map<String, dynamic>>> query(String table,
      {bool distinct, List<String> columns, String where, List<dynamic> whereArgs, String groupBy, String having, String orderBy, int limit, int offset}) async {
    await open();

    var ret = await db.query(table, distinct: distinct, columns: columns, where: where, whereArgs:  whereArgs, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);

    await close();

    return ret;
  }

  static Future<int> update(String table, Map<String, dynamic> values,
      {String where, List<dynamic> whereArgs, ConflictAlgorithm conflictAlgorithm}) async {
    await open();

    int id = await db.update(table, values, where : where, whereArgs: whereArgs, conflictAlgorithm: conflictAlgorithm);

    await close();

    return id;
  }

  static Future<int> delete(String table,
      {String where, List<dynamic> whereArgs}) async {
    await open();

    int id = await db.delete(table, where : where, whereArgs: whereArgs);

    await close();

    return id;
  }
}
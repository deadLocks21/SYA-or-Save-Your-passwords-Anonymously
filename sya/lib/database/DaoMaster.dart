import 'package:sqflite/sqflite.dart';

/// Master of the different transaction with the DB
class DaoMaster {
  /// Represent the database.
  static Database db;
  /// Version of the database.
  static int version = 1;
  /// Name of the database.
  static String dbName = "sya.db";


  /// Open the database.
  static Future open() async {
    db = await openDatabase(dbName, version: version,
        onCreate: onCreate);
  }

  /// Method called when the database is create.
  static Future onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS Memory(themeColor TEXT)");

    await db.execute('''
CREATE TABLE IF NOT EXISTS Website(name TEXT,
                                   login TEXT,
                                   cryptedPassword TEXT,
                                  )''');

    await db.execute("INSERT OR IGNORE INTO Memory(rowid, themeColor) VALUES (0, 'light')");
  }

  /// Close the database.
  static Future close() async => db.close();


  // CRUD functions.
  /// Method for insert data in the database.
  static Future<int> insert(String table, Map<String, dynamic> values) async {
    await open();

    int id = await db.insert(table, values);

    await close();

    return id;
  }

  /// Method for fetch data int the DB.
  static Future<List<Map<String, dynamic>>> query(String table,
      {bool distinct, List<String> columns, String where, List<dynamic> whereArgs, String groupBy, String having, String orderBy, int limit, int offset}) async {
    await open();

    var ret = await db.query(table, distinct: distinct, columns: columns, where: where, whereArgs:  whereArgs, groupBy: groupBy, having: having, orderBy: orderBy, limit: limit, offset: offset);

    await close();

    return ret;
  }

  /// Method for update data.
  static Future<int> update(String table, Map<String, dynamic> values,
      {String where, List<dynamic> whereArgs, ConflictAlgorithm conflictAlgorithm}) async {
    await open();

    int id = await db.update(table, values, where : where, whereArgs: whereArgs, conflictAlgorithm: conflictAlgorithm);

    await close();

    return id;
  }

  /// Method use for delete data in the DB
  static Future<int> delete(String table,
      {String where, List<dynamic> whereArgs}) async {
    await open();

    int id = await db.delete(table, where : where, whereArgs: whereArgs);

    await close();

    return id;
  }
}
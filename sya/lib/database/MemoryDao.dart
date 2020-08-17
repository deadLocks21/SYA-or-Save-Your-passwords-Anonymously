import 'DaoMaster.dart';

/// Class for manage the DB.
class MemoryDao {
  /// Return the theme use.
  static Future<String> getTheme() async {
    return (await DaoMaster.query("Memory", columns: ['themeColor']))[0]['themeColor'];
  }

  static Future<int> changeTheme(String theme) async {
    return await DaoMaster.update("Memory", {"rowid" : 0, "themeColor" : theme}, where: "rowid = ?", whereArgs: [0]);
  }
}
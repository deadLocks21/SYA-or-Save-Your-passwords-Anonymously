import 'DaoMaster.dart';

/// Class for manage the DB.
class MemoryDao {
  /// Return the theme use.
  static Future<String> getTheme() async {
    return (await DaoMaster.query("Memory", columns: ['themeColor']))[0]['themeColor'];
  }
}
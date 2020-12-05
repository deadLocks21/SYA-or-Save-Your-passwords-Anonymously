import 'package:sya/database/DaoMaster.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Class for manage the DB.
class MemoryDao {
  /// Return the theme use.
  static Future<String> getTheme() async {
    return (await DaoMaster.query("Memory", columns: ['themeColor']))[0]['themeColor'];
  }

  /// Resend the default login for the connection
  static Future<String> getDefaultLogin() async {
    return (await DaoMaster.query("Memory", columns: ['defaultLogin']))[0]['defaultLogin'];
  }
}
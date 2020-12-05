import 'package:sya/logic/Website.dart';
import 'DaoMaster.dart';

/// Manage the data of the websites.
class WebsiteDirectoryDao {
  /// Return the content of the database.
  static Future<List<Website>> getWebsites() async {
    List<Map<String, dynamic>> retQuery = await DaoMaster.query("Website", columns: ["rowid", "name", "login", "cryptedPassword"]);
    List<Website> ret = new List<Website>();

    for (int i = 0; i < retQuery.length; i++)
      ret.add(new Website(retQuery[i]['rowid'], name: retQuery[i]['name'], login: retQuery[i]['login'], cryptedPassword: retQuery[i]['cryptedPassword']));

    return ret;
  }
}
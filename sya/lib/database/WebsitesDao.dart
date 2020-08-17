import 'package:sya/logic/Website.dart';
import 'DaoMaster.dart';
import 'package:sya/logic/User.dart';

/// Manage the data of the websites.
class WebSitesDao {
  /// Return the content of the database.
  static Future<List<Website>> getWebSites() async {
    List<Map<String, dynamic>> retQuery = await DaoMaster.query("WebSite", columns: ["rowid", "name", "login", "cryptedPassword"]);
    List<Website> ret = new List<Website>();

    for (int i = 0; i < retQuery.length; i++)
      ret.add(new Website(retQuery[i]['rowquery'], retQuery[i]['name'], retQuery[i]['login'], retQuery[i]['cryptedPassword']));

    return ret;
  }

  /// Return the key.
  static Future<String> getTheKey() async => ((await getWebSites())[0]).decrypt(User.password);

  /// Add a website in the DB.
  static Future addAWebsite(Website website) async {
    await DaoMaster.insert("WebSite", {"name" : website.name, "login" : website.login, "cryptedPassword" : website.cryptedPassword});
  }
}
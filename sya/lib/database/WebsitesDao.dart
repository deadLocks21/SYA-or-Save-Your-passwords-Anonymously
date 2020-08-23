import 'package:sya/logic/Website.dart';
import 'DaoMaster.dart';
import 'package:sya/logic/User.dart';

/// Manage the data of the websites.
class WebsitesDao {
  /// Return the content of the database.
  static Future<List<Website>> getWebsites() async {
    List<Map<String, dynamic>> retQuery = await DaoMaster.query("Website", columns: ["rowid", "name", "login", "cryptedPassword"]);
    List<Website> ret = new List<Website>();

    for (int i = 0; i < retQuery.length; i++)
      ret.add(new Website(id: retQuery[i]['rowid'], name: retQuery[i]['name'], login: retQuery[i]['login'], cryptedPassword: retQuery[i]['cryptedPassword']));

    return ret;
  }

  /// Return the key.
  static Future<String> getTheKey() async => ((await getWebsites())[0]).decrypt(User.password);

  /// Add a website in the DB.
  static Future addAWebsite(Website website) async {
    await DaoMaster.insert("Website", {"name" : website.name, "login" : website.login, "cryptedPassword" : website.cryptedPassword});
  }

  static Future modifyAWebsite(Website website) async {
    await DaoMaster.update("Website", {"name" : website.name, "login" : website.login, "cryptedPassword" : website.cryptedPassword}, where: "rowid = ?", whereArgs: [website.id]);
  }
}
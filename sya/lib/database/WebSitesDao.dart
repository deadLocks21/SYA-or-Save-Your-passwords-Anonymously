import 'package:sya/logic/WebSite.dart';
import 'DaoMaster.dart';
import 'package:sya/logic/User.dart';

/// Manage the data of the websites.
class WebSitesDao {
  /// Return the content of the database.
  Future<List<WebSite>> getWebSites() async {
    List<Map<String, dynamic>> retQuery = await DaoMaster.query("WebSite", columns: ["rowid", "name", "login", "cryptedPassword"]);
    List<WebSite> ret = new List<WebSite>();

    for (int i = 0; i < retQuery.length; i++)
      ret.add(new WebSite(retQuery[i]['rowquery'], retQuery[i]['name'], retQuery[i]['login'], retQuery[i]['cryptedPassword']));

    return ret;
  }

  /// Return the key.
  Future<String> getTheKey() async => ((await getWebSites())[0]).decrypt(User.password);
  }
}
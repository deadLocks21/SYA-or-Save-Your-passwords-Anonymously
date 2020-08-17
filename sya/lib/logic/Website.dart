import 'package:sya/database/WebsitesDao.dart';

/// Class used to store a website
class Website {
  /// Id of the row in the DB.
  int id;
  /// Name of the website.
  String name;
  /// Login of the user.
  String login;
  /// Password crypted.
  String cryptedPassword;


  /// Constructor of the class
  Website(int id, String name, String login, String cryptedPassword) {
    this.id = id;
    this.name = name;
    this.login = login;
    this.cryptedPassword = cryptedPassword;
  }


  /// Return the password decrypted.
  String decrypt(String key) {
    throw new Exception("Function not implemented !");
  }

  /// Add the website.
  add() {
    WebsitesDao.addAWebsite(this);
  }

  /// Save the website in the database.
  save() {
    WebsitesDao.modifyAWebsite(this);
  }

  @override
  String toString() {
    return "[$id] $name, $login : $cryptedPassword";
  }
}
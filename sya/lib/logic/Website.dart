import 'package:flutter/cupertino.dart';
import 'package:sya/database/WebsitesDao.dart';
import 'package:sya/logic/Security.dart';
import 'package:sya/logic/User.dart';

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
  Website({@required this.id, this.name, this.login, this.cryptedPassword});


  /// Return the password decrypted.
  String decrypt(String key) {
    return Security.decrypt(cryptedPassword, key);
  }

  /// Add the website.
  add() {
    WebsitesDao.addAWebsite(new Website(id: id, name: name, login: login, cryptedPassword: Security.crypt(cryptedPassword, User.password)));
  }

  /// Save the website in the database.
  save() {
    WebsitesDao.modifyAWebsite(new Website(id: id, name: name, login: login, cryptedPassword: Security.crypt(cryptedPassword, User.password)));
  }

  @override
  String toString() {
    return "[$id] $name, $login : $cryptedPassword";
  }
}
import 'package:flutter/cupertino.dart';
import 'package:sya/database/WebsitesDao.dart';
import 'package:sya/logic/Security.dart';
import 'package:sya/logic/User.dart';

/// Class used to store a website
class Website {
  /// Id of the row in the DB.
  int _id;
  /// Name of the website.
  String name;
  /// Login of the user.
  String login;
  /// Password crypted.
  String cryptedPassword;


  /// Constructor of the class
  Website(this._id, {this.name, this.login, this.cryptedPassword});


  @override
  String toString() {
    return "[$_id] $name, $login : $cryptedPassword";
  }
}
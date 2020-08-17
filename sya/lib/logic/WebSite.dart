/// Class used to store a website
class WebSite {
  /// Id of the row in the DB.
  int id;
  /// Name of the website.
  String name;
  /// Login of the user.
  String login;
  /// Password crypted.
  String cryptedPassword;


  /// Constructor of the class
  WebSite(int id, String name, String login, String cryptedPassword) {
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
    throw new Exception("Function not implemented !");
  }

  /// Save the website in the database.
  save() {
    throw new Exception("Function not implemented !");
  }
}
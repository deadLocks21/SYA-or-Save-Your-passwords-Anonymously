/// Stocke les infos sur un site web.
class WebSite {
  /// Nom du site web.
  String name;
  /// Identifiant sur le site web.
  String login;
  /// Hash du mot de passe du site.
  String hashPass;


  /// Constructeur de la classe.
  WebSite(String name, String login, String hashPass) {
    this.name = name;
    this.login = login;
    this.hashPass = hashPass;
  }


  /// Récupérer l'attribut name.
  String getName() {
    return name;
  }

  /// Récupérer l'attribut login.
  String getLogin() {
    return login;
  }

  /// Récupérer l'attribut hashPass.
  String getHashPass() {
    return hashPass;
  }


  String decrypt(String pass){
    // TODO Décryptage du site
    return "";
  }
}
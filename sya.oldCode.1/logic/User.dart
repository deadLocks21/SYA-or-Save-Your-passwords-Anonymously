import 'WebSite.dart';

/// Stocke la clé et la liste des sites web d'un utilisateur.
class User {
  /// Clé de décryptage d'un mdp.
  String key;
  /// Liste des sites avec un mot de passe associé à un utilisateur.
  List listOfWebSite;


  /// Constructeur de la classe.
  User(String login, String password) {
    // TODO Remplir les champs avec les bonnes valeurs.
    key = "";
    listOfWebSite = [];
  }


  /// Assesseur de la variable listOfWebSite
  List getListOfWebSite() {
    return listOfWebSite;
  }

  /// Permet de récupérer seulement les noms des sites web.
  List getWebSiteName() {
    List names = [];

    for (WebSite webSite in listOfWebSite)
      names.add(webSite.getName());

    names.sort();

    return names;
  }
}
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var content = new List();
    String firstLetter = "";  // Première lettre du mot.
    bool fisrt = true;  // Permet de savoir si on a déjà affiché la première lettre ou non.

    // List names = Memory.getUser().getWebSiteName();
    // TODO Mettre en commentaire ici pour afficher la vraie liste. v
    List names = ["Item1", "Item2", "Item3", "Item4", "Jtem1", "Jtem2", "Jtem3", "Ktem1", "Ktem2", "Ktem3", "Ktem4", "Ktem5"];  // Stocke seulement les noms

    for (String name in names) {
      if (name[0] == firstLetter)  // Cas générale
        content.add(listTile(false, name, content));
      else  // Si on est sur la premiere ligne d'une lettre
        content.add(listTile(true, name, content));

      firstLetter = name[0];
    }

    return new ListView(
      children: content,
    );
  }

  /// Retourne une ligne bouton.
  Widget listTile(bool first, String text, content) {
    return FlatButton(
    child: Container(
      height: ResponsiveTools.height(48),
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              child: Text(
                  first ? text[0] : " ",
                  style: TextStyle(
                      fontSize: ResponsiveTools.textSize(24),
                      fontWeight: FontWeightType.MEDIUM,
                      color: ColorTools.getTitleColor()
                  )
              ),
              width: ResponsiveTools.width(24),
            ),
          ),
          Container(
            child: Text(
                text,
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(24),
                    fontWeight: FontWeightType.REGULAR,
                    color: ColorTools.getTitleColor()
                )
            ),
            margin: EdgeInsets.only(left: 32),
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(
          ResponsiveTools.width(16),
          ResponsiveTools.height(first && content.length != 0 ? 16 : 0),
          ResponsiveTools.width(16),
          ResponsiveTools.height(0)),
    ),
    onPressed: null,
  );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Tools/TextFactory.dart';
import 'package:sya/ihm/Tools/TextType.dart';
import 'package:sya/logic/WebSite.dart';
import 'package:sya/module/Memory.dart';

import 'Constants.dart';

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainWindow',
      theme: ThemeData(
        primaryColor: ColorTools.getMainColor(),
        fontFamily: 'Roboto'
      ),
      home: MainWinwdowWidget(title: 'Bienvenue dans SYA'),
    );
  }
}

class MainWinwdowWidget extends StatefulWidget {
  MainWinwdowWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWinwdowWidget> {
  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils();

    return Scaffold(
        appBar: AppBar(
          title: TextFactory.create(Constants.appbarText, 20, TextType.TITLE, FontWeightType.MEDIUM),
          leading: new IconButton(
              icon: Icon(
                Constants.logoutIcon,
                color: ColorTools.getTitleColor(),
                size: ResponsiveTools.width(24),
              ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Constants.settingsIcon,
                  color: ColorTools.getTitleColor(),
                  size: ResponsiveTools.width(24),
                )
            )
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: TextFactory.create(Constants.addText, 20, TextType.TITLE, FontWeightType.MEDIUM),
          icon: Icon(
            Constants.addIcon,
            size: ResponsiveTools.width(24),
          ),
          backgroundColor: ColorTools.getMainColor(),
        ),

        body: body()
    );
  }

  /// Retourne le corps de la page avec la liste vers les différents sites.
  Widget body(){
    List<Widget> content = new List();
    String firstLetter = "";  // Première lettre du mot.
    bool fisrt = true;  // Permet de savoir si on a déjà affiché la première lettre ou non.

    // List names = Memory.getUser().getWebSiteName();
    // TODO Mettre en commentaire ici pour afficher la vraie liste. v
    List names = ["Item1", "Item2", "Item3", "Item4", "Jtem1", "Jtem2", "Jtem3", "Ktem1", "Ktem2", "Ktem3", "Ktem4", "Ktem5"];  // Stocke seulement les noms

    for (String name in names) {
      if (name[0] == firstLetter)  // Cas générale
        content.add(listTile(false, name));
      else  // Si on est sur la premiere ligne d'une lettre
        content.add(listTile(true, name));

      firstLetter = name[0];
    }

    return new ListView(
      children: content,
    );
  }

  Widget listTile(bool first, String text) {
    Widget ret;

    if (first) {
      ret = new Container(
        child: Row(
          children: <Widget>[
            Container(
              child: TextFactory.create(text[0], 20, TextType.TEXT, FontWeightType.MEDIUM),
              constraints: BoxConstraints(
                minHeight: ResponsiveTools.height(24),
                maxHeight: ResponsiveTools.height(24),
                minWidth: ResponsiveTools.width(24),
                maxWidth: ResponsiveTools.width(24)
              ),
            ),
            Container(
              child: TextFactory.create(text, 20, TextType.TEXT, FontWeightType.REGULAR),
              margin: EdgeInsets.only(left: 32),
            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(
            ResponsiveTools.width(16),
            ResponsiveTools.height(16),
            ResponsiveTools.width(16),
            ResponsiveTools.height(16)),
      );
    } else
      ret = new Container(
        child: Row(
          children: <Widget>[
            Container(
              child: TextFactory.create(" ", 20, TextType.TEXT, FontWeightType.REGULAR),
              constraints: BoxConstraints(
                  minHeight: ResponsiveTools.height(24),
                  maxHeight: ResponsiveTools.height(24),
                  minWidth: ResponsiveTools.width(24),
                  maxWidth: ResponsiveTools.width(24)
              ),
            ),
            Container(
              child: TextFactory.create(text, 20, TextType.TEXT, FontWeightType.REGULAR),
              margin: EdgeInsets.only(left: 32),
            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(
            ResponsiveTools.width(16),
            ResponsiveTools.height(16),
            ResponsiveTools.width(16),
            ResponsiveTools.height(16)),
      );

    return ret;
  }
}

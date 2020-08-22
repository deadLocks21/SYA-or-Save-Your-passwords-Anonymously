import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Windows/InformationWindow.dart';
import 'package:sya/ihm/Windows/WelcomeWindow.dart';


class MainWindow extends StatefulWidget {
  MainWindow({Key key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  List<Widget> content;

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: ResponsiveTools.height(48),
          title: Container(
            margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
            child: Text(
              "Bienvenue dans SYA",
              style: TextStyle(
                  fontSize: ResponsiveTools.textSize(20),
                  fontWeight: FontWeightType.MEDIUM,
                  color: ColorTools.getTitleColor()
              ),
            ),
          ),
          leading: Container(
            width: ResponsiveTools.height(36),
            child: IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: ColorTools.getTitleColor(),
                size: ResponsiveTools.height(24),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation,) => WelcomeWindow(),
                      transitionsBuilder: (
                          context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                          ) =>
                          ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                            child: child,
                          ),
                    )
                );
              },
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: ColorTools.getTitleColor(),
                  size: ResponsiveTools.height(24),
                )
            ),
            Container(
              width: ResponsiveTools.width(16),
            )
          ],
        ),

        floatingActionButton: Container(
          height: ResponsiveTools.height(36),
          child: FloatingActionButton.extended(
            onPressed: null,
            label: Text(
              "AJOUTER",
              style: TextStyle(
                fontSize: ResponsiveTools.textSize(20),
                color: ColorTools.getTitleColor()
              ),
            ),
            icon: Icon(
              Icons.add,
              size: ResponsiveTools.height(24),
              color: ColorTools.getTitleColor(),
            ),
            backgroundColor: ColorTools.getMainColor(),
          ),
        ),

        body: body()
    );
  }

  /// Retourne le corps de la page avec la liste vers les différents sites.
  Widget body(){
    content = new List();
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

  Widget listTile(bool first, String text) => FlatButton(
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
    onPressed: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => InformationWindow(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(1.0, 0.0);
              var end = Offset(0, 0);
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }
        )
      );
    },
  );
}

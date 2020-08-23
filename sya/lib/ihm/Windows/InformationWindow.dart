import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/MainWindow.dart';
import 'package:sya/logic/Website.dart';
import 'package:sya/logic/User.dart';

import 'WebsiteNameWindow.dart';


class InformationWindow extends StatefulWidget {
  Website website;

  InformationWindow({Key key, this.website}) : super(key: key);

  @override
  _InformationWindowState createState() => _InformationWindowState(website);
}

class _InformationWindowState extends State<InformationWindow> {
  Website website;

  _InformationWindowState(this.website);

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ResponsiveTools.height(48),
        title: Container(
          margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
          child: Text(
            "Informations",
            style: TextStyle(
                fontSize: ResponsiveTools.textSize(20),
                fontWeight: FontWeightType.MEDIUM,
                color: ColorTools.getTitleColor()
            ),
          ),
        ),
        leading:  Container(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: ColorTools.getTitleColor(),
              size: ResponsiveTools.height(24),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(32), top: ResponsiveTools.height(60)),
              width: ResponsiveTools.width(328),
              child: Text(
                website.name,
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(24),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(5)),
              width: ResponsiveTools.width(328),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(20),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(32), bottom: ResponsiveTools.height(32)),
              width: ResponsiveTools.width(328),
              child: Text(
                website.login,
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(16),
                    fontWeight: FontWeightType.REGULAR
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(5)),
              width: ResponsiveTools.width(328),
              child: Text(
                "Password",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(20),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(32), bottom: ResponsiveTools.height(40)),
              width: ResponsiveTools.width(328),
              child: Text(
                website.cryptedPassword, // website.decrypt(User.password), // TODO Décrypter le password.
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(16),
                    fontWeight: FontWeightType.REGULAR
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: ResponsiveTools.height(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: RRaisedButton(
                      "SUPPRIMER",
                      color: ColorTools.getGoBackColor(),
                      onPressed: () {
                        _showDeleteDialog();
                      },
                    ),
                    margin: EdgeInsets.only(right: ResponsiveTools.width(68)),
                  ),
                  RRaisedButton(
                    "MODIFIER",
                    color: ColorTools.getMainColor(),
                    onPressed: () {
                      Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => WebsiteNameWindow(website: website),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                var begin = Offset(0.0, 1.0);
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
                    }
                  )
                ],
              ),
            ),
            RedundantWidget.jokeBottom()
          ],
        ),
      )
    );
  }

  Future<void> _showDeleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimer ce site ?'),
          titleTextStyle: TextStyle(fontSize: ResponsiveTools.textSize(20), fontWeight: FontWeightType.MEDIUM, fontFamily: 'Roboto'),
          titlePadding: EdgeInsets.only(left: ResponsiveTools.width(24), top: ResponsiveTools.height(16), bottom: ResponsiveTools.height(12)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Si tu supprimes ce site, il sera',
                  style: TextStyle(
                      fontSize: ResponsiveTools.textSize(16)
                  )
                ),
                Text(
                  'impossible de le récupérer ...',
                  style: TextStyle(
                      fontSize: ResponsiveTools.textSize(16)
                  )
                ),
              ],
            ),
          ),
          contentTextStyle: TextStyle(fontSize: ResponsiveTools.textSize(16), fontWeight: FontWeightType.REGULAR, fontFamily: 'Roboto'),
          contentPadding: EdgeInsets.only(left: ResponsiveTools.width(24), right: ResponsiveTools.width(24), bottom: ResponsiveTools.height(8)),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'ANNULER',
                style: TextStyle(
                  fontSize: ResponsiveTools.textSize(14),
                  color: Color.fromARGB(0xFF, 0x80, 0xCB, 0xC4)
                )
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'SUPPRIMER',
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(14),
                    color: Color.fromARGB(0xFF, 0x80, 0xCB, 0xC4)
                )
              ),
              onPressed: () {
                Navigator.of(context).pop();Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation,) => MainWindow(),
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
            )
          ],
          buttonPadding: EdgeInsets.only(right: ResponsiveTools.width(16)),
          actionsPadding: EdgeInsets.only(bottom: ResponsiveTools.height(8)),
        );
      },
    );
  }
}

/*appBar: AppBar(
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
          margin: EdgeInsets.only(left: ResponsiveTools.width(8)),
          child: IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: ColorTools.getTitleColor(),
              size: ResponsiveTools.height(24),
            ),
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
      ),*/
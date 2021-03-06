import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/InformationWindow.dart';
import 'package:sya/ihm/Windows/WebsiteNameWindow.dart';
import 'package:sya/ihm/Windows/WelcomeWindow.dart';
import 'package:sya/logic/Website.dart';

import 'MainWindow.dart';
import 'WebsiteLoginWindow.dart';


class WebsitePasswordWindow extends StatefulWidget {
  Website website;

  WebsitePasswordWindow({Key key, this.website}) : super(key: key);

  @override
  _WebsitePasswordWindowState createState() => _WebsitePasswordWindowState(website);
}

class _WebsitePasswordWindowState extends State<WebsitePasswordWindow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimationIn;
  Animation<Offset> _offsetAnimationOut;
  bool enter = true;
  TextEditingController _tFController = TextEditingController();
  Website website;

  _WebsitePasswordWindowState(this.website);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward(from: 0);

    _offsetAnimationIn = Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOut = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tFController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);
    _tFController.text = website.cryptedPassword;  // TODO Décrypt

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: ResponsiveTools.height(48),
          title: Container(
            margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
            child: Text(
              website.id == null ? "Ajouter" : "Editer",
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
                Icons.arrow_downward,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SlideTransition(
                  position: enter ? _offsetAnimationIn : _offsetAnimationOut,
                  child: Container(
                    height: ResponsiveTools.height(200),
                    margin: EdgeInsets.only(
                        bottom: ResponsiveTools.height(149), top: ResponsiveTools.height(121)),
                    child: Column(
                      children: [
                        Container(
                          width: ResponsiveTools.width(328),
                          margin: EdgeInsets.only(
                              bottom: ResponsiveTools.height(36),
                              top: ResponsiveTools.height(77)),
                          child: TextField(
                            controller: _tFController,
                            style: TextStyle(
                                fontSize: ResponsiveTools.textSize(16)
                            ),
                            decoration: InputDecoration(
                                labelText: "Entre ton mot de passe."
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RRaisedButton(
                              "RETOUR",
                              color: ColorTools.getGoBackColor(),
                              onPressed: () async {
                                setState(() {
                                  enter = !enter;
                                });

                                await _controller.forward(from: 0);

                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => WebsiteLoginWindow(website: website, right: false,),
                                  ),
                                );
                              },
                            ),
                            Container(width: ResponsiveTools.width(54),),
                            RRaisedButton(
                              website.id == null ? "SAUVEGARDER" : "ENREGISTRER",
                              color: ColorTools.getMainColor(),
                              onPressed: () {
                                // website.id == null ? website.save() : website.add(); TODO Remmetre quand vrai info.

                                Navigator.pushReplacement(
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                RedundantWidget.jokeBottom()
              ],
            ),
          )
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

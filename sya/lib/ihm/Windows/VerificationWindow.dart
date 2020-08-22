import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/MainWindow.dart';
import 'package:sya/ihm/Windows/WelcomeWindow.dart';

class VerificationWindow extends StatefulWidget{
  VerificationWindow({Key key}) : super(key: key);

  @override
  _VerificationWindowState createState() => _VerificationWindowState();
}

class _VerificationWindowState extends State<VerificationWindow>
  with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimationIn;
  Animation<Offset> _offsetAnimationOut;
  bool enter = true;

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
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RedundantWidget.welcommeIntoSYA(),
                SlideTransition(
                  position: enter ? _offsetAnimationIn : _offsetAnimationOut,
                  child: Container(
                    height: ResponsiveTools.height(200),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: ResponsiveTools.height(36), top: ResponsiveTools.height(77)),
                            child: Text(
                              "Votre clé de vérification est\nxxxxxxxxxxxxxxxxxxxx",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ResponsiveTools.textSize(20),
                                fontWeight: FontWeightType.MEDIUM,
                              ),
                            )
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
                                    pageBuilder: (context, animation1, animation2) => WelcomeWindow(),
                                  ),
                                );
                              },
                            ),
                            Container(width: ResponsiveTools.width(54),),
                            RRaisedButton(
                              "CONNEXION",
                              color: ColorTools.getMainColor(),
                              onPressed: () {
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
                    margin: EdgeInsets.only(bottom: ResponsiveTools.height(149)),
                  ),
                ),
                RedundantWidget.jokeBottom()
              ],
            ),
          )
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page}) : super(
    pageBuilder: (context, animation, secondaryAnimation,) => page,
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
  );
}

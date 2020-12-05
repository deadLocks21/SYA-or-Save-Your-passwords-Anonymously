import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/InformationWindow.dart';
import 'package:sya/ihm/Windows/VerificationWindow.dart';

class WelcomeWindow extends StatefulWidget{
  WelcomeWindow({Key key}) : super(key: key);

  @override
  _WelcomeWindowState createState() => _WelcomeWindowState();
}

class _WelcomeWindowState extends State<WelcomeWindow>
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
      begin: Offset(-2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOut = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-2, 0),
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
                  child:Container(
                    height: ResponsiveTools.height(200),
                    margin: EdgeInsets.only(bottom: ResponsiveTools.height(149)),
                    child: Column(
                      children: [
                        Container(
                          width: ResponsiveTools.width(328),
                          margin: EdgeInsets.only(bottom: ResponsiveTools.height(36), top: ResponsiveTools.height(77)),
                          child: TextField(
                            style: TextStyle(
                                fontSize: ResponsiveTools.textSize(16)
                            ),
                            decoration: InputDecoration(
                                labelText: "Entrez votre mot de passe."
                            ),
                          ),
                        ),
                        RRaisedButton(
                          "CONNEXION",
                          color: ColorTools.getMainColor(),
                          onPressed: () async {
                            setState(() {
                              enter = !enter;
                            });
                            await _controller.forward(from: 0);

                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => VerificationWindow(),
                              ),
                            );
                          },
                        ),
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




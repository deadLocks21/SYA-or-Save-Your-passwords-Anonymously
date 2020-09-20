import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/Animator.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';

import 'VerificationWindow.dart';

class PasswordWindow extends StatefulWidget {
  bool right;

  PasswordWindow({Key key, this.right}) : super(key: key);

  @override
  _PasswordWindowState createState() => _PasswordWindowState(right: right);
}

class _PasswordWindowState extends State<PasswordWindow>
    with TickerProviderStateMixin {
  /// Object for control the differents animations.
  Animator animator;
  /// Value for the oppening of the UI
  bool right;

  _PasswordWindowState({this.right});


  @override
  void initState() {
    super.initState();

    animator = new Animator(AnimationController(duration: const Duration(seconds: 1), vsync: this), right: right != null ? right : true, enter: true);
    animator.play();
  }

  @override
  void dispose() {
    super.dispose();

    animator.disposeControler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeIntoSYA(),
                body(),
                JokeBottom()
              ],
            ),
          )
      ),
      resizeToAvoidBottomInset: false,
    );
  }


  /// Widgets for the body of the UI.
  SlideTransition body() {
    return SlideTransition(
      position: animator.animation(),
      child:Container(
        height: ResponsiveTools.height(200),
        margin: EdgeInsets.only(bottom: ResponsiveTools.height(149)),
        child: Column(
          children: [
            inputPassword(),
           connexionButton(),
          ],
        ),
      ),
    );
  }

  Container inputPassword() {
    return Container(
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
    );
  }

  RRaisedButton connexionButton() {
    return  RRaisedButton(
      "CONNEXION",
      color: ColorTools.getMainColor(),
      onPressed: () async {
        setState(() {
          animator.enter = false;
          animator.right = false;
        });

        await animator.play();

        connexionTransition();
      },
    );
  }


  /// Transition
  void connexionTransition() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => VerificationWindow(),
      ),
    );
  }
}

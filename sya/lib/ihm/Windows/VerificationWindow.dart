import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/Animator.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/MainWindow.dart';
import 'package:sya/ihm/Windows/PasswordWindow.dart';


class VerificationWindow extends StatefulWidget{
  VerificationWindow({Key key}) : super(key: key);

  @override
  _VerificationWindowState createState() => _VerificationWindowState();
}

class _VerificationWindowState extends State<VerificationWindow>
  with SingleTickerProviderStateMixin {
  /// Object for control the differents animations.
  Animator animator;
  /// Value for the oppening of the UI
  bool right;

  _VerificationWindowState({this.right});

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
    ResponsiveTools.initScreenUtils(context);

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
    );
  }


  /// Widgets for the body of the UI.
  SlideTransition body() {
    return SlideTransition(
      position: animator.animation(),
      child: Container(
        height: ResponsiveTools.height(200),
        child: Column(
          children: [
            displayVerifKey(),
            bottomButtons()
          ],
        ),
        margin: EdgeInsets.only(bottom: ResponsiveTools.height(149)),
      ),
    );
  }

  Container displayVerifKey() {
    return Container(
        margin: EdgeInsets.only(bottom: ResponsiveTools.height(36), top: ResponsiveTools.height(77)),
        child: Text(
          "Votre clé de vérification est\nxxxxxxxxxxxxxxxxxxxx",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ResponsiveTools.textSize(20),
            fontWeight: FontWeightType.MEDIUM,
          ),
        )
    );
  }

  Row bottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        returnButton(),
        Container(width: ResponsiveTools.width(54),),
        connexionButton(),
      ],
    );
  }

  RRaisedButton returnButton() {
    return RRaisedButton(
      "RETOUR",
      color: ColorTools.getGoBackColor(),
      onPressed: () async {
        setState(() {
          animator.enter = false;
        });

        await animator.play();

        returnTransition();
      },
    );
  }

  RRaisedButton connexionButton() {
    return RRaisedButton(
      "CONNEXION",
      color: ColorTools.getMainColor(),
      onPressed: () {
        connexionTransition();
      },
    );
  }


  /// Transitions
  void returnTransition() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => PasswordWindow(right: false,),
      ),
    );
  }

  void connexionTransition() {
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
  }
}

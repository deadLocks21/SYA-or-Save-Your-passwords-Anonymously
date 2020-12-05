import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/IntroductionExplicationWindow.dart';

class IntroductionIntentWindow extends StatefulWidget {
  IntroductionIntentWindow({Key key}) : super(key: key);

  @override
  _IntroductionIntentWindowState createState() => _IntroductionIntentWindowState();
}

class _IntroductionIntentWindowState extends State<IntroductionIntentWindow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: ResponsiveTools.height(77)),
              height: ResponsiveTools.height(44),
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: ResponsiveTools.textSize(24),
                        color: const Color(0xb3ffffff),
                      ),
                      children: [
                        TextSpan(
                          text: 'Bienvenu dans SYA\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '(Save Your password Anonymously)',
                          style: TextStyle(
                            fontSize: ResponsiveTools.textSize(20),
                            color: const Color(0x4dffffff),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Je te propose ici de sécuriser l’intégralité de tes mots de passe dans cette application. Tu me demanderas sûrement pourquoi cette application et pas une autre et tu as raison de te poser cette question. J’ai développé cette application dans le but de sécuriser les mots de passes de la femme que j’aime. Donc mon but est bien de construire quelque chose d’inviolable. La base de données contient seulement des valeurs cryptés (seulement les mots de passes). Elle reste en local sur le téléphone. J’ai fait mon maximum pour limiter les risques.",
                      style: TextStyle(
                        fontWeight: FontWeightType.REGULAR,
                        fontSize: ResponsiveTools.textSize(18),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.only(top: ResponsiveTools.height(24), bottom: ResponsiveTools.height(16)),
                    width: ResponsiveTools.width(320),
                  ),
                  RRaisedButton(
                    "CONTINUER",
                    color: ColorTools.getMainColor(),
                    onPressed: () async {
                      await _controller.forward(from: 0);

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => IntroductionExplicationWindow(),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

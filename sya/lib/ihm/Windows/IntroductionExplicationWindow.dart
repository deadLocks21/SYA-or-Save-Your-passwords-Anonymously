import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Windows/IntroductionExplicationWindow.dart';

class IntroductionExplicationWindow extends StatefulWidget {
  IntroductionExplicationWindow({Key key}) : super(key: key);

  @override
  _IntroductionExplicationWindowState createState() => _IntroductionExplicationWindowState();
}

class _IntroductionExplicationWindowState extends State<IntroductionExplicationWindow>
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
              position: enter ? _offsetAnimationIn : _offsetAnimationOut,
              child: Container(
                child: Text(
                  "Cette application fonctionne d’une manière assez inhabituelle. Tu n’auras besoin que d’un mot de passe de plus de 30 caractères. Il peut s’agir d’une phrase avec de la ponctuation et des chiffres, ou alors d’une suite que toi seul connaît à toi de voir. Mais une fois ce mot de passe rentré, une clé de vérification que tu auras renseigné sera décrypte avec le mot de passe et tu devras alors valider si c’est bien la clé que tu as renseigné pour vérifier si le mot de passe est bon. Le mot de passe n’est pas stocké dans à toi de bien le conserver. Mais trêve de bavardages, je te laisse commencer à renseigné le mot de passe et la clé ^^",
                  style: TextStyle(
                    fontWeight: FontWeightType.REGULAR,
                    fontSize: ResponsiveTools.textSize(18),
                  ),
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: ResponsiveTools.height(24)),
                width: ResponsiveTools.width(320),
              ),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: ResponsiveTools.height(36),
        child: FloatingActionButton.extended(
          onPressed: () async {
            setState(() {
              enter = !enter;
            });

            await _controller.forward(from: 0);

            /*Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => IntroductionExplicationWindow(),
              ),
            );*/
          },
          label: Row(
            children: [
              Text(
                "CONTINUER",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(20),
                    color: ColorTools.getTitleColor()
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: ResponsiveTools.height(24),
                color: ColorTools.getTitleColor(),
              ),
            ],
          ),
          backgroundColor: ColorTools.getMainColor(),
        ),
      ),
    );
  }
}

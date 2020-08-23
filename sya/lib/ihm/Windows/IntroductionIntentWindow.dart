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


class IntroductionIntentWindow extends StatefulWidget {
  IntroductionIntentWindow({Key key}) : super(key: key);

  @override
  _IntroductionIntentWindowState createState() => _IntroductionIntentWindowState();
}

class _IntroductionIntentWindowState extends State<IntroductionIntentWindow> {
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
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: ResponsiveTools.height(8)),
                    child: Text(
                      "Je te propose ici de sécuriser l’intégralité de tes mots de passe dans cette application. Tu me demanderas sûrement pourquoi cette application et pas une autre et tu as raison de te poser cette question. J’ai développé cette application dans le but de sécuriser les mots de passes de la femme que j’aime. Donc mon but est bien de construire quelque chose d’inviolable. La base de données contient seulement des valeurs cryptés (seulement les mots de passes). Elle reste en local sur le téléphone. J’ai fait mon maximum pour limiter les risques.",
                      style: TextStyle(
                        fontWeight: FontWeightType.REGULAR,
                        fontSize: ResponsiveTools.textSize(18),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: ResponsiveTools.height(16)),
              width: ResponsiveTools.width(320),
            ),
          ],
        ),
    ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: ResponsiveTools.height(36),
        child: FloatingActionButton.extended(
          onPressed: () {

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

/*
Text.rich(
TextSpan(
children: [


,
TextSpan(
text: "\n",
style: TextStyle(
fontWeight: FontWeightType.MEDIUM,
fontSize: ResponsiveTools.textSize(14)
)
),
TextSpan(
text: "Je te propose ici de sécuriser l’intégralité de tes mots de passe dans cette application. Tu me demanderas sûrement pourquoi cette application et pas une autre et tu as raison de te poser cette question. J’ai développé cette application dans le but de sécuriser les mots de passes de la femme que j’aime. Donc mon but est bien de construire quelque chose d’inviolable. La base de données contient seulement des valeurs cryptés (seulement les mots de passes). Elle reste en local sur le téléphone. J’ai fait mon maximum pour limiter les risques.",
style: TextStyle(
fontWeight: FontWeightType.REGULAR,
fontSize: ResponsiveTools.textSize(16),
)
)
]
)
)*/

import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightFactory.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';

class VerificationWindow extends StatefulWidget{
  VerificationWindow({Key key}) : super(key: key);

  @override
  _VerificationWindowState createState() => _VerificationWindowState();
}

class _VerificationWindowState extends State<VerificationWindow> {
  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RedundantWidget.welcommeIntoSYA(),
                Container(
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
                            fontWeight: FontWeightFactory.create(FontWeightType.MEDIUM),
                          ),
                        )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RRaisedButton(
                            "RETOUR",
                            color: ColorTools.getGoBackColor(),
                            onPressed: () {print(ResponsiveTools.factorHeight());},
                          ),
                          Container(width: ResponsiveTools.width(54),),
                          RRaisedButton(
                            "CONNEXION",
                            color: ColorTools.getMainColor(),
                            onPressed: () {print(ResponsiveTools.factorHeight());},
                          ),
                        ],
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: ResponsiveTools.height(149)),
                ),
                RedundantWidget.jokeBottom()
              ],
            ),
          )
      ),
    );
  }

}

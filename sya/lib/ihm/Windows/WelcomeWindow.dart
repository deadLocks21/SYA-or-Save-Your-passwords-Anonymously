import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';

class WelcomeWindow extends StatefulWidget{
  WelcomeWindow({Key key}) : super(key: key);

  @override
  _WelcomeWindowState createState() => _WelcomeWindowState();
}

class _WelcomeWindowState extends State<WelcomeWindow> {
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
                        onPressed: () {print(ResponsiveTools.factorHeight());},),
                    ],
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';


class InformationWindow extends StatefulWidget {
  InformationWindow({Key key}) : super(key: key);

  @override
  _InformationWindowState createState() => _InformationWindowState();
}

class _InformationWindowState extends State<InformationWindow> {
  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ResponsiveTools.height(48),
        title: Container(
          margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
          child: Text(
            "Informations",
            style: TextStyle(
                fontSize: ResponsiveTools.textSize(20),
                fontWeight: FontWeightType.MEDIUM,
                color: ColorTools.getTitleColor()
            ),
          ),
        ),
        leading:  Container(
          margin: EdgeInsets.only(left: ResponsiveTools.width(8)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(32), top: ResponsiveTools.height(60)),
              width: ResponsiveTools.width(328),
              child: Text(
                "Site Web n°1",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(24),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(5)),
              width: ResponsiveTools.width(328),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(20),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(32), bottom: ResponsiveTools.height(32)),
              width: ResponsiveTools.width(328),
              child: Text(
                "mail@mail.com",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(16),
                    fontWeight: FontWeightType.REGULAR
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(16), bottom: ResponsiveTools.height(5)),
              width: ResponsiveTools.width(328),
              child: Text(
                "Password",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(20),
                    fontWeight: FontWeightType.MEDIUM
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ResponsiveTools.width(32), bottom: ResponsiveTools.height(40)),
              width: ResponsiveTools.width(328),
              child: Text(
                "etCoucou",
                style: TextStyle(
                    fontSize: ResponsiveTools.textSize(16),
                    fontWeight: FontWeightType.REGULAR
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: ResponsiveTools.height(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: RRaisedButton(
                      "SUPPRIMER",
                      color: ColorTools.getGoBackColor(),
                      onPressed: () {},
                    ),
                    margin: EdgeInsets.only(right: ResponsiveTools.width(68)),
                  ),
                  RRaisedButton(
                    "MODIFIER",
                    color: ColorTools.getMainColor(),
                    onPressed: () {}
                  )
                ],
              ),
            ),
            RedundantWidget.jokeBottom()
          ],
        ),
      )
    );
  }
}

/*appBar: AppBar(
        toolbarHeight: ResponsiveTools.height(48),
        title: Container(
          margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
          child: Text(
            "Bienvenue dans SYA",
            style: TextStyle(
                fontSize: ResponsiveTools.textSize(20),
                fontWeight: FontWeightType.MEDIUM,
                color: ColorTools.getTitleColor()
            ),
          ),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: ResponsiveTools.width(8)),
          child: IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: ColorTools.getTitleColor(),
              size: ResponsiveTools.height(24),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: ColorTools.getTitleColor(),
                size: ResponsiveTools.height(24),
              )
          ),
          Container(
            width: ResponsiveTools.width(16),
          )
        ],
      ),*/
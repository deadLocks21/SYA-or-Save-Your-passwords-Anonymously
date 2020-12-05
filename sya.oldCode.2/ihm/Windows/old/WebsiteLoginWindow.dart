import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/InformationWindow.dart';
import 'package:sya/ihm/Windows/WebsiteNameWindow.dart';
import 'package:sya/ihm/Windows/WebsitePasswordWindow.dart';
import 'package:sya/ihm/Windows/WelcomeWindow.dart';
import 'package:sya/logic/Website.dart';


class WebsiteLoginWindow extends StatefulWidget {
  Website website;
  bool right;

  WebsiteLoginWindow({Key key, this.website, this.right}) : super(key: key);

  @override
  _WebsiteLoginWindowState createState() => _WebsiteLoginWindowState(website, right);
}

class _WebsiteLoginWindowState extends State<WebsiteLoginWindow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimationInL;
  Animation<Offset> _offsetAnimationInR;
  Animation<Offset> _offsetAnimationOutL;
  Animation<Offset> _offsetAnimationOutR;
  bool enter = true;
  bool right;
  TextEditingController _tFController = TextEditingController();
  Website website;

  _WebsiteLoginWindowState(this.website, this.right);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward(from: 0);

    _offsetAnimationInR = Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationInL = Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOutR = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(2, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));

    _offsetAnimationOutL = Tween<Offset>(
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
    _tFController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);
    _tFController.text = website.login;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: ResponsiveTools.height(48),
          title: Container(
            margin: EdgeInsets.only(left: ResponsiveTools.width(32)),
            child: Text(
              website.id == null ? "Ajouter" : "Editer",
              style: TextStyle(
                  fontSize: ResponsiveTools.textSize(20),
                  fontWeight: FontWeightType.MEDIUM,
                  color: ColorTools.getTitleColor()
              ),
            ),
          ),
          leading:  Container(
            child: IconButton(
              icon: Icon(
                Icons.arrow_downward,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SlideTransition(
                  position: enter ? (right ? _offsetAnimationInR : _offsetAnimationInL)  : (right ? _offsetAnimationOutR : _offsetAnimationOutL),
                  child: Container(
                    height: ResponsiveTools.height(200),
                    margin: EdgeInsets.only(
                        bottom: ResponsiveTools.height(149), top: ResponsiveTools.height(121)),
                    child: Column(
                      children: [
                        Container(
                          width: ResponsiveTools.width(328),
                          margin: EdgeInsets.only(
                              bottom: ResponsiveTools.height(36),
                              top: ResponsiveTools.height(77)),
                          child: TextField(
                            controller: _tFController,
                            style: TextStyle(
                                fontSize: ResponsiveTools.textSize(16)
                            ),
                            decoration: InputDecoration(
                                labelText: "Entre ton login du site web."
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RRaisedButton(
                              "RETOUR",
                              color: ColorTools.getGoBackColor(),
                              onPressed: () async {
                                this.right = true;

                                setState(() {
                                  enter = !enter;
                                });

                                await _controller.forward(from: 0);

                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => WebsiteNameWindow(website: website,),
                                  ),
                                );
                              },
                            ),
                            Container(width: ResponsiveTools.width(54),),
                            RRaisedButton(
                              "CONTINUER",
                              color: ColorTools.getMainColor(),
                              onPressed: () async {
                                this.right = false;

                                setState(() {
                                  enter = !enter;
                                });

                                await _controller.forward(from: 0);

                                website.login = _tFController.text;

                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => WebsitePasswordWindow(website: website,),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
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

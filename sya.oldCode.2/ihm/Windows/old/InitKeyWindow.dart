import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/database/WebsitesDao.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/InitPasswordWindow.dart';
import 'package:sya/logic/User.dart';
import 'package:sya/logic/Website.dart';

import 'InitPasswordConfirmWindow.dart';

class InitKeyWindow extends StatefulWidget {
  bool right;
  String theKey;

  InitKeyWindow({Key key, this.right, this.theKey}) : super(key: key);

  @override
  _InitKeyWindowState createState() => _InitKeyWindowState(right, theKey);
}

class _InitKeyWindowState extends State<InitKeyWindow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _tFController = TextEditingController();
  Animation<Offset> _offsetAnimationInL;
  Animation<Offset> _offsetAnimationInR;
  Animation<Offset> _offsetAnimationOutL;
  Animation<Offset> _offsetAnimationOutR;
  final _formKey = GlobalKey<FormState>();
  bool enter = true;
  bool go = false;
  bool right;
  String theKey;

  _InitKeyWindowState(this.right, this.theKey);

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
  }

  @override
  Widget build(BuildContext context)  {
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
              position: enter ? (right ? _offsetAnimationInR : _offsetAnimationInL)  : (right ? _offsetAnimationOutR : _offsetAnimationOutL),
              child: Column(
                children: [
                  Container(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _tFController,
                        style: TextStyle(
                            fontSize: ResponsiveTools.textSize(16)
                        ),
                        decoration: InputDecoration(
                            labelText: "Entre ta clé de vérification.",
                            errorStyle: TextStyle(
                                fontSize: ResponsiveTools.textSize(12)
                            )
                        ),
                        validator: (value) {
                          if (value.length < 8) {
                            return "La clé doit contenir minimum 8 caractères.";
                          }
                          return null;
                        },
                      ),
                    ),
                    margin: EdgeInsets.only(top: ResponsiveTools.height(24), bottom: ResponsiveTools.height(16)),
                    width: ResponsiveTools.width(320),
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
                              pageBuilder: (context, animation1, animation2) => InitPasswordConfirmWindow(right: false),
                            ),
                          );
                        },
                      ),
                      Container(width: ResponsiveTools.width(54),),
                      RRaisedButton(
                          "CONTINUER",
                          color: ColorTools.getMainColor(),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                enter = !enter;
                                right = false;
                              });

                              Website website = new Website(id: 0);
                              website.crypt(_tFController.text, User.password);
                              await website.add();
                              await _controller.forward(from: 0);

                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => InitKeyWindow(right: false,),
                                ),
                              );
                            }
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
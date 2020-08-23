import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/logic/User.dart';

class InitPasswordWindow extends StatefulWidget {
  InitPasswordWindow({Key key}) : super(key: key);

  @override
  _InitPasswordWindowState createState() => _InitPasswordWindowState();
}

class _InitPasswordWindowState extends State<InitPasswordWindow>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController _tFController = TextEditingController();
  Animation<Offset> _offsetAnimationIn;
  Animation<Offset> _offsetAnimationOut;
  final _formKey = GlobalKey<FormState>();
  bool enter = true;
  bool go = false;

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
                            labelText: "Entre ton mot de passe.",
                            errorText: validatePassword(_tFController.text)
                        ),
                        validator: (value) {
                          if (!value.contains(new RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{32,}$"))) {
                            return "Doit contenir au moins une majuscule, une minuscule, un chiffre et un caractère spéciale.";
                          }
                          return null;
                        },
                      ),
                    ),
                    margin: EdgeInsets.only(top: ResponsiveTools.height(24), bottom: ResponsiveTools.height(16)),
                    width: ResponsiveTools.width(320),
                  ),
                  RRaisedButton(
                    "CONTINUER",
                    color: ColorTools.getMainColor(),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        User.password = _tFController.text;

                        setState(() {
                          enter = !enter;
                        });

                        await _controller.forward(from: 0);

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => InitPasswordWindow(),
                          ),
                        );
                      }
                      /**/
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validatePassword(String value) {

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/Animator.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';
import 'package:sya/ihm/Windows/AddLoginWindow.dart';
import 'package:sya/logic/Website.dart';


class AddNameWindow extends StatefulWidget {
  Website website;
  bool right;

  AddNameWindow({Key key, this.website, this.right}) : super(key: key);

  @override
  _AddNameWindowState createState() => _AddNameWindowState(website, right);
}

class _AddNameWindowState extends State<AddNameWindow>
    with SingleTickerProviderStateMixin {
  Animator animator;
  TextEditingController _tFController = TextEditingController();
  Website website;
  bool right;


  _AddNameWindowState(this.website, this.right);

  @override
  void initState() {
    super.initState();

    animator = Animator(AnimationController(duration: const Duration(seconds: 1), vsync: this,), right: right);
    animator.play();
  }

  @override
  void dispose() {
    super.dispose();
    animator.disposeControler();
    _tFController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);
    _tFController.text = website.name;

    return Scaffold(
      appBar: appBar(),
      body: body(),
      resizeToAvoidBottomInset: false,
    );
  }


  /// Widgets
  Widget appBar() {
    return AppBar(
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
    );
  }

  Widget body() {
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SlideTransition(
                position: animator.animation(),
                child: Container(
                  height: ResponsiveTools.height(200),
                  margin: EdgeInsets.only(
                      bottom: ResponsiveTools.height(149), top: ResponsiveTools.height(121)),
                  child: Column(
                    children: [
                      infoName(),
                      acceptButton(),
                    ],
                  ),
                ),
              ),
              JokeBottom()
            ],
          ),
        )
    );
  }

  Widget infoName() {
    return Container(
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
            labelText: "Entre le nom du site."
        ),
      ),
    );
  }

  Widget acceptButton() {
    return RRaisedButton(
      "CONTINUER",
      color: ColorTools.getMainColor(),
      onPressed: () async {
        setState(() {
          animator.enter = false;
        });

        await animator.play();

        website.name = _tFController.text;

        continueTransition();
      },
    );
  }


  /// Transition
  void continueTransition() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => AddLoginWindow(website: website, right: true,),
      ),
    );
  }
}

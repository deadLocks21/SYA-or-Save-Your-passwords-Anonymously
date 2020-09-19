import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/RedundantWidget.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class OpenWindow extends StatefulWidget {
  OpenWindow({Key key}) : super(key: key);

  @override
  _OpenWindowState createState() => _OpenWindowState();
}

class _OpenWindowState extends State<OpenWindow> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> alpha;
  Animation<double> beta;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);


    alpha = Tween(begin: 80.0, end: 346.0).animate(controller)
      ..addListener(() {setState(() {});});

    beta = Tween(begin: 25.0, end: 77.0).animate(controller)
      ..addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          await controller.forward();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WelcomeIntoSYA(edgeTop: beta.value),
              Container(
                height: ResponsiveTools.height(alpha.value),
              ),
              JokeBottom()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }
}

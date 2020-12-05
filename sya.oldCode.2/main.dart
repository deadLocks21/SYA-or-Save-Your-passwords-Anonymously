import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ihm/Windows/MainWindow.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      // home: MyHomePage(),
      home: MainWindow(),
      // home: WebsitNameWindow(website: new Website(id: null),),
      // home: IntroductionIntentWindow(),
      theme: ThemeData.dark(),
    );
  }
}

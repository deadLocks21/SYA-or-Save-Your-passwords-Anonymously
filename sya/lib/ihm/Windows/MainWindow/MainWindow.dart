import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Windows/MainWindow/AppBarActions.dart';
import 'package:sya/ihm/Windows/MainWindow/AppBarLeading.dart';
import 'package:sya/ihm/Windows/MainWindow/AppBarTitle.dart';
import 'package:sya/ihm/Windows/MainWindow/Body.dart';
import 'package:sya/ihm/Windows/MainWindow/FAB.dart';


class MainWindow extends StatefulWidget {
  MainWindow({Key key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  List<Widget> content;

  @override
  Widget build(BuildContext context) {
    ResponsiveTools.initScreenUtils(context);

    return Scaffold(
      appBar: appBar(),
      floatingActionButton: FAB(),
      body: Body()
    );
  }

  Widget appBar() =>
  AppBar(
    toolbarHeight: ResponsiveTools.height(48),
    title: AppBarTitle(),
    leading: AppBarLeading(),
    actions: <Widget>[ AppBarActions() ],
  );
}
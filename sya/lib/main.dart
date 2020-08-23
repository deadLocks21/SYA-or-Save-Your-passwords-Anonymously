import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sya/database/DaoMaster.dart';
import 'package:sya/database/WebsitesDao.dart';
import 'package:sya/ihm/Windows/InformationWindow.dart';
import 'package:sya/ihm/Windows/MainWindow.dart';
import 'package:sya/ihm/Windows/WebsiteNameWindow.dart';
import 'package:sya/ihm/Windows/WelcomeWindow.dart';
import 'package:sya/logic/Website.dart';

import 'database/MemoryDao.dart';
import 'ihm/Tools/ResponsiveTools.dart';
import 'ihm/Windows/VerificationWindow.dart';


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
      home: WelcomeWindow(),
      // home: WebsitNameWindow(website: new Website(id: null),),
      theme: ThemeData.dark(),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Add a website"),
              onPressed: () async {await (new Website(1, "name", "login", "cryptedPassword")).add();},
            ),
            RaisedButton(
              child: Text("Get websites"),
              onPressed: () async {print(await WebsitesDao.getWebsites());},
            ),
            RaisedButton(
              child: Text("Modify a website"),
              onPressed: () async {await (new Website(1, "name", "login", "crypted")).save();},
            ),
            RaisedButton(
              child: Text("Delete the table"),
              onPressed: () async {
//DaoMaster.delete("WebSite");
await DaoMaster.open();
await DaoMaster.db.execute("DROP TABLE IF EXISTS Website");
await DaoMaster.db.execute("CREATE TABLE IF NOT EXISTS Website(name TEXT, login TEXT, cryptedPassword TEXT)");
await DaoMaster.close();
              },
            )
          ],
        ),
      ),
    );
  }
}
*/

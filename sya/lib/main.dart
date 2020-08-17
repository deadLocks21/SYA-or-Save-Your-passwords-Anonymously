import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sya/database/DaoMaster.dart';
import 'package:sya/database/WebsitesDao.dart';
import 'package:sya/logic/Website.dart';

import 'database/MemoryDao.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

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
              onPressed: () async {await WebsitesDao.addAWebsite(new Website(1, "name", "login", "cryptedPassword"));},
            ),
            RaisedButton(
              child: Text("Get a website"),
              onPressed: () async {print(await WebsitesDao.getWebsites());},
            ),
            RaisedButton(
              child: Text("Delete the table"),
              onPressed: () async {DaoMaster.delete("WebSite");},
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              child: Text("Change theme"),
              onPressed: () async {await MemoryDao.changeTheme("light");},
            ),
            RaisedButton(
              child: Text("Print theme"),
              onPressed: () async {print(await MemoryDao.getTheme());},
            )
          ],
        ),
      ),
    );
  }
}

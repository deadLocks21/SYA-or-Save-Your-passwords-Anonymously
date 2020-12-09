import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class FAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
  Container(
    margin: EdgeInsets.only(right: ResponsiveTools.width(16), bottom: ResponsiveTools.height(16)),
    height: ResponsiveTools.height(36),
    child: FloatingActionButton.extended(
      onPressed: null,
      label: Text(
        "AJOUTER",
        style: TextStyle(
            fontSize: ResponsiveTools.textSize(20),
            color: ColorTools.getTitleColor()
        ),
      ),
      icon: Icon(
        Icons.add,
        size: ResponsiveTools.height(24),
        color: ColorTools.getTitleColor(),
      ),
      backgroundColor: ColorTools.getMainColor(),
    ),
  );
}
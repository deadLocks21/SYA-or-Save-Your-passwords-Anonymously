import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class RRaisedButton extends RaisedButton {
  String text;
  Color color;
  VoidCallback onPressed;

  RRaisedButton(this.text, {this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4*ResponsiveTools.factorHeight())),
      padding: EdgeInsets.all(0),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: ResponsiveTools.height(9), horizontal: ResponsiveTools.width(16)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: ResponsiveTools.textSize(14)
            ),)
      ),
      color: color,
      onPressed: onPressed,
    );
  }
}
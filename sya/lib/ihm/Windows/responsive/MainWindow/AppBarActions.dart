import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
  Container(
    margin: EdgeInsets.only(right: ResponsiveTools.width(16)),
    child: IconButton(
      onPressed: null,
      icon: Icon(
        Icons.more_vert,
        color: ColorTools.getTitleColor(),
        size: ResponsiveTools.height(24),
      )
    ),
  );

}
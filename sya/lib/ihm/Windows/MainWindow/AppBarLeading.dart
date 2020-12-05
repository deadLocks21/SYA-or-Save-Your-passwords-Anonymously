import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class AppBarLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
  Container(
    width: ResponsiveTools.height(36),
    child: IconButton(
      icon: Icon(
        Icons.power_settings_new,
        color: ColorTools.getTitleColor(),
        size: ResponsiveTools.height(24),
      ),
      onPressed: null,
    ),
  );

}
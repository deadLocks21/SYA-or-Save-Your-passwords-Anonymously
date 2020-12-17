import 'package:flutter/widgets.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => 
  Container(
    margin: EdgeInsets.only(left: ResponsiveTools.width(16)),
    child: Text(
      "Bienvenue dans SYA",
      style: TextStyle(
          fontSize: ResponsiveTools.textSize(20),
          fontWeight: FontWeightType.MEDIUM,
          color: ColorTools.getTitleColor()
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/ColorTools.dart';
import 'package:sya/ihm/Tools/FontWeightFactory.dart';
import 'package:sya/ihm/Tools/ResponsiveTools.dart';
import 'package:sya/ihm/Tools/TextType.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';

class TextFactory {
  static Text create(String s, double size, TextType textType, FontWeightType fontWeightType) {
    Text ret;

    switch (textType) {
      case TextType.TEXT:
        ret = new Text(
          s,
          style: TextStyle(
              fontWeight: FontWeightFactory.create(fontWeightType),
              fontSize: ResponsiveTools.textSize(size),
              color: ColorTools.getTextColor(),
              inherit: false)
        );
        break;

      case TextType.TITLE:
        ret = new Text(
            s,
            style: TextStyle(
                fontWeight: FontWeightFactory.create(fontWeightType),
                fontSize: ResponsiveTools.textSize(size),
                color: ColorTools.getTitleColor(),
                inherit: false)
        );
        break;
    }

    return ret;
  }
}
import 'package:flutter/material.dart';
import 'package:sya/ihm/Tools/FontWeightType.dart';

class FontWeightFactory {
  static FontWeight create(FontWeightType fontWeightType) {
    FontWeight ret;

    switch (fontWeightType) {
      case FontWeightType.THIN:
        ret = FontWeight.w100;
        break;
      case FontWeightType.LIGHT:
        ret = FontWeight.w300;
        break;
      case FontWeightType.REGULAR:
        ret = FontWeight.w400;
        break;
      case FontWeightType.MEDIUM:
        ret = FontWeight.w500;
        break;
      case FontWeightType.BOLD:
        ret = FontWeight.w700;
        break;
      case FontWeightType.BLACK:
        ret = FontWeight.w900;
        break;
    }

    return ret;
  }
}
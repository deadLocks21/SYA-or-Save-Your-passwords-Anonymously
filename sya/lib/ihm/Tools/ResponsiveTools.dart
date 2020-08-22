import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Outils pour la gestion du responsive dans l'application.
class ResponsiveTools {
  /// Initialise ScreenUtils.
  static void initScreenUtils(context) => ScreenUtil.init(context, width : 360, height : 640, allowFontScaling: true);

  /// Retourne la taille du texte.
  static double textSize(double size) => ScreenUtil().setSp(size);

  /// Retourne la nouvelle largeur d'un élement.
  static double width(double width) => ScreenUtil().setWidth(width);

  /// Retourne la nouvelle hauteur d'un élement.
  static double height(double height) => ScreenUtil().setHeight(height);

  static double factorHeight() => ScreenUtil().scaleHeight;
}
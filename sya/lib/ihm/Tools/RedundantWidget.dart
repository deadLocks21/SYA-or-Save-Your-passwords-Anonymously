import 'package:flutter/material.dart';
import 'package:sya/ihm/Widgets/RRaisedButton.dart';

import 'ColorTools.dart';
import 'ResponsiveTools.dart';

class RedundantWidget {
  static Widget welcommeIntoSYA() => Container(
      margin: EdgeInsets.only(top: ResponsiveTools.height(77)),
      height: ResponsiveTools.height(44),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: ResponsiveTools.textSize(20),
                color: const Color(0xb3ffffff),
              ),
              children: [
                TextSpan(
                  text: 'Bienvenu dans SYA\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '(Save Your password Anonymously)',
                  style: TextStyle(
                    fontSize: ResponsiveTools.textSize(16),
                    color: const Color(0x4dffffff),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  static Widget jokeBottom() => Container(
    height: ResponsiveTools.height(48),
    child: Text(
      'Un Mot de passe pour les gouverner tous.\nUn Mot de passe pour tous les retrouver.',
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: ResponsiveTools.textSize(16),
        color: const Color(0x4dffffff),
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
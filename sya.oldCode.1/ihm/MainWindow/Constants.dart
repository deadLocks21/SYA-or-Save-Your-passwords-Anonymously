import 'package:flutter/material.dart';

/// Classe stockant les constantes de la MainWindow.
class Constants {
  /// Retourne l'icone de déconnexion.
  static IconData get logoutIcon => Icons.power_settings_new;

  /// Retourne l'icone des paramètres.
  static IconData get settingsIcon => Icons.more_vert;

  /// Retourne l'icone pour ajouter un site web.
  static IconData get addIcon => Icons.add;

  /// Retourne le texte pour ajouter un site.
  static String get addText => "AJOUTER";

  /// Retourne le texte de l'Appbar
  static String get appbarText => "Bienvenue dans SYA";
}
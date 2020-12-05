import 'package:sya/logic/Website.dart';

/// Stores the websites
class WebsiteDirectory {
  /// Conatians the websites
  List<Website> websites = new List();

  /// Adds the websites
  void add(Website w) => websites.add(w); 
}
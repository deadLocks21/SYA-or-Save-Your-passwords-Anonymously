import 'package:sya/logic/User.dart';

/// Manage the data of the users
class UserDao {
  /// Verifies data integrity
  bool goodData(String login, String password) {
    throw new Exception("Function database.UserDao.goodData(String login, String password) is empty.");
  }

  User getUser(String login, String password) {
    throw new Exception("Function database.UserDao.getUser(String login, String password) is empty.");
  }
}
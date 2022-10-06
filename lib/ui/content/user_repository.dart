// In this class, im gonna store all the users, and make some useful
// methods for comparing and stuff

import 'package:flutter_application_2/ui/content/user.dart';

class UserRepository {
  List<User> users = List.empty(growable: true);

  UserRepository() {
    users.add(User('Dave', 'sandresmurillo@unicesar.edu.co', 'sisoy'));
  }

  bool addUser(User user) {
    bool result = true;
    if (users.isNotEmpty) {
      for (var userInUsers in users) {
        if (userInUsers.email == user.email) {
          return false;
        }
      }
    }
    users.add(user);
    return result;
  }

  User? validateUser(User user) {
    if (users.isNotEmpty) {
      for (var userInUsers in users) {
        if (userInUsers.email == user.email &&
            userInUsers.password == user.password) {
          return userInUsers;
        }
      }
    }
    return null;
  }
}

import 'package:flutter/material.dart';

import '/models/models.dart';

class AuthService with ChangeNotifier {
  static List<User> users = [
    User(email: 'joe@black.lk', password: 'Jo45*78'),
    User(email: 'amal@acme.lk', password: 'La79*!_io'),
    User(email: 'peter@pan.lk', password: 'Nap42-24'),
    User(email: 'a@g.com', password: '12345'),
  ];

  User localUser = User(email: '', password: '');

  bool get isAuth {
    return (localUser.email.isNotEmpty && localUser.password.isNotEmpty);
  }

  void authenticateUser({required String username, required String password}) {
    for (var user in users) {
      if (user.email == username && user.password == password) {
        localUser = user;
      }
    }
    notifyListeners();
  }

  void logout() {
    localUser = User(email: '', password: '');
    notifyListeners();
  }
}

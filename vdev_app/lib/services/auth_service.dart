import 'package:flutter/material.dart';

import '/models/models.dart';

class AuthService with ChangeNotifier {
  static List<User> users = [
    User(email: 'joe@black.com', password: 'Jo45*78'),
    User(email: 'anal@acme.com', password: 'La79*!_io'),
    User(email: 'peter@pan.com', password: 'Nap42-24'),
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
}

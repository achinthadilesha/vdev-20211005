import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vdev_app/models/user.dart';
import 'package:vdev_app/services/services.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProxyProvider<AuthService, ProductService>(
          create: (context) => ProductService(User(email: '', password: '')),
          update: (context, auth, _) => ProductService(
            auth.localUser,
          ),
        ),
      ],
      child: Consumer<AuthService>(
        builder: (context, authService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: authService.isAuth ? const HomeScreen() : const AuthScreen(),
            routes: {
              AuthScreen.routeName: (context) => const AuthScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}

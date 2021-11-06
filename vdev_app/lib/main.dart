import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      ],
      child: Consumer<AuthService>(
        builder: (context, authService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: authService.isAuth ? const HomeScreen() : const AuthScreen(),
            routes: {
              HomeScreen.routeName: (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}

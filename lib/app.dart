import 'package:flutter/material.dart';

import 'ui/create_pin_code_screen/create_pin_code_screen.dart';
import 'ui/menu_screen/menu_screen.dart';
import 'ui/authentication_screen/authentication_screen.dart';

class PinCodeApp extends StatelessWidget {
  const PinCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pin code app',
      initialRoute: '/menu',
      routes: {
        '/menu' : (context) => const MenuScreen(),
        '/create_pin_code' : (context) => const CreatePinCodeScreen(),
        '/authentication' : (context) => const AuthenticationScreen(),
      },
    );
  }
}
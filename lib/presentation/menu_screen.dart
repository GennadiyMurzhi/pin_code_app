import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget{
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MenuButton(buttonText: 'Create PIN code', routeName: '/create_pin_code'),
            MenuButton(buttonText: 'Authentication by PIN code', routeName: '/authentication')
          ],
        ),
      ),
    );
  }

}

class MenuButton extends StatelessWidget{
  final String buttonText;
  final String routeName;

  const MenuButton({Key? key,
    required this.buttonText,
    required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () => Navigator.of(context).pushNamed(routeName),
        child: Text(buttonText));
  }
}
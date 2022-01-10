import 'package:flutter/cupertino.dart';

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
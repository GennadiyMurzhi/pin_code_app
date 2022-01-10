import 'package:flutter/material.dart';
import 'package:pin_code_app/ui/menu_screen/widgets/menu_button.dart';

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

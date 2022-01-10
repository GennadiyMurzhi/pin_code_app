import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:pin_code_app/ui/base_pin_screen/widgets/input_indicator.dart';
import 'package:pin_code_app/ui/base_pin_screen/widgets/pin_key_board.dart';

class BasePinScreen extends StatelessWidget{
  final String title;
  final Function numberButtonOnPressed;
  final Function backspaceOnPressed;
  final int countNumberNow;
  final bool needAppBar;

  const BasePinScreen({
    Key? key,
    required this.title,
    required this.numberButtonOnPressed,
    required this.backspaceOnPressed,
    required this.countNumberNow,
    required this.needAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: needAppBar ? AppBar(
          backgroundColor: const Color(0x00000000),
          foregroundColor: const Color(0x00000000),
          shadowColor: const Color(0x00000000),
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff000000),
              size: 24,
            ),
          ),
          title: const Text(
            'Setup PIN',
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w300
            ),
          ),
          actions: const  [
            Center(
              child: Text(
                'Use 4-digits PIN',
                style: TextStyle(
                    color: Color(0xff93a6c1),
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            SizedBox(width: 10)
          ],
          centerTitle: true,
        ) : PreferredSize(child: Container(), preferredSize: Size.zero),
        body: Center(
              child: Column(
                        children: [
                          const Spacer(),
                          Text(
                            title,
                            style: const TextStyle(
                                color: Color(0xff93a6c1),
                                fontSize: 25
                            ),
                          ),
                          const Spacer(),
                          InputIndicator(countNumberNow),
                          const Spacer(flex: 2),
                          PinKeyBoard(
                            numberButtonOnPressed: numberButtonOnPressed,
                            backspaceOnPressed: backspaceOnPressed,
                          ),
                          const Spacer()
                        ],
                      ),
                ),

    );
  }
}

import 'package:flutter/material.dart';

import 'base_button.dart';

class PinKeyBoard extends StatelessWidget{
  final Function numberButtonOnPressed;
  final Function backspaceOnPressed;

  const PinKeyBoard({Key? key,
    required this.numberButtonOnPressed,
    required this.backspaceOnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentDisplayWidth = MediaQuery.of(context).size.width / 100;
    final spacing = percentDisplayWidth * 10.8;
    final sizeBackspaceImage = percentDisplayWidth * 19.16 / 2;

    return Wrap(
      alignment: WrapAlignment.end,
      spacing: spacing,
      children: List.generate(11, (index) {
        if (index != 10) {
          return NumberButton(
              buttonNumber: index,
              onPressed: numberButtonOnPressed,
          );
        } else {
          return BackspaceButton(
              sizeImage: sizeBackspaceImage,
              onPressed: backspaceOnPressed,
          );
        }
      }),
    );
  }
}

class NumberButton extends StatelessWidget{
  final int buttonNumber;
  final Function onPressed;

  const NumberButton({
    Key? key,
    required this.buttonNumber,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberSize = MediaQuery.of(context).size.width / 100 * 4.5;

    return BaseButton(
        onPressed: () => onPressed(context, buttonNumber),
        needColor: true,
        child: Text(
          buttonNumber.toString(),
          style: TextStyle(
              fontSize: numberSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xff7189ab)
          ),
        ));
  }

}

class BackspaceButton extends StatelessWidget{
  final double sizeImage;
  final Function onPressed;

  const BackspaceButton({
    Key? key,
    required this.sizeImage,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
        onPressed: () => onPressed(context),
        needColor: false,
        child: SizedBox.fromSize(
          size: Size.fromWidth(sizeImage),
          child: Image.asset(
            'resources/images/backspace_icon.png',
          ),
        ));
  }

}

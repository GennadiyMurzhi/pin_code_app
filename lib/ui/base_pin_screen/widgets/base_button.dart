import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget{

  final Function onPressed;
  final bool needColor;
  final Widget child;

  const BaseButton({
    Key? key,
    required this.onPressed,
    required this.needColor,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentDisplayWidth = MediaQuery.of(context).size.width / 100;

    final radius = percentDisplayWidth * 19.16;
    final bottomPadding = percentDisplayWidth * 5.6;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: RawMaterialButton(key: key,
          onPressed: () => onPressed(),
          constraints: BoxConstraints(maxWidth: radius, maxHeight: radius),
          hoverColor: Colors.grey,
          splashColor: Colors.white.withOpacity(0),
          fillColor: needColor ? const Color(0xfff5f6f8) : const Color(0x00000000),
          shape: const CircleBorder(),
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          child: SizedBox.fromSize(
              size: Size.fromWidth(radius),
              child: Center(
                child: child,
              ))
      ),
    );
  }
}
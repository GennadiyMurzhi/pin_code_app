import 'package:flutter/cupertino.dart';

class InputIndicator extends StatelessWidget{
  final int countNumber;

  const InputIndicator(this.countNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicatorWidth = MediaQuery.of(context).size.width / 100 * 38.3;
    final diameterCircle = indicatorWidth / 100 * 6.96;
    final leftPaddingCircle = indicatorWidth / 100 * 24.05;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 100 * 38.3,
      child: Row(
        children: List.generate(4, (index) => IndicatorCircle(
                  diameterCircle: diameterCircle,
                  leftPaddingCircle: index < 3 ? leftPaddingCircle : 0,
                  needFeel: index <= countNumber - 1 ? true : false)
        ),
      ),
    );
  }

}

class IndicatorCircle extends StatelessWidget{
  final double diameterCircle;
  final double leftPaddingCircle;
  final bool needFeel;

  const IndicatorCircle({Key? key,
      required this.needFeel,
      required this.diameterCircle,
      required this.leftPaddingCircle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: leftPaddingCircle),
      child: Container(
        width: diameterCircle,
        height: diameterCircle,
        decoration: BoxDecoration(
          color: needFeel ? const Color(0xff7c56ef) : const Color(0x00000000),
          border: Border.all(color: const Color(0xff8ea2be), width: 1),
          shape: BoxShape.circle
        ),
      ),
    );
  }}


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_app/presentation/create_pin_code_screen/cubit/pin_cubit.dart';

class InputIndicator extends StatelessWidget{
  final int countNumber;
  const InputIndicator(this.countNumber, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 100 * 38.3,
      child: Row(
        children: List.generate(7, (index) {
          if(index%2 == 0) {
            if(index/2.toInt() <= countNumber - 1 && index/2.toInt() > -1){
              return const IndicatorCircle(true);
            } else {
              return const IndicatorCircle(false);
            }
          } else {
            return const Spacer();
          }
        }),
      ),
    );
  }

}

class IndicatorCircle extends StatelessWidget{
  final bool needFeel;

  const IndicatorCircle(this.needFeel, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final radiusCircle = MediaQuery.of(context).size.width / 100 * 2.3;

    return Container(
      width: radiusCircle,
      height: radiusCircle,
      decoration: BoxDecoration(
        color: needFeel ? const Color(0xff7c56ef) : const Color(0x00000000),
        border: Border.all(color: const Color(0xff8ea2be), width: 1),
        shape: BoxShape.circle
      ),
    );
  }}


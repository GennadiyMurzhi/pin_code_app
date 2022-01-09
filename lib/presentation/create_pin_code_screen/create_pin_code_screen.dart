import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_app/injection_container.dart';
import 'package:pin_code_app/presentation/base_pin_screen/base_pin_screen.dart';

import 'cubit/pin_cubit.dart';

class CreatePinCodeScreen extends StatelessWidget{
  const CreatePinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PinCubit(getIt()),
      child: BlocBuilder<PinCubit, PinState>(
        builder: (context, pinState) {
          return BasePinScreen(
              title: !pinState.isReInter ? 'Create Pin' : 'Re-inter Your Pin',
              numberButtonOnPressed: _numberButtonOnPressed,
              backspaceOnPressed: _backspaceOnPressed,
              countNumberNow: pinState.countNumber,
              needAppBar: true
          );
        },
      ),
    );
  }

}

void _numberButtonOnPressed(BuildContext context, int buttonNumber){
  final countNumber = BlocProvider.of<PinCubit>(context).state.countNumber;
  final isReInter = BlocProvider.of<PinCubit>(context).state.isReInter;

  if(countNumber < 4 && isReInter == false || countNumber < 3 && isReInter == true){
    BlocProvider.of<PinCubit>(context).interNumber(buttonNumber);
  } else {
    BlocProvider.of<PinCubit>(context).interLastNumber(buttonNumber, context);
  }
}

void _backspaceOnPressed(BuildContext context){
  BlocProvider.of<PinCubit>(context).backspace();
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_app/injection_container.dart';
import 'package:pin_code_app/presentation/authentication_screen/authentication_cubit.dart';
import 'package:pin_code_app/presentation/base_pin_screen/base_pin_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(getIt()),
      child: BlocBuilder<AuthenticationCubit, int>(
        builder: (context, state) {
          return BasePinScreen(
              title: 'Enter your pin',
              numberButtonOnPressed: _numberButtonOnPressed,
              backspaceOnPressed: _backspaceOnPressed,
              countNumberNow: state,
              needAppBar: false
          );
        },
      ),
    );
  }

}

void _numberButtonOnPressed(BuildContext context, int buttonNumber){
  if(BlocProvider.of<AuthenticationCubit>(context).state < 3){
    BlocProvider.of<AuthenticationCubit>(context).interNumber(buttonNumber);
  } else {
    BlocProvider.of<AuthenticationCubit>(context).interLastNumber(buttonNumber, context);
  }
}

void _backspaceOnPressed(BuildContext context){
  BlocProvider.of<AuthenticationCubit>(context).backspace();
}
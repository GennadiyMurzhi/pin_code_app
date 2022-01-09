import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_app/core/usecase.dart';
import 'package:pin_code_app/domain/usecases/check_pin.dart';
import 'package:pin_code_app/presentation/base_pin_screen/widgets/pin_dialog.dart';


class AuthenticationCubit extends Cubit<int> {
  final CheckPin checkPin;

  AuthenticationCubit(this.checkPin) : super(0);

  String _pinCode = '';

  void interNumber(int number) async {

    _pinCode += number.toString();

    if(_pinCode.length != 4){
      emit(_pinCode.length);
    }

  }

  void interLastNumber(int number, BuildContext context) async {
    _pinCode += number.toString();

    emit(4);

    final String message;

    if(await checkPin(Params(enteredPin: _pinCode))){
      message = 'Authentication success';
    } else {
      message = 'Authentication failed';
    }

    _pinCode = '';

    showDialog(
        context: context,
        builder: (context) => PinDialog(message)
    ).whenComplete(() => emit(0));

  }

  void backspace(){
    switch(_pinCode.length){
      case 0:{
        emit(0);
        break;
      }
      case 1: {
        _pinCode = '';
        emit(0);
        break;
      }
      default: {
        _pinCode = _pinCode.substring(0, _pinCode.length - 1);

        emit(_pinCode.length);
      }
    }
  }

}

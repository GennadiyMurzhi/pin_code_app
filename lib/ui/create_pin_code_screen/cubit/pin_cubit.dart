import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_app/core/usecase.dart';
import 'package:pin_code_app/domain/usecases/write_pin.dart';
import 'package:pin_code_app/ui/base_pin_screen/widgets/pin_dialog.dart';

part 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  final WritePin writePin;

  bool _isReEnter = false;
  String _pinCode = '';
  String _pinCodeCheck = '';

  PinCubit(this.writePin) : super(const InterPin(0, false));

  void interNumber(int number) async {

    _isReEnter ? _pinCodeCheck += number.toString() : _pinCode += number.toString();

    if(_isReEnter ? _pinCodeCheck.length != 4 : _pinCode.length != 4){
      emit(InterPin(_isReEnter ? _pinCodeCheck.length : _pinCode.length, _isReEnter));
    } else {
      _isReEnter = true;
      emit(InterPin(4, _isReEnter));
      await Future.delayed(const Duration(milliseconds: 300));
      emit(InterPin(0, _isReEnter));
    }

  }

  void interLastNumber(int number, BuildContext context){
    _pinCodeCheck += number.toString();

    emit(InterPin(4, _isReEnter));

    final String message;

    if(_pinCode == _pinCodeCheck){
      message = 'Your PIN has been set up successfully!';

      writePin(Params(enteredPin: _pinCode));
    } else {
      message = 'PIN codes do not match, please try again';
    }

    _isReEnter = false;
    _pinCode = '';
    _pinCodeCheck = '';

    showDialog(
      context: context,
      builder: (context) => PinDialog(message)
    ).whenComplete(() => emit(InterPin(0, _isReEnter)));


  }

  void backspace(){
    switch(_isReEnter ? _pinCodeCheck.length : _pinCode.length){
      case 0: {
          emit(InterPin(0, _isReEnter));
          break;
        }
      case 1: {
          _isReEnter ? _pinCodeCheck = '' : _pinCode = '';
          emit(InterPin(0, _isReEnter));
          break;
        }
      default: {
          if (_isReEnter) {
            _pinCodeCheck =
                _pinCodeCheck.substring(0, _pinCodeCheck.length - 1);
          } else {
            _pinCode = _pinCode.substring(0, _pinCode.length - 1);
          }

          emit(InterPin(
              _isReEnter ? _pinCodeCheck.length : _pinCode.length, _isReEnter));
        }
    }
  }


}

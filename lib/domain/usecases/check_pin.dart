import 'package:pin_code_app/core/usecase.dart';
import 'package:pin_code_app/domain/pin_repository.dart';

class CheckPin extends UseCase<bool, Params>{
  final PinRepository repository;

  CheckPin(this.repository);

  @override
  Future<bool> call(Params params) async {
    return await repository.checkPin(params.enteredPin);
  }
}


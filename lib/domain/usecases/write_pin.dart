import 'package:pin_code_app/core/usecase.dart';
import 'package:pin_code_app/domain/pin_repository.dart';

class WritePin extends UseCase<void, Params>{
  final PinRepository repository;

  WritePin(this.repository);

  @override
  Future<void> call(Params params) async {
    return repository.writePin(params.enteredPin);
  }
}

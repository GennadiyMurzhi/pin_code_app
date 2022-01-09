import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class Params extends Equatable{
  final String enteredPin;

  const Params({required this.enteredPin});

  @override
  List<Object?> get props => [enteredPin];
}
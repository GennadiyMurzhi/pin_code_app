part of 'pin_cubit.dart';

abstract class PinState extends Equatable {
  final int countNumber;
  final bool isReInter;

  const PinState(this.countNumber, this.isReInter);
}

class InterPin extends PinState {

  const InterPin(int countNumber, bool isReInter) : super(countNumber, isReInter);

  @override
  List<Object> get props => [countNumber, isReInter];
}

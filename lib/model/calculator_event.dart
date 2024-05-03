abstract class CalculatorEvent {}

class NumberChanged extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  NumberChanged({required this.firstNumber, required this.secondNumber});
}

class OperationChanged extends CalculatorEvent {
  final String operation;

  OperationChanged({required this.operation});
}

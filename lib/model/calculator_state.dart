abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorUpdated extends CalculatorState {
  final int firstNumber;
  final int secondNumber;
  final String operation;
  final String result;

  CalculatorUpdated({
    required this.firstNumber,
    required this.secondNumber,
    required this.operation,
    this.result = '0',
  });
}

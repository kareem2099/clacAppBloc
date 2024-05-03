import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clacapp/model/calculator_event.dart';
import 'package:clacapp/model/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc()
      : super(CalculatorUpdated(
            firstNumber: 0, secondNumber: 0, operation: ' ')) {
    on<NumberChanged>((event, emit) {
      if (state is CalculatorUpdated) {
        emit(CalculatorUpdated(
          firstNumber: event.firstNumber,
          secondNumber: event.secondNumber,
          operation: (state as CalculatorUpdated).operation,
        ));
      }
    });

    on<OperationChanged>((event, emit) {
      if (state is CalculatorUpdated) {
        String result = (state as CalculatorUpdated).result;
        if (event.operation != ' ') {
          if (event.operation == '+') {
            result = ((state as CalculatorUpdated).firstNumber +
                    (state as CalculatorUpdated).secondNumber)
                .toString();
          }
          // Add similar blocks for other operations...
        }
        emit(CalculatorUpdated(
          firstNumber: (state as CalculatorUpdated).firstNumber,
          secondNumber: (state as CalculatorUpdated).secondNumber,
          operation: event.operation,
          result: result,
        ));
      }
    });
  }
}

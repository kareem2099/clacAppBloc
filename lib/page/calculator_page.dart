import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clacapp/bloc/calculator_bloc.dart';
import 'package:clacapp/model/calculator_state.dart';
import 'package:clacapp/model/calculator_event.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CalculatorBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.calculate,
                color: Color(0xff9bbfdc)), // Set the icon color to blue
            SizedBox(
                width: 10), // Add some spacing between the icon and the text
            Text(
              'Calculator',
              style:
                  TextStyle(color: Colors.blue), // Set the text color to blue
            ),
          ],
        ),
        centerTitle: true, // This attribute centers the title
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          if (state is CalculatorUpdated) {
            String result;
            switch (state.operation) {
              case '+':
                result = (state.firstNumber + state.secondNumber).toString();
                break;
              case '-':
                result = (state.firstNumber - state.secondNumber).toString();
                break;
              case 'x':
                result = (state.firstNumber * state.secondNumber).toString();
                break;
              case '÷':
                if (state.secondNumber != 0) {
                  result = (state.firstNumber / state.secondNumber).toString();
                } else {
                  result = 'Error';
                }
                break;
              default:
                result =
                    '0'; // Set result to '0' when operation is not one of '+', '-', 'x', or '÷'
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: const Color(0xff65a9c8),
                        border: Border.all(
                            color:
                                Colors.black), // Set the border color to black
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineMedium,
                          children: <TextSpan>[
                            const TextSpan(text: '     '), // Add space
                            TextSpan(
                                text: '${state.firstNumber}',
                                style: const TextStyle(color: Colors.red)),
                            const TextSpan(text: '     '), // Add space
                            const TextSpan(
                                text: '     '), // Add space for operation
                            TextSpan(
                                text: '${state.secondNumber}',
                                style: const TextStyle(color: Colors.yellow)),
                            const TextSpan(text: '      =      '), // Add space
                            TextSpan(
                                text: result,
                                style: const TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95, // Adjust as needed
                      top: 14, // Adjust as needed
                      child: Container(
                        padding: const EdgeInsets.all(13), // Adjust as needed
                        decoration: const BoxDecoration(
                          color: Color(0xff906a6a), // Choose the color you want
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          state.operation,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green), // Adjust as needed
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Add space between elements.
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: const Color(0xff65a9c8),
                    border: Border.all(
                        color: Colors.black), // Set the border color to black
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text(
                            'First Number',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                bloc.add(NumberChanged(
                                  firstNumber: state.firstNumber + 1,
                                  secondNumber: state.secondNumber,
                                ));
                              },
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                bloc.add(NumberChanged(
                                  firstNumber: state.firstNumber - 1,
                                  secondNumber: state.secondNumber,
                                ));
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Add space between elements
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 200, // Increase the width of the container
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Text('Addition  (+) '),
                              onPressed: () {
                                bloc.add(OperationChanged(operation: '+'));
                              },
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Add space between elements
                          Container(
                            width: 200, // Increase the width of the container

                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Text('Subtraction (-) '),
                              onPressed: () {
                                bloc.add(OperationChanged(operation: '-'));
                              },
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Add space between elements
                          Container(
                            width: 200, // Increase the width of the container

                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Text('Multiply (x) '),
                              onPressed: () {
                                bloc.add(OperationChanged(operation: 'x'));
                              },
                            ),
                          ),
                          const SizedBox(
                              height: 10), // Add space between elements
                          Container(
                            width: 200, // Increase the width of the container

                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Text('Division (÷) '),
                              onPressed: () {
                                bloc.add(OperationChanged(operation: '÷'));
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Add space between elements
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text(
                            'Second Number',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 25,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                bloc.add(NumberChanged(
                                  firstNumber: state.firstNumber,
                                  secondNumber: state.secondNumber + 1,
                                ));
                              },
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                bloc.add(NumberChanged(
                                  firstNumber: state.firstNumber,
                                  secondNumber: state.secondNumber - 1,
                                ));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Container(
                  margin:
                      const EdgeInsets.all(20), // Add space around the button
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set the color to blue
                    borderRadius: BorderRadius.circular(
                        45), // Set the border radius to 45
                    border: Border.all(
                        color: Colors.black), // Set the border color to black
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blue), // Set the button color to blue
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              45), // Set the button border radius to 45
                        ),
                      ),
                    ),
                    onPressed: () {
                      bloc.add(NumberChanged(firstNumber: 0, secondNumber: 0));
                      bloc.add(OperationChanged(operation: ' '));
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ), // Set the button text color to white
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: Text('Please enter numbers and select an operation'));
          }
        },
      ),
    );
  }
}

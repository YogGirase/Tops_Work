import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculatorApp',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _operation = 'Add';
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculateResult() {
    double? num1 = double.tryParse(_num1Controller.text);
    double? num2 = double.tryParse(_num2Controller.text);

    if (num1 != null && num2 != null) {
      double calcResult;
      switch (_operation) {
        case 'Add':
          calcResult = num1 + num2;
          break;
        case 'Subtract':
          calcResult = num1 - num2;
          break;
        case 'Multiply':
          calcResult = num1 * num2;
          break;
        case 'Divide':
          if (num2 != 0) {
            calcResult = num1 / num2;
          } else {
            _result = 'Cannot divide by zero.';
            setState(() {});
            return;
          }
          break;
        default:
          calcResult = 0;
      }
      setState(() {
        _result = 'Result: $calcResult';
      });
    } else {
      setState(() {
        _result = 'Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calcultor App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _num1Controller,
                  decoration: InputDecoration(labelText: 'Enter Number 1'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _num2Controller,
                  decoration: InputDecoration(labelText: 'Enter Number 2'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Add',
                          groupValue: _operation,
                          onChanged: (value) {
                            setState(() {
                              _operation = value!;
                            });
                          },
                        ),
                        Text('Add'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Subtract',
                          groupValue: _operation,
                          onChanged: (value) {
                            setState(() {
                              _operation = value!;
                            });
                          },
                        ),
                        Text('Subtract'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Multiply',
                          groupValue: _operation,
                          onChanged: (value) {
                            setState(() {
                              _operation = value!;
                            });
                          },
                        ),
                        Text('Multiply'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: 'Divide',
                          groupValue: _operation,
                          onChanged: (value) {
                            setState(() {
                              _operation = value!;
                            });
                          },
                        ),
                        Text('Divide'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: _calculateResult, child: Text('Calculate')),
                SizedBox(
                  height: 16,
                ),
                Text(
                  _result,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}

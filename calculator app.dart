import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _output = '';
  String _outputHistory = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '';
      _outputHistory = '';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '';
      _outputHistory = '$_num1 $_operand';
    } else if (buttonText == '.') {
      if (!_output.contains('.')) {
        _output += buttonText;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
        _outputHistory = '$_outputHistory $_num2 = $_output';
      }
      if (_operand == '-') {
        _output = (_num1 - _num2).toString();
        _outputHistory = '$_outputHistory $_num2 = $_output';
      }
      if (_operand == 'x') {
        _output = (_num1 * _num2).toString();
        _outputHistory = '$_outputHistory $_num2 = $_output';
      }
      if (_operand == '/') {
        _output = (_num1 / _num2).toString();
        _outputHistory = '$_outputHistory $_num2 = $_output';
      }
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
           style: ElevatedButton.styleFrom(
          primary: Colors.grey[300], // Button color
          padding: EdgeInsets.all(20.0),
          )
        ),
      ),
    );
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _outputHistory,
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('0'),
                    buildButton('.'),
                    buildButton('C'),
                    buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('='),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

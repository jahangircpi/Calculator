import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: calculatorhomepge()));
}

class calculatorhomepge extends StatefulWidget {
  @override
  _calculatorhomepgeState createState() => _calculatorhomepgeState();
}

class _calculatorhomepgeState extends State<calculatorhomepge> {
  String result = "0";

  double numb1 = 0;

  double numb2 = 0;
  String _output = "0";
  String operand = '';
  buttonPressed(String buttontext) {
    print(buttontext);
    if (buttontext == "C") {
      _output = "0";
      numb2 = 0;
      numb1 = 0;

      operand = '';
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "/" ||
        buttontext == "X") {
      numb1 = double.parse(result);
      operand = buttontext;
      _output = "0";
    } else if (buttontext == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == "⌫") {
      _output = _output.substring(0, _output.length - 1);
    } else if (buttontext == "=") {
      numb2 = double.parse(result);
      if (operand == "+") {
        _output = (numb1 + numb2).toString();
      }
      if (operand == "-") {
        _output = (numb1 - numb2).toString();
      }
      if (operand == "X") {
        _output = (numb1 * numb2).toString();
      }
      if (operand == "/") {
        _output = (numb1 / numb2).toString();
      }
      numb1 = 0.0;
      numb2 = 0.0;

      operand = "";
    } else {
      _output = _output + buttontext;
    }
    print(_output);
    setState(() {
      result = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22252D),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container()),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8),
                    child: Text(
                      result,
                      style: TextStyle(color: Colors.white, fontSize: 48),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _container(
                      "⌫",
                      Colors.cyan,
                    ),
                    _container("=", Colors.cyan),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                _container("7", Colors.white),
                _container("8", Colors.white),
                _container("9", Colors.white),
                _container("X", Color(0xFFD26D6E)),
              ],
            ),
            Row(
              children: [
                _container("4", Colors.white),
                _container("5", Colors.white),
                _container("6", Colors.white),
                _container("-", Color(0xFFD26D6E)),
              ],
            ),
            Row(
              children: [
                _container("1", Colors.white),
                _container("2", Colors.white),
                _container("3", Colors.white),
                _container("+", Color(0xFFD26D6E)),
              ],
            ),
            Row(
              children: [
                _container("C", Colors.white),
                _container("0", Colors.white),
                _container(".", Colors.white),
                _container("/", Color(0xFFD26D6E)),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Expanded _container(_inputtext, Color _color) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.tealAccent,
        onTap: () {
          print("pressed");
          buttonPressed(_inputtext);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(10),
            shadowColor: Color(0xFF22252D).withOpacity(0.095),
            elevation: 10,
            color: Colors.black,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF22252D).withOpacity(0.80),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14.0, right: 14, top: 14, bottom: 10),
                  child: Center(
                    child: Text(
                      _inputtext,
                      style: TextStyle(
                          color: _color,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

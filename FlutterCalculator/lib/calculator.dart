import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget customButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
        primary: btnColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    textOperation,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton("C", Colors.grey, Colors.black),
                customButton("+/-", Colors.grey, Colors.black),
                customButton("%", Colors.grey, Colors.black),
                customButton("/", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton("7", (Colors.grey[850])!, Colors.white),
                customButton("8", (Colors.grey[850])!, Colors.white),
                customButton("9", (Colors.grey[850])!, Colors.white),
                customButton("x", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton("4", (Colors.grey[850])!, Colors.white),
                customButton("5", (Colors.grey[850])!, Colors.white),
                customButton("6", (Colors.grey[850])!, Colors.white),
                customButton("-", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customButton("1", (Colors.grey[850])!, Colors.white),
                customButton("2", (Colors.grey[850])!, Colors.white),
                customButton("3", (Colors.grey[850])!, Colors.white),
                customButton("+", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: (Colors.grey[850])!,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 90, 12),
                    child: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                customButton(".", (Colors.grey[850])!, Colors.white),
                customButton("=", Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  // Logic
  num firstNumber = 0;
  num secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";
  String textOperation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      textOperation = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
      textOperation = '$firstNumber $operation';
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
        textOperation = '$firstNumber + $secondNumber =';
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
        textOperation = '$firstNumber - $secondNumber =';
      }
      if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
        textOperation = '$firstNumber x $secondNumber =';
      }
      if (operation == "/") {
        result = (firstNumber ~/ secondNumber).toString();
        textOperation = '$firstNumber / $secondNumber =';
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}

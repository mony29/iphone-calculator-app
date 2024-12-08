import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var output = "0".obs;
  var currentNumber = "".obs;
  var operation = "".obs;
  var num1 = 0.0.obs;
  var newNumber = true.obs;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      clear();
    } else if (buttonText == "+/-") {
      toggleSign();
    } else if (buttonText == "%") {
      percentage();
    } else if (["+", "-", "×", "÷"].contains(buttonText)) {
      setOperation(buttonText);
    } else if (buttonText == "=") {
      calculate();
    } else if (buttonText == ".") {
      addDecimal();
    } else {
      addNumber(buttonText);
    }
  }

  void clear() {
    output.value = "0";
    currentNumber.value = "";
    operation.value = "";
    num1.value = 0;
    newNumber.value = true;
  }

  void toggleSign() {
    if (output.value.startsWith('-')) {
      output.value = output.value.substring(1);
    } else if (output.value != "0") {
      output.value = '-${output.value}';
    }
  }

  void percentage() {
    double value = double.parse(output.value);
    output.value = (value / 100).toString();
    if (output.value.contains('.')) {
      output.value = output.value.replaceAll(RegExp(r'\.?0*$'), '');
    }
  }

  void setOperation(String op) {
    num1.value = double.parse(output.value);
    operation.value = op;
    newNumber.value = true;
  }

  void calculate() {
    double num2 = double.parse(output.value);
    switch (operation.value) {
      case "+":
        output.value = (num1.value + num2).toString();
        break;
      case "-":
        output.value = (num1.value - num2).toString();
        break;
      case "×":
        output.value = (num1.value * num2).toString();
        break;
      case "÷":
        output.value = (num1.value / num2).toString();
        break;
    }
    if (output.value.contains('.')) {
      output.value = output.value.replaceAll(RegExp(r'\.?0*$'), '');
    }
    newNumber.value = true;
  }

  void addDecimal() {
    if (!output.value.contains(".")) {
      output.value = output.value + ".";
    }
  }

  void addNumber(String number) {
    if (newNumber.value) {
      output.value = number;
      newNumber.value = false;
    } else {
      if (output.value == "0") {
        output.value = number;
      } else {
        output.value = output.value + number;
      }
    }
  }

  double calculateFontSize(String text) {
    if (text.length > 8) {
      return 70.0 - (text.length - 8) * 5.0;
    }
    return 70.0;
  }
}

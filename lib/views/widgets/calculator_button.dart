import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../../controllers/calculator_controller.dart';
import '../../utils/colors.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final CalculatorController controller;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.controller,
  });

  Color _getButtonColor() {
    if (text == "C" || text == "+/-" || text == "%") {
      return AppColors.functionButton;
    } else if (["+", "-", "×", "÷", "="].contains(text)) {
      return AppColors.operatorButton;
    } else {
      return AppColors.numberButton;
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = (Get.width - 40) / 4;
    bool isZero = text == "0";

    return Container(
      width: isZero ? buttonSize * 2 + 8 : buttonSize,
      height: buttonSize,
      padding: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: () => controller.buttonPressed(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(_getButtonColor()),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
} 
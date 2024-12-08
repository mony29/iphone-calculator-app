import 'package:flutter/material.dart';
import 'package:flutter_tailwind/flutter_tailwind.dart';
import 'package:get/get.dart';
import '../../controllers/calculator_controller.dart';
import '../../utils/colors.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: Obx(() => FittedBox(
                  child: Text(
                    controller.output.value,
                    style: TextStyle(
                      fontSize: controller.calculateFontSize(controller.output.value),
                      fontWeight: FontWeight.w300,
                      color: AppColors.textColor,
                    ),
                  ),
                )),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(text: "C", controller: controller),
                      CalculatorButton(text: "+/-", controller: controller),
                      CalculatorButton(text: "%", controller: controller),
                      CalculatorButton(text: "÷", controller: controller),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(text: "7", controller: controller),
                      CalculatorButton(text: "8", controller: controller),
                      CalculatorButton(text: "9", controller: controller),
                      CalculatorButton(text: "×", controller: controller),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(text: "4", controller: controller),
                      CalculatorButton(text: "5", controller: controller),
                      CalculatorButton(text: "6", controller: controller),
                      CalculatorButton(text: "-", controller: controller),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(text: "1", controller: controller),
                      CalculatorButton(text: "2", controller: controller),
                      CalculatorButton(text: "3", controller: controller),
                      CalculatorButton(text: "+", controller: controller),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(text: "0", controller: controller),
                      CalculatorButton(text: ".", controller: controller),
                      CalculatorButton(text: "=", controller: controller),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
} 
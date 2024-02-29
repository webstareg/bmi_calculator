import 'package:bmi_calculator/calculator/app_colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result});
  final double result;

// Severe Thinness	< 16
// Moderate Thinness	16 - 17
// Mild Thinness	17 - 18.5
// Normal	18.5 - 25
// Overweight	25 - 30
// Obese Class I	30 - 35
// Obese Class II	35 - 40
// Obese Class III	> 40

  String getClassification() {
    if (result < 16) {
      return 'Severe Thinness';
    } else if (result >= 16 && result < 17) {
      return 'Moderate Thinness';
    } else if (result >= 17 && result < 18.5) {
      return 'Mild Thinness';
    } else if (result >= 18.5 && result < 25) {
      return 'NORMAL';
    } else if (result >= 25 && result < 30) {
      return 'Overweight';
    } else if (result >= 30 && result < 35) {
      return 'Obese Class I';
    } else if (result >= 35 && result < 40) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  String getComment() {
    if (result < 16) {
      return 'نحافة شديدة';
    } else if (result >= 16 && result < 17) {
      return 'نحافة متوسطة';
    } else if (result >= 17 && result < 18.5) {
      return 'نحافة بسيطة';
    } else if (result >= 18.5 && result < 25) {
      return 'أنت تتمتع بالوزن المثالي';
    } else if (result >= 25 && result < 30) {
      return 'وزن زائد';
    } else if (result >= 30 && result < 35) {
      return 'سمنة من الدرجة الأولى';
    } else if (result >= 35 && result < 40) {
      return 'سمنة من الدرجة الثانية';
    } else {
      return 'سمنة من الدرجة الثالثة';
    }
  }

  MaterialColor getColor() {
    if (result < 18.5) {
      return Colors.yellow;
    } else if (result >= 18.5 && result < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    'Your result',
                    style: TextStyle(color: AppColors.white, fontSize: 26),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getClassification(),
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text(
                result.toStringAsFixed(2),
                style: TextStyle(color: getColor(), fontSize: 72),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getComment(),
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                width: width,
                height: 90,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Recalculate')))
          ],
        ),
      )),
    );
  }
}

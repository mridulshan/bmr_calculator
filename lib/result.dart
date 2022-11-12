import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';

TextStyle kcStyle(double size,Color c) {
  return TextStyle(
    color: c,
    fontSize: size,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.none,
  );
}

class Result extends StatefulWidget {
  final int height;
  final int weight;
  final int age;
  final int gender;
  Result({this.age, this.weight, this.height, this.gender});
  @override
  _ResultState createState() =>
      _ResultState(age: age, height: height, weight: weight, gender: gender);
}

class _ResultState extends State<Result> {
  final int height;
  final int weight;
  final int age;
  final int gender;
  _ResultState({this.age, this.weight, this.height, this.gender});
  double cal() {
    double bmr = 0;
    if (gender >= 0) {
      if (gender == 0) {
        bmr = 88.362 +
            (13.397 * weight.toDouble()) +
            (4.799 * height.toDouble()) -
            (5.677 * age.toDouble());
      } else {
        bmr = 447.593 +
            (9.247 * weight.toDouble()) +
            (3.098 * height.toDouble()) -
            (4.330 * age.toDouble());
      }
    }
    return bmr;
  }

  @override
  Widget build(BuildContext context) {
    String result;
    double gain;
    double loss;
    if (cal() > 0) {
      result = (cal() * 1.5).toStringAsFixed(2);
      gain = (cal() * 1.5 + 500.0);
      loss = (cal() * 1.5 - 500);
    } else {
      result = 'Kindly input gender';
    }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: ReCard(
        colour: activeColor,
        childRecard: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your daily Calories:',
              style: kcStyle(45, Colors.white70),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Maintenance calories:',
              style: bodyStyle,
            ),
            Text(
              result,
              style: kcStyle(30, Colors.deepOrangeAccent[100]),
            ),
            Text(
              'Weight Loss calories:',
              style: bodyStyle,
            ),
            Text(
              loss.toStringAsFixed(2),
              style: kcStyle(30, Colors.deepPurpleAccent[100]),
            ),
            Text(
              'Weight Gain calories:',
              style: bodyStyle,
            ),
            Text(
              gain.toStringAsFixed(2),
              style: kcStyle(30, Colors.lightGreen[100]),
            ),
          ],
        ),
      )),
    );
  }
}

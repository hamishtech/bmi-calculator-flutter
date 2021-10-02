import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(color: Color(0xFF0A0E21)),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xFF8D8E98),
            fontSize: 18.0,
          ),
          bodyText2: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      home: InputPage(),
      routes: {
        '/results': (context) => ResultsPage(),
      },
    );
  }
}

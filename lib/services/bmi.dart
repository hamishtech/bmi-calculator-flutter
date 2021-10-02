import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMI {
  String gender;
  double height = 150;
  int weight = 65;
  int age = 30;
  bool ready = false;
  double bmi;
  Map results;

  void checkReady() {
    if (this.gender == null) {
      this.ready = false;
      print("need gender");
    } else {
      this.ready = true;
    }
  }

  void calculateBMI() {
    if (ready) {
      var sanitizedHeight = this.height / 100;
      var power = sanitizedHeight * sanitizedHeight;
      this.bmi = this.weight / power;
      if (this.bmi < 18.5) {
        this.results = {
          'result': "Underweight",
          'color': resultUnderweight,
          'text': "You need to gain weight!"
        };
      } else if (this.bmi < 25) {
        this.results = {
          'result': "Normal",
          'color': resultNormal,
          'text': "Congrats! You have a healthy weight!"
        };
      } else if (this.bmi < 30) {
        this.results = {
          'result': "Overweight",
          'color': resultOverweight,
          'text': "You need to lose weight!"
        };
      } else {
        this.results = {
          'result': "Obese",
          'color': resultObese,
          'text': "You have to lose weight immediately!"
        };
      }
    }
  }
}

import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BmiCalculator {
  static double calculate(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  static BmiCategory getCategory(double bmi) {
    if (bmi < 18.5) {
      return BmiCategory.underweight;
    } else if (bmi < 25) {
      return BmiCategory.normal;
    } else if (bmi < 30) {
      return BmiCategory.overweight;
    } else {
      return BmiCategory.obese;
    }
  }

  static Color getCategoryColor(String type) {
    if (type == "underweight") {
      return Colors.blue;
    } else if (type == "normal") {
      return Colors.green;
    } else if (type == "overweight") {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}

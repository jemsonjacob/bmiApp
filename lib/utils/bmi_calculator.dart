import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:flutter/material.dart';

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

  static String getMessage(String type) {
    if (type == "underweight") {
      return "You may be underweight. Focus on a balanced, nutrient-rich diet and consult a healthcare professional if needed. Strength training can also help build healthy muscle.";
    } else if (type == "normal") {
      return "Great job! Maintain your healthy lifestyle with a balanced diet, regular exercise, adequate sleep, and proper hydration.";
    } else if (type == "overweight") {
      return "Aim for gradual, sustainable weight management through portion control, regular physical activity, and healthy eating habits. Small changes can make a big difference.";
    } else {
      return "Consider speaking with a healthcare professional for personalized guidance. A balanced diet, regular exercise, and consistent lifestyle changes can improve your overall health.";
    }
  }
}

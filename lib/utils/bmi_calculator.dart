import 'package:bmi/viewmodel/bmi_state.dart';

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
}

import 'package:bmi/model/bmimodel.dart';

enum BmiCategory { underweight, normal, overweight, obese }

class BmiState {
  final double? bmi;
  final BmiCategory? category;
  final List<Bmi> history;
  final bool isLoading;
  final String? errorMessage;

  const BmiState({
    this.bmi,
    this.category,
    this.history = const [], //when sterting this will be empty
    this.isLoading = false,
    this.errorMessage,
  });

  BmiState copyWith({
    double? bmi,
    BmiCategory? category,
    List<Bmi>? history,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BmiState(
      bmi: bmi ?? this.bmi,
      category: category ?? this.category,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

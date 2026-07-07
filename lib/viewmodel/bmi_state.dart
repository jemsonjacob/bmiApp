import 'package:bmi/model/bodymodel.dart';

enum BmiCategory { underweight, normal, overweight, obese }

class BmiState {
  const BmiState({
    this.bmi,
    this.category,
    this.history = const [], //when sterting this will be empty
    this.isLoading = false,
  });

  final double? bmi;
  final BmiCategory? category;
  final List<Body> history;
  final bool isLoading;

  BmiState copyWith({
    double? bmi,
    BmiCategory? category,
    List<Body>? history,
    bool? isLoading,
  }) {
    return BmiState(
      bmi: bmi ?? this.bmi,
      category: category ?? this.category,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

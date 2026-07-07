import 'package:bmi/utils/bmi_calculator.dart';
import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bmi/model/bmimodel.dart';
import 'package:bmi/repositories/bmi_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BmiViewModel extends Notifier<BmiState> {
  BmiViewModel();

  late final BmiRepository _repository;

  Future<void> calculateBMI({
    required double height,
    required double weight,
  }) async {
    // Show loading
    state = state.copyWith(isLoading: true);
    // Calculate
    final bmi = BmiCalculator.calculate(height, weight);
    // Determine category
    final category = BmiCalculator.getCategory(bmi);
    // Create model
    final body = Bmi(height: height, weight: weight, date: DateTime.now());

    try {
      await _repository.saveBody(body);

      state = state.copyWith(bmi: bmi, category: category);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //history
  Future<void> loadHistory() async {
    //loading true
    state = state.copyWith(isLoading: true);
    //get history from repo
    try {
      final history = await _repository.getHistory();
      state = state.copyWith(history: history);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteBody(int index) async {
    try {
      await _repository.deleteBody(index);
      await loadHistory();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  @override
  BmiState build() {
    _repository = ref.read(repositoryProvider);
    return const BmiState();
  }
}

final repositoryProvider = Provider((ref) {
  final box = Hive.box<Bmi>("bodies");
  return BmiRepository(box);
});

final bminotifierProvider = NotifierProvider<BmiViewModel, BmiState>(
  BmiViewModel.new,
);

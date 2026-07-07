import 'package:bmi/utils/bmi_calculator.dart';
import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:bmi/viewmodel/body_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class BmiResultsScreen extends ConsumerWidget {
  const BmiResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bminotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Result")),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(BmiState state) {
    final Color color = BmiCalculator.getCategoryColor(
      state.category?.name ?? '',
    );
    final message = BmiCalculator.getMessage(state.category?.name ?? '');
    final bmi = state.bmi?.toStringAsFixed(1) ?? "--";
    final type = state.category?.name.toUpperCase() ?? "--";

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Lottie.asset('assets/animation/happy.json', height: 200),
            const SizedBox(height: 20),
            _buildWeightContainer(type, bmi, color),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue.withAlpha(20),
                border: Border.all(color: Colors.cyan),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      " ℹ️ Health Recommendation ",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      message,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightContainer(String type, String bmi, Color color) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color.withAlpha(40),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your BMI ",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              bmi,
              style: TextStyle(
                fontSize: 60,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(type, style: TextStyle(fontSize: 20, color: color)),
          ],
        ),
      ),
    );
  }
}

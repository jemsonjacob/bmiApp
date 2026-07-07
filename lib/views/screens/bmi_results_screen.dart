import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:bmi/viewmodel/body_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiResultsScreen extends ConsumerWidget {
  const BmiResultsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bminotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Result")),
      body: _buildBody(state),
    );
  }

  Widget _buildBody(BmiState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan.shade100,
                border: Border.all(color: Colors.cyan),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(" Your BMI "),
                    const SizedBox(height: 10),
                    Text(
                      state.bmi?.toStringAsFixed(1) ?? "--",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      state.category?.name ?? "--",
                      style: TextStyle(fontSize: 20),
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
}

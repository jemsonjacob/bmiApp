import 'package:bmi/utils/bmi_calculator.dart';
import 'package:bmi/viewmodel/bmi_state.dart';
import 'package:bmi/viewmodel/body_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class BmiHistoryScreen extends ConsumerStatefulWidget {
  const BmiHistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BmiHistoryScreenState();
}

class _BmiHistoryScreenState extends ConsumerState<BmiHistoryScreen> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(bminotifierProvider.notifier).loadHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bminotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: _buildBody(state),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.calculate),
        label: const Text("Calculate Again"),
      ),
    );
  }

  Widget _buildBody(BmiState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/empty.json', height: 200),
            Icon(Icons.history_sharp, size: 70, color: Colors.grey),
            Text(
              "No BMI History",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "Calculate your first BMI & It will appear her.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: state.history.length,
      itemBuilder: (context, index) {
        final data = state.history[index];
        final date = DateFormat('dd MMM yyyy').format(data.date);
        final bmi = BmiCalculator.calculate(data.height, data.weight);
        final category = BmiCalculator.getCategory(bmi);
        final color = BmiCalculator.getCategoryColor(category.name);

        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Date
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                /// BMI Circle
                Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    category.name.toUpperCase(),
                    style: TextStyle(
                      color: color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.height),
                        const SizedBox(height: 5),
                        const Text(
                          "Height",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "${data.height} cm",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monitor_weight),
                        const SizedBox(height: 5),
                        const Text(
                          "Weight",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "${data.weight} kg",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      ref.read(bminotifierProvider.notifier).deleteBody(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

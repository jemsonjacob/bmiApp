import 'package:flutter/material.dart';

class BmiContainer extends StatelessWidget {
  const BmiContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue.withAlpha(20),
        border: Border.all(color: Colors.cyan),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BMI Categories",
              style: TextStyle(fontSize: 15, color: Colors.cyan),
            ),
            const SizedBox(height: 10),
            _buildBmiRow(Colors.blue, 'Underweight - BMI < 18.5'),
            const SizedBox(height: 10),
            _buildBmiRow(Colors.green, 'Normal Weight - 18.5 - 24.9'),
            const SizedBox(height: 10),
            _buildBmiRow(Colors.orange, 'Overweight - 25.0 - 29.9'),
            const SizedBox(height: 10),
            _buildBmiRow(Colors.red, 'Obese - BMI >= 30'),
          ],
        ),
      ),
    );
  }

  Widget _buildBmiRow(MaterialColor color, String s) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Text(s, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

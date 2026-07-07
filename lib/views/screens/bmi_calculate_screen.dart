import 'package:bmi/viewmodel/body_view_model.dart';
import 'package:bmi/views/screens/bmi_results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiCalculateScreen extends ConsumerStatefulWidget {
  const BmiCalculateScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BmiCalculateScreenState();
}

class _BmiCalculateScreenState extends ConsumerState<BmiCalculateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> calculateBMI() async {
    if (!_formKey.currentState!.validate()) return;

    final height = double.parse(_heightController.text);
    final weight = double.parse(_weightController.text);

    await ref
        .read(bminotifierProvider.notifier)
        .calculateBMI(height: height, weight: weight);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BmiResultsScreen()),
    );
  }

  String? _validateNumber(String? value, String label) {
    if (value == null || value.trim().isEmpty) return 'Enter your $label';
    final parsed = double.tryParse(value);
    if (parsed == null || parsed <= 0) return 'Enter a valid $label';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Know Your Health"),
                const SizedBox(height: 10),
                Text("Calculate your Body Mass Index"),
                const SizedBox(height: 30),
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    "Height(cm)",
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  validator: (value) =>
                      _validateNumber(_heightController.text, "Height"),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter your Height',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: Text(
                    "Weight(kg)",
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  validator: (value) =>
                      _validateNumber(_weightController.text, 'Weight'),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter your Weight',
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: calculateBMI,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.cyan,
                    ),
                    child: Center(
                      child: Text(
                        "Calculate BMI",
                        style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 18,
                          color: Colors.white,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                BmiContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BmiContainer extends StatelessWidget {
  const BmiContainer({super.key});

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
        Text(s),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.cyan.shade100,
        border: Border.all(color: Colors.cyan),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BMI Categories"),
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
}

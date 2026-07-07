import 'package:bmi/model/bodymodel.dart';
import 'package:bmi/views/screens/bmi_calculate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(BodyAdapter());
  }

  await Hive.openBox<Body>('bodies');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyan)),
      home: const BmiCalculateScreen(),
    );
  }
}

import 'package:bmi/model/bmimodel.dart';
import 'package:bmi/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();
  //register adapter
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(BmiAdapter());
  }
  //create box
  await Hive.openBox<Bmi>('bodies');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.cyan)),
      home: const SplashScreen(),
    );
  }
}

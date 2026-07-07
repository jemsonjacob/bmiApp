import 'dart:async';
import 'package:bmi/views/screens/bmi_calculate_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BmiCalculateScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.shade300, Colors.cyan],
            begin: AlignmentGeometry.topStart,
            end: AlignmentGeometry.bottomEnd,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Know your BMI.Stay Healthy",
              style: GoogleFonts.getFont(
                'Nunito Sans',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 0.2,
              ),
            ),
            Lottie.asset('assets/animation/Speedometer.json'),
            // SizedBox(height: 10),
            // CircularProgressIndicator(
            //   strokeWidth: 2,
            //   backgroundColor: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }
}

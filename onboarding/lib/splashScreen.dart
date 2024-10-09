import 'package:flutter/material.dart';
import 'dart:async';

import 'package:onboarding/onboardingScreen1.dart'; // For handling time delay

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a timer for 2 seconds and then navigate to the next page
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF081C4A), // The dark background color
      body: Center(
        child: Image.asset(
          'assets/img/yeneta_logo.jpg', // Add your app logo here
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}

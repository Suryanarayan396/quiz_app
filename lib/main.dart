import 'package:flutter/material.dart';
import 'package:quiz_app/view/splash_screen/splash_screen.dart';

void main() {
  runApp(quiz_app());
}

class quiz_app extends StatelessWidget {
  const quiz_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

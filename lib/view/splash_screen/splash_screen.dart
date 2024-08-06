import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/utils/constants/animation_constants.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';
import 'package:quiz_app/view/choseCategory_screen/choseCategory_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChosecategoryScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.MAINBLACK,
      body: Center(
        child: Lottie.asset(AnimationConstants.splashlogo, repeat: false),
      ),
    );
  }
}

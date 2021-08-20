import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appfinal/Firebase_file.dart';
import 'package:flutter_appfinal/homeScreen.dart';
import 'package:flutter_appfinal/introScreen.dart';

class Splash extends StatelessWidget {
  Widget screen=FireAuth.save_login()==null? IntroScreen():HomeScreen();
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Icons.shopping_cart_outlined,
      splashIconSize: 130,
      nextScreen: IntroScreen(),
      duration: 1800,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.indigo,
    );
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fixall/pages/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/fondo.png',
            ).image,
          ),
        ),
        child: AnimatedSplashScreen(
            duration: 5000,
            splashIconSize: 300,
            splash: Column(
              children: [
                Expanded(child: Image.asset('assets/logo1.png')),
              ],
            ),
            backgroundColor: Colors.transparent,
            nextScreen: const NextPage()),
      ),
    );
  }
}

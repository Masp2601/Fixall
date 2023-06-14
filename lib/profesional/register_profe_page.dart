import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fixall/profesional/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';

class RegisterPageOk extends StatefulWidget {
  const RegisterPageOk({super.key});

  @override
  State<RegisterPageOk> createState() => _RegisterPageOkState();
}

class _RegisterPageOkState extends State<RegisterPageOk> {
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
              'assets/fondo2.png',
            ).image,
          ),
        ),
        child: AnimatedSplashScreen(
            duration: 6000,
            splashIconSize: 300,
            splash: Column(
              children: [
                const Text(
                  'Tu cuenta de profesional a sido creada',
                  style: TextStyle(
                      color: Color.fromRGBO(222, 122, 16, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20),
                ),
                const Text(
                  'exitosamente',
                  style: TextStyle(
                      color: Color.fromRGBO(222, 122, 16, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20),
                ),
                Expanded(child: Image.asset('assets/circle_check_outline.png')),
              ],
            ),
            backgroundColor: Colors.transparent,
            nextScreen: const MainScreen()),
      ),
    );
  }
}

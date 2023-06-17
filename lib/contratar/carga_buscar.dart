import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fixall/contratar/filtro.dart';
import 'package:flutter/material.dart';

class BuscarOk extends StatefulWidget {
  const BuscarOk({super.key});

  @override
  State<BuscarOk> createState() => _BuscarOkState();
}

class _BuscarOkState extends State<BuscarOk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
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
                  'Buscando profesional',
                  style: TextStyle(
                      color: Color.fromRGBO(222, 122, 16, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/ellipse.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/ellipse.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset('assets/ellipse.png'),
                  ],
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            nextScreen: const FiltroPage()),
      ),
    );
  }
}

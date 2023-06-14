import 'package:fixall/profesional/number_page_yape.dart';
import 'package:fixall/profesional/tarjeta_credito.dart';
import 'package:fixall/profesional/tarjeta_debito.dart';
import 'package:flutter/material.dart';

class ChangePwProfe extends StatefulWidget {
  const ChangePwProfe({super.key});

  @override
  State<ChangePwProfe> createState() => _ChangePwProfeState();
}

class _ChangePwProfeState extends State<ChangePwProfe> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cambiarButton = SizedBox.fromSize(
      size: Size(450, 66), // button width and height
      child: ClipRRect(
        child: Material(
          color: Colors.transparent, // button color
          child: InkWell(
            splashColor: Colors.transparent, // splash color
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const TarjetaDebProfePage()),
                  (route) => false);
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/debito.png') // text
              ],
            ),
          ),
        ),
      ),
    );
    final cuentasButton = SizedBox.fromSize(
      size: Size(450, 66), // button width and height
      child: ClipRRect(
        child: Material(
          color: Colors.transparent, // button color
          child: InkWell(
            splashColor: Colors.transparent, // splash color
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const TarjetaProfePage()),
                  (route) => false);
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/credito.png') // text
              ],
            ),
          ),
        ),
      ),
    );
    final logoutButton = SizedBox.fromSize(
      size: Size(450, 66), // button width and height
      child: ClipRRect(
        child: Material(
          color: Colors.transparent, // button color
          child: InkWell(
            splashColor: Colors.transparent, // splash color
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const NumberYapeProfePage(
                            verificationId: '',
                          )),
                  (route) => false);
            }, // button pressed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 50,
                ),
                Image.asset('assets/yape.png'),
                const SizedBox(
                  width: 35,
                ),
                const Text(
                  'Yape',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 18),
                ) // text
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Tipo de Tarjeta',
          style: TextStyle(
              color: Color.fromRGBO(255, 150, 36, 1),
              fontSize: 16,
              fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset(
              'assets/fondo2.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            cambiarButton,
            const SizedBox(height: 15),
            cuentasButton,
            const SizedBox(height: 5),
            logoutButton,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 239, 245, 1),
                  border: Border.all(color: Colors.transparent, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

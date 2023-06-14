import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/profesional/login_page_profe.dart';
import 'package:flutter/material.dart';

class ForgotProfePasswordPage extends StatefulWidget {
  const ForgotProfePasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotProfePasswordPage> createState() =>
      _ForgotProfePasswordPageState();
}

class _ForgotProfePasswordPageState extends State<ForgotProfePasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('vinculo enviado con exito a tu correo'),
          );
        },
      );
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => LoginProfePage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      //print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Ingrese su correo electronico para reiniciar su contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(36, 107, 246, 1)),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            //correo electronico usuario
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Correo Electronico',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //boton para reiniciar contraseña
            MaterialButton(
              onPressed: passwordReset,
              color: const Color.fromRGBO(255, 150, 36, 1),
              child: const Text('Reiniciar Contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}

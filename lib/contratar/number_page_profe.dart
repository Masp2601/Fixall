import 'package:fixall/auth/provider/auth_provider.dart';
import 'package:fixall/contratar/register_page.dart';
import 'package:fixall/profesional/register_page_profe.dart';
import 'package:fixall/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class NumberPage extends StatefulWidget {
  final String verificationId;
  const NumberPage({super.key, required this.verificationId});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  //form key
  final _formKey = GlobalKey<FormState>();
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    //signup button
    final loginButton = Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: const Color.fromRGBO(222, 122, 16, 1),
            width: 1,
            style: BorderStyle.solid),
        color: const Color.fromRGBO(242, 137, 32, 0.1),
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'Confirmar',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          if (otpCode != null) {
            verifyOtp(context, otpCode!);
          } else {
            showSnackBar(context, "Ingresa 6 digitos");
          }
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const RegisterPageOk();
              },
            ),
          );*/
        }),
      ),
    );
    //end of signup button
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(222, 122, 16, 1),
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 205, 40, 0),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  "assets/logo1.png",
                                  fit: BoxFit.contain,
                                )),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Text(
                                  'BIENVENIDO',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Text(
                              'Verificacion de télefono',
                              style: TextStyle(
                                  color: Color.fromRGBO(36, 107, 246, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 18),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Te hemos enviado un SMS",
                              style: TextStyle(
                                  color: Color.fromRGBO(222, 122, 16, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                            const Text(
                              "con un código de verificación",
                              style: TextStyle(
                                  color: Color.fromRGBO(222, 122, 16, 1),
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            Pinput(
                              length: 6,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(222, 122, 16, 1),
                                    )),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(222, 122, 16, 1),
                                ),
                              ),
                              onCompleted: (value) {
                                setState(() {
                                  otpCode = value;
                                });
                              },
                            ),
                            const SizedBox(height: 15),
                            loginButton,
                            const SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 105, 0, 0),
                              child: Column(
                                children: [
                                  const Text(
                                    '¿No recibiste el código?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Poppins'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterProfePage();
                                  },
                                ),
                              );
                                    },
                                    child: const Text(
                                      'Enviar otra vez',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(255, 150, 36, 1),
                                          fontSize: 14,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  //verificar otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSucces: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterConPageOk()),
                  (route) => false);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterConPageOk()),
                  (route) => false);
            }
          });
        });
  }
}

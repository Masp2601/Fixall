import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/contratar/carga_buscar.dart';

import 'package:flutter/material.dart';

class ContratoPage extends StatefulWidget {
  const ContratoPage({Key? key}) : super(key: key);

  @override
  State<ContratoPage> createState() => _ContratoPageState();
}

class _ContratoPageState extends State<ContratoPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        //controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor introduzca su correo electrónico");
          }
          //regExp for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por favor introduzca una dirección de correo electrónico válida");
          }
          return null;
        },
        onSaved: (value) {
          //emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: const Color.fromRGBO(251, 251, 251, 1),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Plomero",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Plomero",
          labelStyle: const TextStyle(color: Color.fromRGBO(145, 144, 144, 1)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(222, 122, 16, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/fondo3.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //imagen
                  children: [
                    const Text('HOLA',
                        style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(251, 251, 251, 1),
                            fontWeight: FontWeight.bold)),
                    const Text('BIENVENIDO',
                        style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(251, 251, 251, 1),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text('Personalizar filtro',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 150, 36, 1),
                            fontWeight: FontWeight.normal)),
                    const SizedBox(height: 15),
                    emailField,
                    const SizedBox(
                      height: 25.0,
                    ),
                    Image.asset('assets/lista.png'),
                    //loguiarse cliente
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BuscarOk()));
                      },
                      child: Container(
                        width: 130.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(222, 122, 16, 1),
                          border: Border.all(
                              color: const Color.fromRGBO(222, 122, 16, 1),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Ver todo',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.white60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

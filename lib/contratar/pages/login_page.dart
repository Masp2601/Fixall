import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/contratar/page_item_frame.dart';
import 'package:fixall/contratar/pages/register_page.dart';
import 'package:fixall/profesional/forgot_pw_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
     //email field
    final emailField = TextFormField(
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        controller: emailController,
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
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: const Color.fromRGBO(242, 137, 32, 0.1),
          filled: true,
          suffixIcon: const Icon(Icons.mail_outline,
              color: Color.fromRGBO(145, 144, 144, 1)),
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Correo Electronico",
          hintStyle: const TextStyle(color: Colors.white),
          labelText: "Correo Electronico",
          labelStyle: const TextStyle(color: Color.fromRGBO(145, 144, 144, 1)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromRGBO(222, 122, 16, 1),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ));
    //end of email field

    //password field
    final passwordField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Se requiere contraseña para iniciar sesión");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese una contraseña válida (mínimo 6 caracteres)");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(242, 137, 32, 0.1),
        filled: true,
        suffixIcon: const Icon(
          Icons.remove_red_eye,
          color: Color.fromRGBO(145, 144, 144, 1),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contraseña",
        labelText: "Contraseña",
        labelStyle: const TextStyle(color: Color.fromRGBO(145, 144, 144, 1)),
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
    //end of password field
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
          'Entrar',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          signIn(emailController.text, passwordController.text);
        }),
      ),
    );
    //end of signup button
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/fondo1.png',
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
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Text(
                      '¡Hola de nuevo!',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 36),
                    ),
                    const SizedBox(height: 15),
                    emailField,
                    const SizedBox(height: 15),
                    passwordField,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgotProfePasswordPage();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 150, 36, 1),
                                  fontSize: 10,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    loginButton,
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/Facebook.png',
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 30.0,
                          height: 30.0,
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset('assets/Google.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Inicia con",
                          style: TextStyle(
                              color: Color.fromRGBO(222, 122, 16, 1),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    //registrarse trabajador
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Row(
                        children: [
                          const Text(
                            '¿Necesitas una cuenta?',
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
                                    return const RegisterPage();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Registrate aquí',
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 150, 36, 1),
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
      )),
    );
  }

//login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Exitoso"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const NextFramePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage =
                "Su dirección de correo electrónico parece estar mal formada.";

            break;
          case "wrong-password":
            errorMessage = "Tu contraseña es incorrecta.";
            break;
          case "user-not-found":
            errorMessage = "El usuario con este correo electrónico no existe.";
            break;
          case "user-disabled":
            errorMessage =
                "El usuario con este correo electrónico ha sido deshabilitado.";
            break;
          case "too-many-requests":
            errorMessage = "demasiadas solicitudes";
            break;
          case "operation-not-allowed":
            errorMessage =
                "El inicio de sesión con correo electrónico y contraseña no está habilitado.";
            break;
          default:
            errorMessage = "Ocurrió un error indefinido.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }
}

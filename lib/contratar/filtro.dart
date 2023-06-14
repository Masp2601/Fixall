import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/contratar/profile_cont.dart';
import 'package:flutter/material.dart';

class FiltroPage extends StatefulWidget {
  const FiltroPage({Key? key}) : super(key: key);

  @override
  State<FiltroPage> createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    /*final emailField = TextFormField(
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
        ));*/
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
                'assets/fondo4.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //imagen
                  children: [
                    SizedBox.fromSize(
                      size: Size(456, 750), // button width and height
                      child: ClipRRect(
                        child: Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            splashColor: Colors.transparent, // splash color
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilecontPage()),
                                  (route) => false);
                            }, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/filatodo.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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

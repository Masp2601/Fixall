import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/auth/provider/auth_provider.dart';
import 'package:fixall/contratar/pages/login_page.dart';
import 'package:fixall/models/clients_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;

  //form key
  final _formKey = GlobalKey<FormState>();

  @override
  //editing controller
  final firstNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final telefonoEditingController = TextEditingController();
  final paisEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "51",
    countryCode: "PE",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Peru",
    example: "Peru",
    displayName: "Peru",
    displayNameNoCountryCode: "PE",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("El nombre no puede estar vacío");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese su nombre (mínimo 3 letras)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nombre Completo",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of first name field

    //email field
    final emailField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su correo electrónico");
        }
        //regExp for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Por favor introduzca una dirección de correo electrónico válida");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of email field
    //email field
    final telefonoField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: telefonoEditingController,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su movil");
        }
        //regExp for email validation
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return ("Por favor introduzca un movil válido ");
        }
        return null;
      },
      onSaved: (value) {
        telefonoEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Teléfono",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              showCountryPicker(
                  context: context,
                  countryListTheme:
                      const CountryListThemeData(bottomSheetHeight: 500),
                  onSelect: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  });
            },
            child: Text(
              "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
    //end of email field
    //email field
    final sexoField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: paisEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su pais");
        }
        //regExp for email validation
        if (!RegExp(r'^.{4,}$').hasMatch(value)) {
          return ("Por favor introduzca un pais válido");
        }
        return null;
      },
      onSaved: (value) {
        paisEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "País",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of email field

    //password field
    final passwordField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
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
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Contraseña",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of password field

    //confirm password field
    final confirmPasswordField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "La contraseña no coincide";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromRGBO(222, 122, 16, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirmar Contraseña",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of confirm password field

    //signup button
    final signupButton = Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: const Color.fromRGBO(222, 122, 16, 1),
            width: 1,
            style: BorderStyle.solid),
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'Registrar',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          signUp(emailEditingController.text, passwordEditingController.text);
        }),
      ),
    );
    //end of signup button
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/fondo2.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/logo1.png",
                        fit: BoxFit.contain,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Ya casi terminas',
                    style: TextStyle(
                        color: Color.fromRGBO(36, 107, 246, 1),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 5),
                  firstNameField,
                  const SizedBox(height: 5),
                  emailField,
                  const SizedBox(height: 5),
                  telefonoField,
                  const SizedBox(height: 5),
                  sexoField,
                  const SizedBox(height: 5),
                  passwordField,
                  const SizedBox(height: 5),
                  confirmPasswordField,
                  const SizedBox(height: 5),
                  signupButton,
                  const SizedBox(height: 5),
                  const Text(
                    'Registro con',
                    style: TextStyle(
                      color: Color.fromRGBO(222, 122, 16, 1),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
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
                        width: 10,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Si ya tienes una cuenta",
                        style: TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          "Inicia sesión aquí",
                          style: TextStyle(
                              color: Color.fromRGBO(222, 122, 16, 1),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    ClientsModel userModel = ClientsModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.email = emailEditingController.text;
    userModel.telefono = telefonoEditingController.text;
    userModel.pais = paisEditingController.text;
    userModel.saldo = '0';
    userModel.password = passwordEditingController.text;

    await firebaseFirestore
        .collection("clients")
        .doc(user.uid)
        .set(userModel.toMap());
    //Fluttertoast.showToast(msg: "Cuenta Creada");
    sendPhoneNumber();

    /*Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => numberProfePage(verificationId: verificationId,)),
        (route) => false);*/
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = telefonoEditingController.text.trim();
    ap.signInWithPhoneCon(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}

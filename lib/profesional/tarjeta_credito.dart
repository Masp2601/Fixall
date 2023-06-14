import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/models/user_model.dart';
import 'package:fixall/profesional/code_ok%20_tarjeta.dart';
import 'package:fixall/profesional/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TarjetaProfePage extends StatefulWidget {
  const TarjetaProfePage({Key? key}) : super(key: key);

  @override
  State<TarjetaProfePage> createState() => _TarjetaProfePageState();
}

//editing controller
final firstNameEditingController = TextEditingController();
final emailEditingController = TextEditingController();
final telefonoEditingController = TextEditingController();
final tipoDocumentEditingController = TextEditingController();
final documentEditingController = TextEditingController();
final ocupacionesEditingController = TextEditingController();
final paisEditingController = TextEditingController();
final ciudadEditingController = TextEditingController();
final fechaEditingControler = TextEditingController();
final sexoEditingController = TextEditingController();
final _auth = FirebaseAuth.instance;

class _TarjetaProfePageState extends State<TarjetaProfePage> {
  @override
  void initState() {
    super.initState();
    firstNameEditingController.clear();
    emailEditingController.clear();
    telefonoEditingController.clear();
    tipoDocumentEditingController.clear();
    documentEditingController.clear();
    ocupacionesEditingController.clear();
    paisEditingController.clear();
    ciudadEditingController.clear();
    fechaEditingControler.clear();
    sexoEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
        labelText: "Nombre",
        labelStyle: const TextStyle(
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
        labelText: "Apellido",
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of email field
    final tipoDocument = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: tipoDocumentEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("El Tipo de Documento es necesario");
        }
        if (!regex.hasMatch(value)) {
          return ("Ingrese el tipo (mínimo 2 letras)");
        }
        return null;
      },
      onSaved: (value) {
        tipoDocumentEditingController.text = value!;
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
        labelText: "CC",
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of first name field
    final documentoField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: documentEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su documento");
        }
        //regExp for email validation
        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
          return ("Por favor introduzca un documento válido");
        }
        return null;
      },
      onSaved: (value) {
        documentEditingController.text = value!;
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
        labelText: "No de Documento",
        labelStyle: const TextStyle(
          fontSize: 14,
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
    final ocupacionField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: ocupacionesEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su ocupación");
        }
        //regExp for email validation
        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
          return ("Por favor introduzca una ocupación");
        }
        return null;
      },
      onSaved: (value) {
        ocupacionesEditingController.text = value!;
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
        labelText: "Email",
        labelStyle: const TextStyle(
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
    final paisField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: paisEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su pais");
        }
        //regExp for email validation
        if (!RegExp(r'^.{6,}$').hasMatch(value)) {
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
        labelText: "Caducidad",
        labelStyle: const TextStyle(
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
    final ciudadField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: ciudadEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su ciudad");
        }
        //regExp for email validation
        if (!RegExp(r'^.{3,}$').hasMatch(value)) {
          return ("Por favor introduzca una ciudad válida");
        }
        return null;
      },
      onSaved: (value) {
        ciudadEditingController.text = value!;
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
        labelText: "CVV",
        labelStyle: const TextStyle(
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
    final fechaField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: fechaEditingControler,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su fecha");
        }
        //regExp for email validation
        if (!RegExp(r'^.{4,}$').hasMatch(value)) {
          return ("Por favor introduzca una fecha válida");
        }
        return null;
      },
      onSaved: (value) {
        fechaEditingControler.text = value!;
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
        labelText: "Telefono",
        labelStyle: const TextStyle(
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
    final sexoField = TextFormField(
      style: const TextStyle(color: Colors.white),
      autofocus: false,
      controller: sexoEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Por favor introduzca su sexo");
        }
        //regExp for email validation
        if (!RegExp(r'^.{4,}$').hasMatch(value)) {
          return ("Por favor introduzca un sexo válido");
        }
        return null;
      },
      onSaved: (value) {
        sexoEditingController.text = value!;
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
        labelText: "Número de tarjeta",
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //end of email field
    final signupButton = Container(
      height: 60,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.transparent, width: 1, style: BorderStyle.solid),
        color: const Color.fromRGBO(242, 137, 32, 1),
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'Guardar',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const CodeTarjetaPageOk()),
              (route) => false);
          //postDetailsToFirestore();
          setState(() {
            firstNameEditingController.clear();
            emailEditingController.clear();
            telefonoEditingController.clear();
            tipoDocumentEditingController.clear();
            documentEditingController.clear();
            ocupacionesEditingController.clear();
            paisEditingController.clear();
            ciudadEditingController.clear();
            fechaEditingControler.clear();
            sexoEditingController.clear();
          });
        }),
      ),
    );
    //end of signup button
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Nueva Tarjeta de Crédito'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Color.fromRGBO(255, 150, 36, 1),
            fontSize: 18,
            fontFamily: 'Poppins'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.asset(
              'assets/fondo2.png',
            ).image,
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  firstNameField,
                  const SizedBox(height: 5),
                  emailField,
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(child: tipoDocument),
                      const SizedBox(width: 5),
                      Expanded(child: documentoField)
                    ],
                  ),
                  const SizedBox(height: 5),
                  ocupacionField,
                  const SizedBox(height: 5),
                  fechaField,
                  const SizedBox(height: 5),
                  sexoField,
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(child: paisField),
                      const SizedBox(width: 5),
                      Expanded(child: ciudadField)
                    ],
                  ),
                  const SizedBox(height: 25),
                  signupButton,
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.email = emailEditingController.text;
    userModel.telefono = telefonoEditingController.text;
    userModel.pais = paisEditingController.text;
    userModel.saldo = '0';
    userModel.tipo = tipoDocumentEditingController.text;
    userModel.documento = documentEditingController.text;
    userModel.ocupaciones = ocupacionesEditingController.text;
    userModel.ciudad = ciudadEditingController.text;
    userModel.fecha = fechaEditingControler.text;
    userModel.sexo = sexoEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .update(userModel.toMap());
    Fluttertoast.showToast(msg: "Cuenta Actualizada");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false);
  }
}

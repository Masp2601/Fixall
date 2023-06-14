import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixall/models/user_model.dart';
import 'package:fixall/profesional/change_pw.dart';
import 'package:fixall/profesional/forgot_pw_page.dart';
import 'package:fixall/profesional/mainscreen/main_screen.dart';
import 'package:fixall/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';

class ProfileProfePage extends StatefulWidget {
  const ProfileProfePage({Key? key}) : super(key: key);

  @override
  State<ProfileProfePage> createState() => _ProfileProfePageState();
}

File? pickedImage;
pickImage(ImageSource imageType) async {
  try {
    final photo = await ImagePicker().pickImage(source: imageType);
    if (photo == null) return;
  } catch (error) {
    debugPrint(error.toString());
  }
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

//Seleccionar indicativo
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

class _ProfileProfePageState extends State<ProfileProfePage> {
  //agregar imagenes de adelante y atras
  File? file;
  ImagePicker image = ImagePicker();
  String url = "";
  String? name;
  var color1 = Colors.redAccent[700];
  String? imageDpiAnverso;
  String? imageDpiReverso;
//Anverso
  getImage() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFileA();
    } else {
      return const Text("Seleccione una imagen");
    }
  }

  getImagePick() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFileA();
    }
  }

  uploadFileA() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("users")
          .child("Anverso")
          .child("anverso_$name.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      //print(url);
      if (file != null) {
        Fluttertoast.showToast(
          msg: "anverso agregado felicidades.",
          textColor: Colors.red,
        );
      } else {
        Fluttertoast.showToast(
          msg: "anverso no se agrego.",
          textColor: Colors.red,
        );
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.red,
      );
    }
  }

  opcionesAnverso(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Seleccione una opcion:'),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  /*InkWell(
                    onTap: () {
                      getImage();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),*/
                  InkWell(
                    onTap: () {
                      getImagePick();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Seleccionar una imagen',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.image_outlined,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Reverso
  getImageR() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFileR();
    } else {
      return const Text("Seleccione una imagen");
    }
  }

  getImagePickR() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFileR();
    }
  }

  uploadFileR() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("users")
          .child("Reverso")
          .child("reverso_$name.jpg");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      // print(url);
      if (file != null) {
        Fluttertoast.showToast(
          msg: "reverso agregado felicidades.",
          textColor: Colors.red,
        );
      } else {
        Fluttertoast.showToast(
          msg: "reverso no se agrego.",
          textColor: Colors.red,
        );
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.red,
      );
    }
  }

  opcionesReverso(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Seleccione una opcion:'),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  /*InkWell(
                    onTap: () {
                      getImageR();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),*/
                  InkWell(
                    onTap: () {
                      getImagePickR();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Seleccionar una imagen',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.image_outlined,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
        labelText: "Nombre Completo",
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
        labelText: "Teléfono",
        labelStyle: const TextStyle(
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
        labelText: "Tipo",
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
        labelText: "Ocupaciones",
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
        labelText: "País",
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
        labelText: "Ciudad",
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
        labelText: "Fecha de nacimiento",
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
        labelText: "Sexo",
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
    //boton anverso
    final adelanteButton = Container(
      height: 55,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.scaleDown,
          image: Image.asset(
            'assets/mas.png',
          ).image,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromRGBO(222, 122, 16, 1),
            width: 1,
            style: BorderStyle.solid),
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          textAlign: TextAlign.center,
          'FOTO ADELANTE',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          opcionesAnverso(context);
        }),
      ),
    );
    //boton reverso
    final detrasButton = Container(
      height: 55,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          fit: BoxFit.scaleDown,
          image: Image.asset(
            'assets/mas.png',
          ).image,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color.fromRGBO(222, 122, 16, 1),
            width: 1,
            style: BorderStyle.solid),
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'FOTO DETRAS',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          opcionesReverso(context);
        }),
      ),
    );
    //signup button
    final signupButton = Container(
      height: 40,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.transparent, width: 1, style: BorderStyle.solid),
        color: const Color.fromRGBO(71, 114, 250, 1),
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
          postDetailsToFirestore();
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
    final cambiarButton = Container(
      height: 40,
      width: 450,
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
          'Cambiar Contraseña',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(
                  builder: (context) => const ForgotProfePasswordPage()),
              (route) => false);
        }),
      ),
    );
    final cuentasButton = Container(
      height: 40,
      width: 450,
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
          'Mis Cuentas',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          Navigator.push(
            (context),
            MaterialPageRoute(builder: (context) => const ChangePwProfe()),
          );
        }),
      ),
    );
    final logoutButton = Container(
      height: 40,
      width: 450,
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
          'Salir',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromRGBO(255, 67, 91, 1),
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          FirebaseAuth.instance.signOut().then((value) => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => const SplashScreen())));
          /*SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const SplashScreen()));*/
        }),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(113, 121, 146, 1),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(36, 107, 246, 1),
                          width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/fixall-b48e5.appspot.com/o/tecnico.png?alt=media&token=53b0236c-57fe-450a-ac3e-a709a5ed9fb1&_gl=1*11orgen*_ga*NjA1NTM1MDg3LjE2ODQxOTA5NjU.*_ga_CW55HF8NVT*MTY4NTk5Mzg5Mi4xNy4xLjE2ODU5OTUyMzguMC4wLjA.',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'INFORMACIÓN PERSONAL',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      firstNameField,
                      const SizedBox(height: 5),
                      emailField,
                      const SizedBox(height: 5),
                      telefonoField,
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
                      Row(
                        children: [
                          Expanded(child: paisField),
                          const SizedBox(width: 5),
                          Expanded(child: ciudadField)
                        ],
                      ),
                      const SizedBox(height: 5),
                      fechaField,
                      const SizedBox(height: 5),
                      sexoField,
                      const SizedBox(height: 35),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Carga tu foto de documento',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'de identidad en alta calidad',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(child: adelanteButton),
                          const SizedBox(width: 5),
                          Expanded(child: detrasButton)
                        ],
                      ),
                      const SizedBox(height: 25),
                      signupButton,
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 137, 32, 1),
                          border:
                              Border.all(color: Colors.transparent, width: 5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 15),
                      cambiarButton,
                      const SizedBox(height: 15),
                      cuentasButton,
                      const SizedBox(height: 5),
                      logoutButton,
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 137, 32, 1),
                          border:
                              Border.all(color: Colors.transparent, width: 10),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Terminos y condiciones',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(131, 131, 131, 1),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
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

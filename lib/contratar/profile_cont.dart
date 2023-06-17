import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixall/contratar/contrato.dart';
import 'package:fixall/contratar/filtro.dart';
import 'package:fixall/models/user_model.dart';
import 'package:fixall/profesional/change_pw.dart';
import 'package:fixall/profesional/forgot_pw_page.dart';
import 'package:fixall/profesional/mainscreen/main_screen.dart';
import 'package:fixall/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';

class ProfilecontPage extends StatefulWidget {
  const ProfilecontPage({Key? key}) : super(key: key);

  @override
  State<ProfilecontPage> createState() => _ProfilecontPageState();
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

class _ProfilecontPageState extends State<ProfilecontPage> {
  final user = FirebaseAuth.instance;

  UserModel userModel = UserModel();
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

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    final nameUser = SizedBox(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: userModel.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Un error ocurrio al traer la data');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Cargando datos');
          }
          final data = snapshot.requireData;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.size,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(
                    '${data.docs[index]['firstName']}',
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 150, 36, 1),
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 2, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Ubicacion:',
                          style: TextStyle(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${data.docs[index]['pais']}',
                          style: const TextStyle(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Puntuación:',
                    style: TextStyle(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(170, 5, 0, 0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/estrella_verde.png',
                        ),
                        Image.asset(
                          'assets/estrella_verde.png',
                        ),
                        Image.asset(
                          'assets/estrella_verde.png',
                        ),
                        Image.asset(
                          'assets/estrella_gris.png',
                        ),
                        Image.asset(
                          'assets/estrella_gris.png',
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
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
        color: const Color.fromRGBO(222, 122, 16, 1),
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'Volver a lista',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const FiltroPage()),
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
        color: const Color.fromRGBO(222, 122, 16, 1),
        shape: BoxShape.rectangle,
      ),
      child: TextButton(
        child: const Text(
          'Contratar',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        onPressed: (() {
          /*Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const ContratoPage()),
              (route) => false);*/
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
          height: MediaQuery.of(context).size.height,
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            'PLOMERO >',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: nameUser,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 150.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color.fromRGBO(242, 137, 32, 0.1),
                          border: Border.all(
                              color: const Color.fromRGBO(222, 122, 16, 1),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buscar',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white60),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            initialCameraPosition: _kGooglePlex,
                            onMapCreated: (GoogleMapController controller) {
                              _controllerGoogleMap.complete(controller);
                              newGoogleMapController = controller;
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    cambiarButton,
                    const SizedBox(height: 15),
                    cuentasButton,
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

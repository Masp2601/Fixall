import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixall/models/user_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeProfePage extends StatefulWidget {
  const HomeProfePage({super.key});

  @override
  State<HomeProfePage> createState() => _HomeProfePageState();
}

class _HomeProfePageState extends State<HomeProfePage> {
  final user = FirebaseAuth.instance;

  UserModel userModel = UserModel();

  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Container(
                        height: 62,
                        width: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: const Color.fromRGBO(36, 107, 246, 1),
                              width: 4,
                              style: BorderStyle.solid),
                          color: const Color.fromRGBO(255, 255, 255, 0.35),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .where('uid', isEqualTo: user.currentUser!.uid)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text(
                                  'Un error ocurrio al traer la data');
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text('Cargando datos');
                            }
                            final data = snapshot.requireData;

                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.size,
                              itemBuilder: (context, index) {
                                return Text(
                                  'Hola,\n${data.docs[index]['firstName']}',
                                  style: const TextStyle(
                                      color: Color.fromRGBO(255, 150, 36, 1),
                                      fontSize: 26,
                                      fontFamily: 'Poppins'),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: SwitchListTile(
                        activeColor: const Color.fromRGBO(255, 150, 45, 1),
                        activeTrackColor: const Color.fromRGBO(36, 107, 246, 1),
                        hoverColor: const Color.fromRGBO(36, 107, 246, 1),
                        inactiveThumbColor:
                            const Color.fromRGBO(255, 150, 45, 1),
                        inactiveTrackColor:
                            const Color.fromRGBO(36, 107, 246, 1),
                        value: _lights,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 220,
              ),
              const Align(
                alignment: AlignmentDirectional(0, 50),
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 220,
                  color: Color.fromRGBO(117, 128, 150, 1),
                ),
              ),
              const Text(
                'Historial vacio',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

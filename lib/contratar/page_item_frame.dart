import 'package:fixall/contratar/pages/home_page.dart';
import 'package:flutter/material.dart';

class NextFramePage extends StatefulWidget {
  const NextFramePage({Key? key}) : super(key: key);

  @override
  State<NextFramePage> createState() => _NextFramePageState();
}

class _NextFramePageState extends State<NextFramePage> {
  opcionesCategorias(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(255, 150, 36, 1),
            title: const Text(
              'Seleccione una opcion:',
              style: TextStyle(color: Colors.white),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Plomeros',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*InkWell(
                    onTap: () {},
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Mexico',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Colombia',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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

  opcionesAnverso(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromRGBO(255, 150, 36, 1),
            title: const Text(
              'Seleccione una opcion:',
              style: TextStyle(color: Colors.white),
            ),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Peru',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
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
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Mexico',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
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
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Colombia',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
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
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
  Widget build(BuildContext context) {
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
                'assets/fondo1.png',
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
                    Image.asset('assets/herramienta.png'),
                    const Text('QUE BUSCAS',
                        style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(36, 107, 246, 1),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text('Selecciona la categoria de tu interes',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 150, 36, 1),
                            fontWeight: FontWeight.normal)),
                    const SizedBox(
                      height: 25.0,
                    ),
                    //loguiarse cliente
                    InkWell(
                      onTap: () {
                        opcionesCategorias(context);
                      },
                      child: Container(
                        width: 250.0,
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
                              'Categorias',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white60),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(
                              Icons.tornado_sharp,
                              color: Color.fromRGBO(222, 122, 16, 1),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        opcionesAnverso(context);
                      },
                      child: Container(
                        width: 250.0,
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
                              'Selecciona tu país',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white60),
                            ),
                            SizedBox(
                              width: 55,
                            ),
                            Icon(
                              Icons.tornado_sharp,
                              color: Color.fromRGBO(222, 122, 16, 1),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
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

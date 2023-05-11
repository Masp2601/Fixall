import 'package:fixall/pages/login_page.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //imagen
            children: [
              Image.asset('assets/obrero.png'),
              const Text('BIENVENIDOS',
                  style: TextStyle(
                      fontSize: 36,
                      color: Color.fromRGBO(36, 107, 246, 1),
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5.0,
              ),
              const Text('NO PIERDAS TIEMPO LLEGAMOS A TIEMPO',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 130.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 137, 32, 0.1),
                    border: Border.all(
                        color: const Color.fromRGBO(222, 122, 16, 1),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Contratar',
                      style: TextStyle(fontSize: 14.0, color: Colors.white60),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //Loguiarse trabajador
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 130.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 137, 32, 0.1),
                    border: Border.all(
                        color: const Color.fromRGBO(222, 122, 16, 1),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Trabajar',
                      style: TextStyle(fontSize: 14.0, color: Colors.white60),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

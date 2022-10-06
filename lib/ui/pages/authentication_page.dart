import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

// una interfaz muy sencilla en la que podemos crear los tres usuarios (signup)
// y después logearse (login) con cualquiera de las tres

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);
  final AuthenticationController authenticationController = Get.find();

  void signIn() async {
    try {
      // aquí creamos los tres usuarios
      await authenticationController.signup('user_a@mintinc.edu.co', '123456');
      await authenticationController.signup('user_b@mintinc.edu.co', '123456');
      await authenticationController.signup('user_c@mintinc.edu.co', '123456');
    } catch (e) {
      print('usuarios existen');
    }
  }

  void login(String user) {
    // método usado para login
    authenticationController.login(user, '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 7.0),
          child: Image(
            image: AssetImage('assets/images/icon.png'),
          ),
        ),
        title: const Text(
          "MinTiChat - Autenticación",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(30, 38, 73, 1),
                            ),
                            onPressed: signIn,
                            child: const Text("Crear los tres usuarios"),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Antes de crear los usuarios, borrar todos los usuarios del sistema de autenticación y la base de datos de tiempo real de firebase',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(30, 38, 73, 1),
                                ),
                                onPressed: () => login('user_a@mintinc.edu.co'),
                                child: const Text("Ingresar con usuario A")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(30, 38, 73, 1),
                                ),
                                onPressed: () => login('user_a@mintinc.edu.co'),
                                child: const Text("Ingresar con usuario B")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(30, 38, 73, 1),
                                ),
                                onPressed: () => login('user_a@mintinc.edu.co'),
                                child: const Text("Ingresar con usuario C")),
                          ]),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

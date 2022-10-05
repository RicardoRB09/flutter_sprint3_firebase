import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_controller.dart';

// una interfaz muy sencilla en la que podemos crear los tres usuarios (signup)
// y después logearse (login) con cualquiera de las tres

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key? key}) : super(key: key);
  final AuthenticationController authenticationController = Get.find();

  List<String> usuarios = ["a@a.com", "b@b.com", "c@c.com"];
  String contrasenaComun = "123456";

  void signIn() async {
    for (var usuario in usuarios) {
      try {
        // aquí creamos los tres usuarios
        await authenticationController.signup(usuario, contrasenaComun);
      } catch (e) {
        print('usuarios existen');
      }
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
                        color: Colors.blue.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: signIn,
                          child: const Text("Crear los tres usuarios"),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Antes de crear los usuarios, borrar todos los usuarios del sistema de autenticación y la base de datos de tiempo real de firebase',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () => login(usuarios[0]),
                                child: const Text("Ingresar con usuario A")),
                            ElevatedButton(
                                onPressed: () => login(usuarios[1]),
                                child: const Text("Ingresar con usuario B")),
                            ElevatedButton(
                                onPressed: () => login(usuarios[2]),
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

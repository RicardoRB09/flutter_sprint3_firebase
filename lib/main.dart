import 'package:f_chat_template/ui/controllers/authentication_controller.dart';
import 'package:f_chat_template/ui/controllers/chat_controller.dart';
import 'package:f_chat_template/ui/controllers/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'config/configuration.dart';
import 'ui/my_app.dart';

Future<void> main() async {
  // this is the key
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  // Aquí nos conectamos a los servicios de firebase
  await Firebase.initializeApp(
    name: 'Group7chat',
    options: const FirebaseOptions(
      apiKey: Configuration.apiKey,
      authDomain: Configuration.authDomain,
      databaseURL: Configuration.databaseURL,
      projectId: Configuration.projectId,
      storageBucket: Configuration.storageBucket,
      messagingSenderId: Configuration.messagingSenderId,
      appId: Configuration.appId,
      measurementId: Configuration.measurementId,
    ),
  );

  // await Firebase.initializeApp();

  //Se inyectan los controladores
  Get.put(AuthenticationController());
  Get.put(ChatController());
  Get.put(UserController());

  runApp(const MyApp());
}

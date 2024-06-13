import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pollapk/firebase_options.dart';
import 'package:pollapk/views/Login/light_mode.dart';
import 'package:pollapk/views/components/auth_gate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'controllers/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  Get.put(HomeController()); // Initialize the HomeController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      // home: HomePage(),
      theme: lightMode,
    );
  }
}
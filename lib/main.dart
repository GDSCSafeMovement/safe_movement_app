import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_movement_app/firebase_options.dart';

import 'screen/intro_screen.dart';

void main() async {
  // Firebase Setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase Emulator
  if (kDebugMode) {
    print("------ DEBUG MODE ------");

    try {
      // Firebase Emulators Setup
      FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8080);
      await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);

      // Make a test user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: "test@test.com", password: "12345678");

    } catch (error) {
      print(error);
    }
  }

  // Run App
  runApp(const SafeMovementApp());
}

class SafeMovementApp extends StatelessWidget {
  const SafeMovementApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const IntroScreen(),
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
    );
  }
}

// Flutter packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_movement_app/firebase_options.dart';

// Google Maps packages
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

// Flutter Lorem (Sample Texts)
import 'package:flutter_lorem/flutter_lorem.dart';

import 'screen/intro_screen.dart';
import './model/drone_request_post.dart';
import './model/safe_movement_news.dart';
import './utility/user.dart';

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

      // Delete all drone request posts
      await DroneRequestPost.deleteAll();

      // Delete all save movement news
      await SafeMovementNews.deleteAll();

      // Add example save movement news
      await SafeMovementNews(title: "Test News 1", content: lorem(words: 500)).add();
      await SafeMovementNews(title: "Test News 2", content: lorem(words: 800)).add();
      await SafeMovementNews(title: "Test News 3", content: lorem(words: 1000)).add();

      // Make a test user
      await signUp("test@test.com", "12345678", "test", "000-0000-0000", "111-1111-1111");

    } catch (error) {
      print(error);
    }
  }

  // Google Maps Flutter
  // NOTE: https://pub.dev/packages/google_maps_flutter_android#display-mode
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
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
      debugShowCheckedModeBanner: false,
    );
  }
}

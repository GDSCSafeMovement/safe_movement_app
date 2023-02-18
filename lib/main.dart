import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/intro_screen.dart';

void main() {
  runApp(const SafeMovementApp());
}

class SafeMovementApp extends StatelessWidget {
  const SafeMovementApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: IntroScreen(),
    );
  }
}

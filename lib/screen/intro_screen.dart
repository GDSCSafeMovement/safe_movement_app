import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Save Movement', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text('더욱 안전한 이동을 위하여', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () => {
                  Get.to(SignScreen(initialIndex: 0))
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Sign In'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                onPressed: () => {
                  Get.to(SignScreen(initialIndex: 1))
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


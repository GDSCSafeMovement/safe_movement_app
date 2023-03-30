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
                  Text('Safe Movement', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text('Supporting safe movement for kids', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: FilledButton(
                onPressed: () => {
                  Get.to(SignScreen(initialIndex: 0))
                },
                child: const Text('Sign In'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: FilledButton.tonal(
                onPressed: () => {
                  Get.to(SignScreen(initialIndex: 1))
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


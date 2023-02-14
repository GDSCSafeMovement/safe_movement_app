import 'package:flutter/material.dart';

void main() {
  runApp(const SafeMovementApp());
}

class SafeMovementApp extends StatelessWidget {
  const SafeMovementApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Safe Movement",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

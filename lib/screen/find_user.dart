import 'package:flutter/material.dart';

class FindUserScreen extends StatefulWidget {
  const FindUserScreen({ super.key });

  @override
  State<FindUserScreen> createState() => _FindUserScreenState();
}

class _FindUserScreenState extends State<FindUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Find User"),
        ),
        body: Center(
          child: Text("Find User"),
        ),
      ),
    );
  }
}


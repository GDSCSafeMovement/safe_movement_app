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
          title: const Text("Find User"),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("E-mail"),
                ),
              ),
              const SizedBox(height: 10),
              FilledButton(
                onPressed: () {},
                child: const Text("Find Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
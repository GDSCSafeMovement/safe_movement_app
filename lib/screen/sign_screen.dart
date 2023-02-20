import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './find_user.dart';
class SignScreen extends StatefulWidget {
  const SignScreen({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  @override
  State<SignScreen> createState() => _ScreenScreenState();
}

class _ScreenScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: widget.initialIndex,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Sign In'),
                Tab(text: 'Sign Up'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              _SignInWidget(),   // Sign In
              _SignUpWidget(),   // Sign Up
            ],
          ),
        ),
      ),
    );
  }
}

class _SignInWidget extends StatefulWidget {
  const _SignInWidget();

  @override
  State<_SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<_SignInWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                suffixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                return value!.isEmpty ? "내용을 입력해 주세요!" : null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                suffixIcon: Icon(Icons.key),
              ),
              validator: (value) {
                return value!.isEmpty ? "내용을 입력해 주세요!" : null;
              },
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },    // TODO: Sign In 기능
                child: const Text('Sign In'),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(FindUserScreen());
              },
              child: const Text(
                '도움이 필요하신가요?',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignUpWidget extends StatefulWidget {
  const _SignUpWidget();

  @override
  State<_SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<_SignUpWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Email Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "EmailAdress",
                  suffixIcon: Icon(Icons.email),
                ),
                validator: (value) { return value!.isEmpty ? "내용을 입력해 주세요!" : null; },
              ),
              const SizedBox(height: 50),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  suffixIcon: Icon(Icons.key),
                ),
                validator: (value) { return value!.isEmpty ? "내용을 입력해 주세요!" : null; },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password Check",
                  suffixIcon: Icon(Icons.key),
                ),
                validator: (value) { return value!.isEmpty ? "내용을 입력해 주세요!" : null; },
              ),
              const SizedBox(height: 50),
              const Text(
                'Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Username",
                  suffixIcon: Icon(Icons.person),
                ),
                validator: (value) { return value!.isEmpty ? "내용을 입력해 주세요!" : null; },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  suffixIcon: Icon(Icons.phone),
                ),
                validator: (value) { return value!.isEmpty ? "내용을 입력해 주세요!" : null; },
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },    // TODO: Sign Up 기능
                  child: const Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


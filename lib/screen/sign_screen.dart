import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import './find_user.dart';
import './main_screen.dart';
import '../utility/form_validator.dart';
import '../utility/user.dart';

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
        child: Builder(builder: (BuildContext context) {
          final tabController = DefaultTabController.of(context);

          return Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Sign In'),
                  Tab(text: 'Sign Up'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                _SignInWidget(
                  onSignIn: () {
                    Get.offAll(const MainScreen());
                  },
                ),
                _SignUpWidget(
                  onSignUp: () {
                    // Show dialog
                    Get.defaultDialog(
                      title: "Sign Up",
                      content: Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text("회원가입 성공!"),
                      ),
                    );
                    // Move to sign-in tab
                    tabController.animateTo(0);
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _SignInWidget extends StatefulWidget {
  const _SignInWidget({ this.onSignIn });

  final void Function()? onSignIn;

  @override
  State<_SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<_SignInWidget> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = "";
  String _userPassword = "";

  Future<bool> firebaseSignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _userEmail,
        password: _userPassword,
      );

      return true;

    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

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
              validator: validateEmail,
              onSaved: (value) {
                _userEmail = value!;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                suffixIcon: Icon(Icons.key),
              ),
              validator: validatePassword,
              onSaved: (value) {
                _userPassword = value!;
              },
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: FilledButton(
                onPressed: () async {
                  // Field Validation
                  if (_formKey.currentState!.validate()) {
                    // Save Field Value
                    _formKey.currentState!.save();
                   
                    // Sign In
                    if (await firebaseSignIn()) {
                      // Success
                      if (widget.onSignIn != null) {
                        widget.onSignIn!();
                      }

                    } else {
                      // Failure
                      Get.defaultDialog(
                        title: "Error",
                        content: Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "Username 혹은 Password가\n잘못되었습니다!",
                            textAlign: TextAlign.center,
                          ),
                        )
                      );
                    }
                  }
                },
                child: const Text('Sign In'),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(const FindUserScreen());
              },
              child: Text(
                '도움이 필요하신가요?',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
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
  const _SignUpWidget({ this.onSignUp });

  final void Function()? onSignUp;

  @override
  State<_SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<_SignUpWidget> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = "";
  String _userPassword = "";
  String _userPasswordCheck = "";
  String _userName = "";
  String _userPhoneNumber = "";

  Future<bool> firebaseSignUp() async {
    // Check password check field
    if (_userPassword != _userPasswordCheck) {
      // Failure
      return false;
    }

    // Create new user with firebase authentication
    signUp(_userEmail, _userPassword, _userName, _userPhoneNumber);

    // Success
    return true;
  }

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
                validator: validateEmail,
                onSaved: (value) => { _userEmail = value! },
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
                validator: validatePassword,
                onSaved: (value) => { _userPassword = value! },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password Check",
                  suffixIcon: Icon(Icons.key),
                ),
                validator: validatePassword,
                onSaved: (value) => { _userPasswordCheck = value! },
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
                validator: validateNotBlank,
                onSaved: (value) => { _userName = value! },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  suffixIcon: Icon(Icons.phone),
                ),
                validator: validatePhoneNumber,
                onSaved: (value) => { _userPhoneNumber = value! },
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (await firebaseSignUp()) {
                        if (widget.onSignUp != null) {
                          widget.onSignUp!();
                        }

                      } else {
                        Get.defaultDialog(
                          title: "ERROR",
                          content: Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text("패스워드 확인란이 일치하지 않습니다!"),
                          ),
                        );
                      }
                    }
                  },
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


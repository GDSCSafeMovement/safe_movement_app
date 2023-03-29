import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../utility/form_validator.dart';
import '../../model/drone_request_post.dart';

class DroneRequestFormScreen extends StatefulWidget {
  const DroneRequestFormScreen({ super.key });

  @override
  State<DroneRequestFormScreen> createState() => _DroneRequestFormScreenState();
}

class _DroneRequestFormScreenState extends State<DroneRequestFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                ),
                validator: validateNotBlank,
                onSaved: (value) => {_title = value!},
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Content",
                  ),
                  validator: validateNotBlank,
                  onSaved: (value) => {_content = value!},
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }

                    final user = FirebaseAuth.instance.currentUser;

                    if (user == null) {
                      Get.defaultDialog(
                        title: "Error",
                        content: const Text("You do not have permission to view posts!"),
                      );

                      return;
                    }

                    DroneRequestPost post = DroneRequestPost(
                      title: _title,
                      content: _content,
                      user: user.uid,
                      createdAt: DateTime.now().millisecondsSinceEpoch,
                    );

                    post.add();

                    Get.back();
                  },
                  child: const Text("Post It"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
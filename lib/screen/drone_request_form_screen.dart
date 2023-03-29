import 'package:flutter/material.dart';

import '../utility/form_validator.dart';

class DroneRequestFormScreen extends StatefulWidget {
  const DroneRequestFormScreen({ super.key });

  @override
  State<DroneRequestFormScreen> createState() => _DroneRequestFormScreenState();
}

class _DroneRequestFormScreenState extends State<DroneRequestFormScreen> {
  final _formKey = GlobalKey<FormState>();

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
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/drone_request_post.dart';
import '../../utility/user.dart';

class DroneRequestViewScreen extends StatefulWidget {
  const DroneRequestViewScreen({
    super.key,
    required this.post,
  });

  final DroneRequestPost post;

  @override
  State<DroneRequestViewScreen> createState() => _DroneRequestViewScreenState();
}

class _DroneRequestViewScreenState extends State<DroneRequestViewScreen> {
  String username = "";

  void getUsername() async {
    var data = await getUserInfoWithUID(widget.post.user);
    
    setState(() {
      username = data["username"];
    });
  }

  @override
  void initState() {
    super.initState();

    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.post.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Center(
                child: Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              Text(
                widget.post.content,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              Text(
                widget.post.getCreatedAtToString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
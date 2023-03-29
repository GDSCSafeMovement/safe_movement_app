import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/drone_request_post.dart';

class DroneRequestScreen extends StatefulWidget {
  const DroneRequestScreen({ super.key });

  @override
  State<DroneRequestScreen> createState() => _DroneRequestScreenState();
}

class _DroneRequestScreenState extends State<DroneRequestScreen> {
  List<DroneRequestPost> posts = [];

  @override
  void initState() {
    super.initState();

    loadAllPosts();
  }

  void loadAllPosts() async {
    try {
        var patch = await DroneRequestPost.getPosts();

        setState(() {
          posts = patch;
        });

    } on FirebaseException catch (_) {
      Get.defaultDialog(
        title: "Error",
        content: const Text("You do not have permission to view posts!"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: posts.length * 2,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            index = (index / 2).round();

            return InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      posts[index].getCreatedAtToString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Divider();
          }
        },
      ),
    );
  }
}
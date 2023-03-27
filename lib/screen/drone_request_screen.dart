import 'package:flutter/material.dart';

import '../model/drone_request_post.dart';

class DroneRequestScreen extends StatefulWidget {
  const DroneRequestScreen({ super.key });

  @override
  State<DroneRequestScreen> createState() => _DroneRequestScreenState();
}

class _DroneRequestScreenState extends State<DroneRequestScreen> {
  final List<DroneRequestPost> posts = [
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
    DroneRequestPost(title: "test1"),
  ];

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
                      "datetime",
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
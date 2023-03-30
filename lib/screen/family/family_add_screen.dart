import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/user.dart';

class FamilyAddScreen extends StatefulWidget {
  const FamilyAddScreen({ super.key });

  @override
  State<FamilyAddScreen> createState() => _FamilyAddScreenState();
}

class _FamilyAddScreenState extends State<FamilyAddScreen> {
  var _searchQuery = TextEditingController();

  void search() async {
    var user = await findUserByUsername(_searchQuery.text);

    if (user == null) {
      Get.defaultDialog(
        title: "No User",
        content: const Text("Cannot found the user"),
      );
    } else {
      Get.defaultDialog(
        title: "Add to family",
        content: Column(
          children: [
            Text(
              'Username: ${user["username"]}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    addFamily(user["uid"]);
                    Get.back();
                  },
                  child: const Text("Send Request"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a family member"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _searchQuery,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a username',
              ),
            ),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: search,
              child: Text("Find User"),
            ),
          ],
        ),
      ),
    );
  }
}
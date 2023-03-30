import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import './family_add_screen.dart';
import '../../utility/user.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({ super.key });

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final List<String> _family = [];
  final List<bool> _activate = [];

  void loadFamily() async {
    setState(() {
      _family.clear();
      _activate.clear();
    });

    var uid = FirebaseAuth.instance.currentUser!.uid;
    var data = await getUserInfoWithUID(uid);

    if (data["family"] == null) {
      return;
    }

    data["family"].forEach((key, value) async {
      var user = await getUserInfoWithUID(key);

      setState(() {
        _family.add(user["username"]);
        _activate.add(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();

    loadFamily();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const FamilyAddScreen())!.then((_) => loadFamily());
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: _family.length * 2,
          itemBuilder: (context, index) {
            var colorScheme = Theme.of(context).colorScheme;

            if (index % 2 == 0) {
              index = (index / 2).round();
      
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    _family[index],
                    style: TextStyle(
                      color: _activate[index] ? colorScheme.secondary : colorScheme.secondaryContainer,
                      fontWeight: _activate[index] ? FontWeight.bold : FontWeight.normal,
                      fontStyle: _activate[index] ? FontStyle.normal : FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            } else {
              return const Divider();
            }
          }
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utility/user.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({ super.key });

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  String _emergencyPhone = "";

  void loadEmergencyPhone() async {
    var user = FirebaseAuth.instance.currentUser!;
    var data = await getUserInfoWithUID(user.uid);

    setState(() => { _emergencyPhone = data["emergency_phone"] });
  }

  @override
  void initState() {
    super.initState();

    loadEmergencyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning,
            size: 100,
          ),
          const Center(
            child: Text(
              "Connect to emergency contacts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: Text(
              _emergencyPhone,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
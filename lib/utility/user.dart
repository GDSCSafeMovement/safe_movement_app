import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<User?> signUp(
  String email,
  String password,
  String username,
  String phone,
  String emergencyPhone,
) async {
  // Create new user with firebase authentication
  var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  // Update user information on firestore
  FirebaseFirestore
    .instance
    .collection("users")
    .doc(user.user!.uid)
    .set(<String, dynamic>{
      "username": username,
      "phone": phone,
      "emergency_phone": emergencyPhone,
      "family": null,
    })
    .onError((error, _) {});

  return user.user;
}

Future<Map<String, dynamic>> getUserInfoWithUID(String uid) async {
  CollectionReference collection = FirebaseFirestore.instance.collection("users");

  var docSnapshot = await collection.doc(uid).get();

  return {
    "uid": uid,
    "username": docSnapshot.get("username"),
    "phone": docSnapshot.get("phone"),
    "emergency_phone": docSnapshot.get("emergency_phone"),
    "family": docSnapshot.get("family"),
  };
}

void deleteAllUserData() async {
  CollectionReference collection = FirebaseFirestore.instance.collection("users");
  var querySnapshot = await collection.get();

  for (var docSnapshot in querySnapshot.docs) {
    var uid = docSnapshot.id;

    collection.doc(uid).delete();
    print("deleteAllUserData: remove user data ${uid}");
  }
}
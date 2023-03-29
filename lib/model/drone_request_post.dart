import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DroneRequestPost {
  DroneRequestPost({
    this.id = "",
    this.title = "",
    this.content = "",
    this.user = "",
    this.createdAt = 0,
  });

  String id;
  String title;
  String content;
  String user;
  int createdAt;

  String getCreatedAtToString() {
    var datetime = DateTime.fromMillisecondsSinceEpoch(createdAt);
    return "${datetime.year}-${datetime.month}-${datetime.day} ${datetime.hour}:${datetime.minute}";
  }

  void add() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('DroneRequestPosts');

    var doc = await collection.add({
      "title": title,
      "content": content,
      "user": user,
      "created_at": createdAt,
    });

    id = doc.id;
  }

  void save(Map<Object, Object?> data) {
    CollectionReference collection = FirebaseFirestore.instance.collection('DroneRequestPosts');

    collection.doc(id).update(data);
  }

  static Future<List<DroneRequestPost>> getPosts() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('DroneRequestPosts');
    QuerySnapshot querySnapshot = await collection
      .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get();

    List<DroneRequestPost> posts = [];

    for (var docSnapshot in querySnapshot.docs) {
      try {
        DroneRequestPost post = DroneRequestPost(
          id: docSnapshot.id,
          title: docSnapshot.get("title"),
          content: docSnapshot.get("content"),
          user: docSnapshot.get("user"),
          createdAt: docSnapshot.get("created_at"),
        );

        posts.add(post);

      } on StateError catch (_) {
        // pass
      }
    }

    return posts;
  }

  static Future<List<DroneRequestPost>> deleteAll() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('DroneRequestPosts');
    QuerySnapshot querySnapshot = await collection.get();

    List<DroneRequestPost> posts = [];

    for (var docSnapshot in querySnapshot.docs) {
      collection.doc(docSnapshot.id).delete();
      print("DroneRequetPost.deleteAll: remove doc ${docSnapshot.id}");
    }

    return posts;
  }
}
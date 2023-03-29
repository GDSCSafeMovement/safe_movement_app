import 'package:cloud_firestore/cloud_firestore.dart';

class DroneRequestPost {
  DroneRequestPost({
    this.title = "",
    this.content = "",
    this.user = "",
    this.createdAt = 0,
  });

  String title;
  String content;
  String user;
  int createdAt;

  String getCreatedAtToString() {
    var datetime = DateTime.fromMillisecondsSinceEpoch(createdAt);
    return "${datetime.year}-${datetime.month}-${datetime.day} ${datetime.hour}:${datetime.minute}";
  }

  static Future<List<DroneRequestPost>> getPosts() async {
    CollectionReference collection = FirebaseFirestore.instance.collection('DroneRequestPosts');
    QuerySnapshot querySnapshot = await collection.get();

    List<DroneRequestPost> posts = [];

    for (var docSnapshot in querySnapshot.docs) {
      try {
        DroneRequestPost post = DroneRequestPost();

        post.title = docSnapshot.get("title");
        post.content = docSnapshot.get("content");
        post.user = docSnapshot.get("user");
        post.createdAt = docSnapshot.get("created_at");

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
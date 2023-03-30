import 'package:cloud_firestore/cloud_firestore.dart';

class SafeMovementNews {
  SafeMovementNews({
    this.title = "",
    this.content = "",
  });

  String title;
  String content;

  Future<void> add() async {
    var collection = FirebaseFirestore.instance.collection("SafeMovementNews");

    await collection.add({
      "title": title,
      "content": content,
    });
  }

  static Future<List<SafeMovementNews>> getAll() async {
    var collection = FirebaseFirestore.instance.collection("SafeMovementNews");
    var querySnapshot = await collection.get();

    List<SafeMovementNews> news = [];

    for (var docSnapshot in querySnapshot.docs) {
      news.add(SafeMovementNews(
        title: docSnapshot.get("title"),
        content: docSnapshot.get("content"),
      ));
    }

    return news;
  }

  static Future<void> deleteAll() async {
    var collection = FirebaseFirestore.instance.collection("SafeMovementNews");
    var querySnapshot = await collection.get();

    for (var docSnapshot in querySnapshot.docs) {
      collection.doc(docSnapshot.id).delete();
    }
  }
}
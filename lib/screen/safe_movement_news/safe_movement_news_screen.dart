import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './safe_movement_news_view_screen.dart';
import '../../model/safe_movement_news.dart';

class SafeMovementNewsScreen extends StatefulWidget {
  const SafeMovementNewsScreen({ super.key });

  @override
  State<SafeMovementNewsScreen> createState() => _SafeMovementNewsScreenState();
}

class _SafeMovementNewsScreenState extends State<SafeMovementNewsScreen> {
  List<SafeMovementNews> _news = [];

  Future<void> loadAllNews() async {
    var news = await SafeMovementNews.getAll();
    setState(() => { _news = news });
  }

  @override
  void initState() {
    super.initState();

    loadAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child:
        _news.isEmpty ? 
        const Center(
          child: Text(
            "No news",
          ),
        ):
        ListView.builder(
          itemCount: _news.length * 2,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              index = (index / 2).round();

              return InkWell(
                onTap: () {
                  Get.to(
                    SafeMovementNewsViewScreen(
                      title: _news[index].title,
                      content: _news[index].content,
                    )
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    _news[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            } else {
              return const Divider();
            }
          },
        ),
      ),
    );
  }
}
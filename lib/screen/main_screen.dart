import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './movement_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ super.key });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _currentTitle = "Main";
  Widget _currentWidget = const Text("Main Screen");

  void setWidget(String title, Widget widget) {
    setState(() {
      _currentTitle = title;
      _currentWidget = widget;
    });
  }

  @override
  void initState() {
    super.initState();

    setWidget("Safe Movement", const MovementScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_currentTitle),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "Safe Movement",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text("Safe Movement"),
                onTap: () {
                  setWidget("Safe Movement", const MovementScreen());
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.warning),
                title: const Text("Emergency"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("User Information"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: _currentWidget,
      ),
    );
  }
}

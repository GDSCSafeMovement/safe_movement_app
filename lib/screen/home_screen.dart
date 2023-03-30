import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './movement_screen.dart';
import './drone_request/drone_request_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.setWidget
  });

  final void Function(String title, Widget widget) setWidget;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.warning),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircularButton(
              onTap: () {
                widget.setWidget("Maps", const MovementScreen());
              },
              child: Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Show Maps",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      "MAP",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                  ),
                ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: CircularButton(
                    onTap: () {
                      widget.setWidget("Drone Requests", const DroneRequestScreen());
                    },
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Request Drones',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
                Expanded(
                  child: CircularButton(
                    child: SizedBox(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Logging',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CircularButton(
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Text(
                    "Safe Movement News",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.child,
    this.onTap,
    this.color,
  });

  final Widget child;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MovementScreen extends StatefulWidget {
  const MovementScreen({ super.key });

  @override
  State<MovementScreen> createState() => _MovementScreenState();
}

class _MovementScreenState extends State<MovementScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // TODO: Get current position
  static const CameraPosition _currentPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _currentPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    Get.defaultDialog(
                      title: "Find",
                      content: Container(),
                    );
                  });
                },
                child: const Text("Find Children"),
              ),
            ),
          ),
        ]
      )
    );
  }
}

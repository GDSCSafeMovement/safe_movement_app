import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MovementScreen extends StatefulWidget {
  const MovementScreen({ super.key });

  @override
  State<MovementScreen> createState() => _MovementScreenState();
}

class _MovementScreenState extends State<MovementScreen> {
  bool _isActive = false;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // TODO: Get current position
  static const CameraPosition _currentPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _isActive ? BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stop),
            label: 'Stop',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _isActive = false;
          });
        }
      ) : null,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _currentPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            padding: _isActive ? EdgeInsets.all(0) : EdgeInsets.fromLTRB(0, 0, 0, 50),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          if (!_isActive)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    _isActive = true;
                  });
                },
                child: Text("안심귀가 시작")
              ),
            ),
          ),
        ]
      )
    );
  }
}

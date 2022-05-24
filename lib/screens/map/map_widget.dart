import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_way/models/vacation_model.dart';
import 'package:uuid/uuid.dart';

class MapWidget extends StatefulWidget {
  final VacationModel vacation;

  const MapWidget({Key? key, required this.vacation}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  bool mapLoaded = false;

  @override
  Widget build(BuildContext context) {
    var pointsOfInterest = widget.vacation.pointsOfInterest;

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: _mapCreated,
          markers: pointsOfInterest
              .map(
                (poi) => Marker(
                  position: LatLng(
                    poi.latitude,
                    poi.longitude,
                  ),
                  markerId: MarkerId(const Uuid().v1()),
                  infoWindow: InfoWindow(
                    title: poi.name,
                    snippet: poi.address,
                  ),
                ),
              )
              .toSet(),
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 0,
          ),
        ),
        Visibility(
          visible: !mapLoaded,
          child: Container(
            child: const Center(child: CircularProgressIndicator()),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/img/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.7),
                  BlendMode.lighten,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _mapCreated(GoogleMapController controller) {
    mapController = controller;
    Timer(const Duration(seconds: 2), () {
      setState(() {
        mapLoaded = true;
      });
    });
  }
}

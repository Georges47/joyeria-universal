import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController;

  const LocationMap({super.key, required this.googleMapController});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: const CameraPosition(
        target: LatLng(10.684256182227712, -71.59488671763292),
        zoom: 16.0,
      ),
      onMapCreated: (GoogleMapController controller) {
        googleMapController.complete(controller);
      },
      markers: {
        const Marker(
          markerId: MarkerId('joyeria-universal'),
          position: LatLng(10.684256182227712, -71.59488671763292),
          infoWindow: InfoWindow(
            title: 'Joyería Universal',
          ),
          icon: BitmapDescriptor.defaultMarker,
        )
      }
    );
  }

}
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Estamos ubicados en...'
            // ),
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(10.684256182227712, -71.59488671763292),
                  zoom: 16.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: {
                  const Marker(
                    markerId: MarkerId('joyeria-universal'),
                    position: LatLng(10.684256182227712, -71.59488671763292),
                    infoWindow: InfoWindow(
                      title: 'Joyería Universal',
                      // snippet: 'My Custom Subtitle',
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                  )
                }
              ),
            ),
          ]
        )
      ),
    );
  }
}

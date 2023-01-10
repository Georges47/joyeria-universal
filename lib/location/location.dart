import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joyeria_universal/utils.dart';

class Location extends StatelessWidget {
  Location({super.key});

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: (
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SizedBox(
                      height: screenHeight(context) / 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  'Nuestra Ubicación',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                const SizedBox(height: 64.0,),
                                const Text('Maracaibo, Venezuela...'),
                                const SizedBox(height: 64.0,),
                                const Text('Estamos ubicados en el primer piso del Centro Lago Mall...'),
                                const SizedBox(height: 64.0,),
                                Column(
                                  children: const [
                                    Text(
                                      'Horarios',
                                      style: TextStyle(fontSize: 24.0),
                                    ),
                                    Text('')
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).colorScheme.primary)
                            ),
                            width: screenWidth(context) / 3,
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
                                  ),
                                  icon: BitmapDescriptor.defaultMarker,
                                )
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}

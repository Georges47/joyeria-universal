import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joyeria_universal/utils.dart';

class Location extends StatelessWidget {
  final CarouselController carouselController;
  final Completer<GoogleMapController> _googleMapController = Completer<GoogleMapController>();

  Location({super.key, required this.carouselController});

  double _cardWidth(double screenWidth) {
    if (screenWidth > 850) {
      return (1200 * screenWidth) / (screenWidth + 400);
    } else {
      return screenWidth / 1.2;
    }
  }

  double _cardHeight(double screenWidth, double screenHeight) {
    if (screenWidth > 1000) {
      return screenHeight / 2;
    } else {
      return screenHeight / 1.4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: screenWidth(context) > 850 ? Alignment.centerLeft : Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 32.0, top: screenWidth(context) > 850 ? 80.0 : 40.0),
                child: IconButton(
                  iconSize: 32.0,
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    if(carouselController.ready) {
                      carouselController.animateToPage(1, duration: const Duration(milliseconds: 1200), curve: Curves.ease);
                    }
                  },
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: _cardWidth(screenWidth(context)),
                height: _cardHeight(screenWidth(context), screenHeight(context)),
                child: Card(
                  elevation: 8.0,
                  child: screenWidth(context) > 850 ? 
                    DesktopContent(googleMapController: _googleMapController) : 
                    MobileContent(googleMapController: _googleMapController),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class DesktopContent extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController;

  const DesktopContent({super.key, required this.googleMapController});

  double _cardHeight(double screenWidth, double screenHeight) {
    if (screenWidth > 850) {
      return screenHeight / 2;
    } else {
      return screenHeight / 1.2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return(
      Padding(
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0, right: 32.0, left: screenWidth(context) > 850 ? 0.0 : 32.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16.0,),
                  const Text('Ubicación', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16.0,),
                  const Text('Centro Comercial Lago Mall, Nivel Plaza', style: TextStyle(fontSize:18.0 )),
                  const SizedBox(height: 8.0,),
                  const Text('Avenida El Milagro, Maracaibo 4002', style: TextStyle(fontSize:18.0 )),
                  const SizedBox(height: 8.0,),
                  const Text('Zulia, Venezuela', style: TextStyle(fontSize:18.0 )),
                  const Spacer(),
                  const Text('Horarios', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 16.0,),
                  DataTable(
                    headingRowHeight: 0,
                    dataRowHeight: 32.0,
                    columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('')),
                    ],
                    rows: [
                      ...weekDays().map((day) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              day,
                              style: TextStyle(fontWeight: isToday(day) ? FontWeight.bold : FontWeight.normal),
                            )
                          ),
                          DataCell(
                            Text(
                              day == 'Domingo' ? 'Cerrado' : '10:00 - 18:30',
                              style: TextStyle(fontWeight: isToday(day) ? FontWeight.bold : FontWeight.normal),
                            )
                          ),
                        ],
                      )),
                    ]
                  ),
                  const SizedBox(height: 16.0,),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              width: _cardHeight(screenWidth(context), screenHeight(context)) - 64.0,
              height: (_cardHeight(screenWidth(context), screenHeight(context)) / (screenWidth(context) > 850 ? 1 : 2)) - 64.0,
              child: GoogleMap(
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
              ),
            )
          ]
        ),
      )
    );
  }
}

class MobileContent extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController;

  const MobileContent({super.key, required this.googleMapController});

  double _cardHeight(double screenWidth, double screenHeight) {
    if (screenWidth > 1000) {
      return screenHeight / 2;
    } else {
      return screenHeight / 1.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 32.0, left: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nuestra Ubicación', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
            const SizedBox(height: 16.0,),
            const Text(
              'Centro Comercial Lago Mall, Nivel Plaza. Avenida El Milagro, Maracaibo 4002. Zulia, Venezuela',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              width: _cardHeight(screenWidth(context), screenHeight(context)) - 64.0,
              height: (_cardHeight(screenWidth(context), screenHeight(context)) / (screenWidth(context) > 850 ? 1 : 2)) - 64.0,
              child: GoogleMap(
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
              ),
            ),
            const SizedBox(height: 16.0,),
            Column(
              children: [
                const SizedBox(height: 8.0,),
                const Text('Horarios', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 8.0,),
                DataTable(
                  headingRowHeight: 0,
                  dataRowHeight: 24.0,
                  columns: const [
                    DataColumn(label: Text('')),
                    DataColumn(label: Text('')),
                  ],
                  rows: [
                    ...weekDays().map((day) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            day,
                            style: TextStyle(
                              fontWeight: isToday(day) ?
                                FontWeight.bold :
                                FontWeight.normal
                            ),
                          )
                        ),
                        DataCell(
                          Text(
                            day == 'Domingo' ? 'Cerrado' : '10:00 - 18:30',
                            style: TextStyle(
                              fontWeight: isToday(day) ?
                                FontWeight.bold :
                                FontWeight.normal
                            ),
                          )
                        ),
                      ],
                    )),
                  ]
                ),
              ],
            )
          ],
        )
      )
    );
  }
}
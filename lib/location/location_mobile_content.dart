import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joyeria_universal/location/location_map.dart';
import 'package:joyeria_universal/utils.dart';

class LocationMobileContent extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController;
  final double maxHeight;
  final double maxWidth;
  
  const LocationMobileContent({
    super.key, 
    required this.googleMapController, 
    required this.maxHeight, 
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: LimitedBox(
          maxHeight: maxHeight,
          maxWidth: maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Nuestra Ubicación', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 16.0,),
                const SelectableText(
                  'Centro Comercial Lago Mall, Nivel Plaza. Avenida El Milagro, Maracaibo 4002. Zulia, Venezuela',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    child: LocationMap(googleMapController: googleMapController,),
                  ),
                ),
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
          ),
        ),
      ),
    );
  }
}
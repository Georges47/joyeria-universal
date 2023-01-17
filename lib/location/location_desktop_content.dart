import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joyeria_universal/location/location_map.dart';
import 'package:joyeria_universal/utils.dart';

class LocationDesktopContent extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController;
  final double maxHeight;

  const LocationDesktopContent({
    super.key,
    required this.googleMapController,
    required this.maxHeight
  });

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: maxHeight,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: maxHeight,
                child: Column(
                  children: [
                    const Text('Ubicación', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 16.0,),
                    const SelectableText('Centro Comercial Lago Mall, Nivel Plaza', style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,),
                    const SizedBox(height: 4.0,),
                    const SelectableText('Avenida El Milagro, Maracaibo 4002', style: TextStyle(fontSize: 18.0 ), textAlign: TextAlign.center),
                    const SizedBox(height: 4.0,),
                    const SelectableText('Zulia, Venezuela', style: TextStyle(fontSize: 18.0 ), textAlign: TextAlign.center),
                    screenHeight(context) > 600 ?
                    const Spacer() :
                    SizedBox(height: screenHeight(context) - 452.0 > 32.0 ? screenHeight(context) - 452.0 : 32.0,),
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
                                style: TextStyle(fontSize: 18.0, fontWeight: isToday(day) ? FontWeight.bold : FontWeight.normal),
                              )
                            ),
                            DataCell(
                              Text(
                                day == 'Domingo' ? 'Cerrado' : '10:00 - 18:30',
                                style: TextStyle(fontSize: 18.0, fontWeight: isToday(day) ? FontWeight.bold : FontWeight.normal),
                              )
                            ),
                          ],
                        )),
                      ]
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
                ),
                child: LocationMap(googleMapController: googleMapController),
              ),
            )
          ]
        ),
      ),
    );
  }
}

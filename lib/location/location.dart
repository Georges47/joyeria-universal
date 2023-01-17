import 'dart:async';
import 'dart:math';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joyeria_universal/location/location_desktop_content.dart';
import 'package:joyeria_universal/location/location_mobile_content.dart';
import 'package:joyeria_universal/utils.dart';

class Location extends StatelessWidget {
  final CarouselController carouselController;
  final Completer<GoogleMapController> _googleMapController = Completer<GoogleMapController>();

  Location({super.key, required this.carouselController});

  double _cardHeight(double screenWidth, double screenHeight) {
    if(screenWidth > 850) {
      // Desktop
      if(screenHeight > 950) {
        return screenHeight / 2;
      } else if(screenHeight > 750) {
        return 0.003125 * pow(screenHeight, 2) - 5.9375 * screenHeight + 3295.3125;
      } else {
        return 600;
      }
    } else {
      // Mobile
      if(screenHeight > 600) {
        return screenHeight / 1.25;
      } else {
        return 480;
      }
    }
  }

  double _cardWidth(double screenWidth) {
    if (screenWidth > 850) {
      return (1200 * screenWidth) / (screenWidth + 400);
    } else {
      if (screenWidth > 400) {
        return screenWidth / 1.2;
      } else {
        return 400 / 1.2;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                width: _cardWidth(screenWidth(context)),
                height: _cardHeight(screenWidth(context), screenHeight(context)),
                child: Card(
                  elevation: 8.0,
                  child: SingleChildScrollView(
                    child: screenWidth(context) > 850 ?
                      LocationDesktopContent(
                        googleMapController: _googleMapController, 
                        maxHeight: _cardHeight(screenWidth(context), screenHeight(context)),
                      ) :
                      LocationMobileContent(
                        googleMapController: _googleMapController, 
                        maxHeight: _cardHeight(screenWidth(context), screenHeight(context)) - 16.0,
                        maxWidth: _cardWidth(screenWidth(context)) - 64.0,
                      ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: screenWidth(context) > 1000 ? Alignment.centerLeft : Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 32.0, top: screenWidth(context) > 1000 ? 72.0 : 32.0),
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
          ],
        ),
      )
    );
  }
}

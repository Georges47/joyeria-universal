import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:joyeria_universal/contact/contact_desktop_content.dart';
import 'package:joyeria_universal/contact/contact_mobile_content.dart';
import 'package:joyeria_universal/utils.dart';

class Contact extends StatelessWidget {
  final CarouselController carouselController;

  const Contact({super.key, required this.carouselController});

  double _cardHeight(double screenWidth, double screenHeight) {
    if (screenWidth > 750) {
      if (screenHeight > 750) {
        return screenHeight / 2;
      } else {
        return 375;
      }
    } else {
      if (screenHeight > 750) {
        return screenHeight / 1.3;
      } else if (screenHeight > 650) {
        return 0.87 * screenHeight - 75.5;
      } else {
        return 490;
      }
    }
  }

  double _cardWidth(double screenWidth) {
    if (screenWidth > 750) {
      if(screenWidth > 1500) {
        return 960;
      } else if(screenWidth > 1500) {
        return screenWidth / 2;
      } else {
        return 750;
      }
    } else {
      if (screenWidth > 400) {
        return screenWidth / 1.2;
      } else {
        return 333.3333;
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
            SizedBox(
              height: screenHeight(context),
              child: Center(
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _cardWidth(screenWidth(context)),
                            height: _cardHeight(screenWidth(context), screenHeight(context)),
                            child: Card(
                              elevation: 8.0,
                              child: screenWidth(context) > 750 ?
                                const ContactDesktopContent() :
                                const ContactMobileContent(),
                            ),
                          ),
                          Text(
                            'No compramos oro ni hacemos avalúos',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black.withOpacity(0.6)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: screenWidth(context) > 950 ?
                Alignment.centerRight :
                Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 32.0,
                  top: screenWidth(context) > 950 ? 0.0 : 32.0
                ),
                child: IconButton(
                  iconSize: 32.0,
                  icon: const Icon(
                    Icons.arrow_forward,
                  ),
                  onPressed: () {
                    if(carouselController.ready) {
                      carouselController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease
                      );
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

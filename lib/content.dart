import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:joyeria_universal/background.dart';
import 'package:joyeria_universal/location.dart';
import 'package:joyeria_universal/utils.dart';

import 'contact.dart';
import 'home.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<StatefulWidget> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: screenHeight(context),
            initialPage: 1,
            enableInfiniteScroll: false,
            scrollPhysics: const NeverScrollableScrollPhysics()
          ),
          carouselController: _carouselController,
          items: [
            Contact(carouselController: _carouselController),
            Home(carouselController: _carouselController),
            Location(carouselController: _carouselController),
          ],
        ),
      ]
    );
  }
}

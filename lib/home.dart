import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:joyeria_universal/utils.dart';

class Home extends StatelessWidget {
  final CarouselController carouselController;

  const Home({super.key, required this.carouselController});

  double _cardWidth(double screenWidth) {
    if (screenWidth > 1550) {
      return screenWidth / 1.75;
    } else if (screenWidth > 950) {
      return 886;
    } else if (screenWidth > 350) {
      return screenWidth / 1.07;
    }
    else {
      return 327;
    }
  }

  double _cardHeight(double screenHeight) {
    if (screenHeight > 1000) {
      return screenHeight / 2;
    } else if (screenHeight > 550) {
      return 0.1333 * screenHeight + 366.6666;
    } else {
      return 440;
    }
  }

  Widget _sectionButton(int pageToAnimate, String label) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient: const LinearGradient(
          tileMode: TileMode.clamp,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xfff2cd88),
            Color(0xffecb651),
            Color(0xffeaae3e),
            Color(0xffe8a62c),
            Color(0xffe69f19),
            Color(0xffe8a62c),
            Color(0xffeaae3e),
            Color(0xffecb651),
            Color(0xfff2cd88),
          ]
        ),
      ),
      child: OutlinedButton(
        onPressed: () {
          if(carouselController.ready) {
            carouselController.animateToPage(
              pageToAnimate,
              duration: const Duration(milliseconds: 1200),
              curve: Curves.ease);
          }
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          padding: const EdgeInsets.all(20.0),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ),
    );
  }

  Widget _text(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                width: _cardWidth(screenWidth(context)),
                height: _cardHeight(screenHeight(context)),
                child: Card(
                  elevation: 8.0,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: LimitedBox(
                          maxWidth: _cardWidth(screenWidth(context)),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth(context) > 1200 ? 64.0 : 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  width: 350,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/logo_name_2.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18.0,),
                                Center(
                                  child: screenWidth(context) > 600 ?
                                    _text('Visítenos con confianza - Atención esmerada - Precios sin competencia') :
                                    Column(
                                      children: [
                                        _text('Visítenos con confianza'),
                                        _text('Atención esmerada'),
                                        _text('Precios sin competencia'),
                                      ],
                                    )
                                ),
                                // 'El más completo surtido de joyas en acero y finas fantasías'
                                // 'Representantes de las mas famosas marcas de relojes' (Versace, Fendi, Tissot, Mulco, Nivada)
                                // 'Desde 1930!',
                                const SizedBox(height: 32.0,),
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 32.0,
                                  runSpacing: 16.0,
                                  children: [
                                    _sectionButton(0, 'Contacto'),
                                    _sectionButton(2, 'Ubicación'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

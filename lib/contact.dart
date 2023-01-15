import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joyeria_universal/utils.dart';

class Contact extends StatelessWidget {
  final CarouselController carouselController;

  const Contact({super.key, required this.carouselController});

  List<Widget> _desktopContent() {
    return [
      Row(
        children: [
          const Text("Joyería Universal", style: TextStyle(fontSize: 48.0),),
          const Spacer(),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      const Spacer(),
      Align(
        alignment: Alignment.bottomLeft,
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(72.0),
            1: IntrinsicColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: const [
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 36.0
                    ),
                  ),
                ),
                TableCell(
                  child: Text(
                    '+58 416-5611797',
                    style: TextStyle(fontSize: 24.0),
                  )
                ),
              ]
            ),
            TableRow(
              children: [
                SizedBox(height: 24.0),
                SizedBox(height: 24.0),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 36.0,
                    ),
                  ),
                ),
                TableCell(
                  child: Text(
                    '@joyeriauniversalmcbo',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ]
            ),
            TableRow(
              children: [
                SizedBox(height: 24.0),
                SizedBox(height: 24.0),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Icon(
                    Icons.mail_outline,
                    size: 36.0
                  ),
                ),
                TableCell(
                  child: Text(
                    'joyeríauniversal@outlook.com',
                    style: TextStyle(fontSize: 24.0))
                ),
              ]
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _mobileContent() {
    return [
      Flexible(
        flex: 1,
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      const SizedBox(height: 16.0,),
      Flexible(
        flex: 2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.whatsapp_outlined,
              size: 36.0
            ),
            SizedBox(height: 4.0,),
            Text(
              '+58 416-5611797',
              style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
            ),
            Divider(height: 64.0,),
            Center(
              child: FaIcon(
                FontAwesomeIcons.instagram,
                size: 36.0,
              ),
            ),
            Text(
              '@joyeriauniversalmcbo',
              style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
            ),
            Divider(height: 64.0,),
            Icon(
              Icons.mail_outline,
              size: 36.0
            ),
            Text(
              'joyeríauniversal@outlook.com',
              style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: screenWidth(context) > 950 ?
                Alignment.centerRight :
                Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 32.0,
                  top: screenWidth(context) > 950 ? 80.0 : 40.0
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
            Center(
              child: SizedBox(
                width: screenWidth(context) > 750 ?
                  (1100 * screenWidth(context)) / (screenWidth(context) + 400) :
                  screenWidth(context) / 1.2,
                height: screenWidth(context) > 750 ?
                  screenHeight(context) / 2 :
                  screenHeight(context) / 1.3,
                child: Card(
                  elevation: 8.0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 48.0,
                        horizontal: screenWidth(context) > 750 ? 48.0 : 18.0
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: screenWidth(context) > 750 ?
                          _desktopContent() :
                          _mobileContent(),
                      ),
                    ),
                  ),
                ),
              )
            ),
            Align(
              alignment: Alignment(
                0.0,
                screenWidth(context) > 750 ? 0.55 : 0.825
              ),
              child: Text(
                'No compramos oro ni se hacen avalúos',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(0.6)
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      )
    );
  }
}

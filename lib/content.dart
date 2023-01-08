import 'package:flutter/cupertino.dart';
import 'package:joyeria_universal/utils.dart';

import 'contact/contact.dart';
import 'footer/footer.dart';
import 'location/location.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return (
      SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: screenHeight(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  "Joyería Universal",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )
              ),
            ),
            const Contact(),
            SizedBox(
              height: screenHeight(context),
              child: Column(
                children: [
                  Location(),
                  const Footer(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

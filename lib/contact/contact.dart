import 'package:flutter/material.dart';
import 'package:joyeria_universal/contact/contact_form.dart';
import 'package:joyeria_universal/contact/contact_message.dart';
import 'package:joyeria_universal/paint.dart';
import 'package:joyeria_universal/utils.dart';

class Contact extends StatelessWidget {

  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        height: screenHeight(context) - (isMobile(context) ? appBarHeight() : 0.0),
        child: Column(
          children: [
            const ContactMessage(),
            CustomPaint(
              size: const Size(double.infinity, 80.0),
              painter: PaintTrianglePointingDown(backgroundColor: Theme.of(context).colorScheme.primary),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ten en cuenta algunas cosas antes de escribirnos:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '    \u2022 No compramos oro\n    \u2022 No compramos relojes usados',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            const ContactForm(),
            const Spacer(),
            CustomPaint(
              size: const Size(double.infinity, 80.0),
              painter: PaintTrianglePointingUp(backgroundColor: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      )
    );
  }
}

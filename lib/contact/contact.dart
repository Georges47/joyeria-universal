import 'package:flutter/material.dart';
import 'package:joyeria_universal/contact/contact_form.dart';
import 'package:joyeria_universal/contact/contact_message.dart';
import 'package:joyeria_universal/utils.dart';

class Contact extends StatelessWidget {

  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      SizedBox(
        height: screenHeight(context) - appBarHeight(),
        child: Column(
          children: [
            const ContactMessage(),
            CustomPaint(
              size: const Size(double.infinity, 80.0),
              painter: PaintTriangle(backgroundColor: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Ten en cuenta algunas cosas antes de escribirnos:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '    \u2022 No compramos oro',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            const ContactForm()
          ],
        ),
      )
    );
  }
}

class PaintTriangle extends CustomPainter {
  final Color backgroundColor;

  PaintTriangle({
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;

    final paint = Paint()
    ..color = backgroundColor;
    final path = Path();

    path
      ..moveTo(0, 0)
      ..lineTo((x / 2), (y))
      ..lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

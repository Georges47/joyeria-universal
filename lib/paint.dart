import 'package:flutter/material.dart';

class PaintTrianglePointingDown extends CustomPainter {
  final Color backgroundColor;

  PaintTrianglePointingDown({
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
      ..lineTo((x / 2), y)
      ..lineTo(x, 0);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class PaintTrianglePointingUp extends CustomPainter {
  final Color backgroundColor;

  PaintTrianglePointingUp({
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
      ..moveTo(0, y)
      ..lineTo((x / 2), 0)
      ..lineTo(x, y);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

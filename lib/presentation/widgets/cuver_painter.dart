import 'package:flutter/material.dart';

class CuverPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill; // Change this to fill
    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.5, size.height * -0.12, size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

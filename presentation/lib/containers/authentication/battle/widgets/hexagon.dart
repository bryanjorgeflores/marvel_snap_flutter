import 'package:flutter/material.dart';

class BorderHexagon extends CustomPainter {
  Color color;
  BorderHexagon({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
// Code for path
// From here ....
    Path path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(0, size.height * 0.1);
    path.lineTo(0, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, size.height * 0.1);
    path.lineTo(size.width * 0.5, 0);
// .... to here
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(0, size.height * 0.1);
    path.lineTo(0, size.height * 0.9);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, size.height * 0.1);
    path.lineTo(size.width * 0.5, 0);

    // path.lineTo(size.width * 0.05, size.height * 0.5);
    // path.lineTo(size.width * 0.15, size.height * 0.65);
    // path.lineTo(size.width * 0.3, size.height * 0.5);
    // path.lineTo(size.width * 0.3, size.height * 0.15);
    // path.lineTo(size.width * 0.16, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

import 'package:flutter/material.dart';

class RectanglePage  extends StatelessWidget {
  const RectanglePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectanglePainter(),
      child: Container(),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCircle(center: center, radius: 70.0);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
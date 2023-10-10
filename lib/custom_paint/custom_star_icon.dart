import 'package:flutter/material.dart';
import 'dart:math';

class CustomStarIcon extends StatelessWidget {
  final double size;
  final Color color;
  final double fillPercentage;

  const CustomStarIcon({super.key, 
    required this.size,
    required this.color,
    required this.fillPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: StarPainter(color: color, fillPercentage: fillPercentage),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;
  final double fillPercentage;

  StarPainter({
    required this.color,
    required this.fillPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final double outerRadius = radius;
    final double innerRadius = radius / 2;

    final Path path = Path();
    for (int i = 0; i < 5; i++) {
      double outerX = centerX + outerRadius * cos(degToRad(i * 72));
      double outerY = centerY + outerRadius * sin(degToRad(i * 72));
      double innerX = centerX + innerRadius * cos(degToRad(i * 72 + 36));
      double innerY = centerY + innerRadius * sin(degToRad(i * 72 + 36));
      if (i == 0) {
        path.moveTo(outerX, outerY);
      } else {
        path.lineTo(outerX, outerY);
      }
      path.lineTo(innerX, innerY);
    }
    path.close();

    double clipWidth = size.width * fillPercentage;
    Rect clipRect = Rect.fromLTRB(0, 0, clipWidth, size.height);

    canvas.clipRect(clipRect); // Clip the star based on the fillPercentage
    canvas.drawPath(path, paint);
  }

  double degToRad(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
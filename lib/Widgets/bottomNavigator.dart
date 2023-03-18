import 'package:flutter/cupertino.dart';

class ConvexShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double diameter = 60;
    final double radius = diameter / 2;

    final Path path = Path()
      ..moveTo(rect.left + radius, rect.top)
      ..lineTo(rect.right - radius, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top + radius)
      ..arcToPoint(
        Offset(rect.left + radius, rect.top),
        radius: Radius.circular(radius),
        clockwise: false,
      );

    final Path logoPath = Path()
      ..addOval(Rect.fromCircle(center: rect.center, radius: radius - 5))
      ..fillType = PathFillType.evenOdd;

    path.addPath(logoPath, Offset.zero);
    return path;
  }
}
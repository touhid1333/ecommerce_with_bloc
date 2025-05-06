import 'package:flutter/material.dart';

class CutRectangleShape extends CustomPainter {
  final bool cutStartFrom;

  CutRectangleShape(this.cutStartFrom);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.grey.shade200 // Border color
      ..strokeWidth = 3.0    // Border thickness
      ..style = PaintingStyle.stroke;

    const cornerRadius = 20.0;
    const cutSize = 5.0;

    final cutPathFromLeft = Path()
      ..moveTo(cornerRadius, cutSize)
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, (size.height - cutSize - cornerRadius))
      ..quadraticBezierTo(size.width, (size.height - cutSize),
          (size.width - cornerRadius), (size.height - cutSize))
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, (size.height - cornerRadius))
      ..lineTo(0, (cutSize + cornerRadius))
      ..quadraticBezierTo(0, (cutSize), cornerRadius, cutSize)
      ..close();

    final cutPathFromRight = Path()
      ..moveTo(cornerRadius, 0)
      ..lineTo(size.width - cornerRadius, cutSize)
      ..quadraticBezierTo(
          size.width, cutSize, size.width, cornerRadius + cutSize)
      ..lineTo(size.width, (size.height - cornerRadius))
      ..quadraticBezierTo(
          size.width, size.height, (size.width - cornerRadius), (size.height))
      ..lineTo(cornerRadius, size.height - cutSize)
      ..quadraticBezierTo(
          0, size.height - cutSize, 0, (size.height - cornerRadius - cutSize))
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..close();

    canvas.drawPath(cutStartFrom == false ? cutPathFromLeft : cutPathFromRight, paint);
    canvas.drawPath(cutStartFrom == false ? cutPathFromLeft : cutPathFromRight, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

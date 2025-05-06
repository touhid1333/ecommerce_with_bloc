import 'package:flutter/material.dart';

class CutRectangleClipper extends CustomClipper<Path> {
  final bool cutStartFrom;

  CutRectangleClipper(this.cutStartFrom);

  @override
  Path getClip(Size size) {
    const double cornerRadius = 20.0;
    const double cutSize = 5.0;

    final cutPathFromLeft = Path()
      ..moveTo(cornerRadius, cutSize)
      ..lineTo(size.width - cornerRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, cornerRadius)
      ..lineTo(size.width, (size.height - cornerRadius))
      ..quadraticBezierTo(size.width, (size.height),
          (size.width - cornerRadius), (size.height))
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
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(
          0, size.height, 0, (size.height - cornerRadius))
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..close();

    return cutStartFrom == false ? cutPathFromLeft : cutPathFromRight;
  }

  @override
  bool shouldReclip(CutRectangleClipper oldClipper) => true;
}

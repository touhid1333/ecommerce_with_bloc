import 'package:flutter/material.dart';

class CutRectangleClipperBottom extends CustomClipper<Path> {
  final bool cutStartFrom;

  CutRectangleClipperBottom(this.cutStartFrom);

  @override
  Path getClip(Size size) {
    const double cornerRadius = 20.0;
    const double cutSize = 5.0;

    final cutPathFromLeft = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, (size.height - cornerRadius))
      ..quadraticBezierTo(size.width, (size.height - cutSize),
          (size.width - cornerRadius), (size.height - cutSize))
      ..lineTo(cornerRadius, size.height)
      ..quadraticBezierTo(0, size.height, 0, (size.height - cornerRadius))
      ..lineTo(0, 0)
      ..close();

    final cutPathFromRight = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, (size.height - cornerRadius))
      ..quadraticBezierTo(
          size.width, size.height, (size.width - cornerRadius), (size.height))
      ..lineTo(cornerRadius, size.height - cutSize)
      ..quadraticBezierTo(
          0, size.height - cutSize, 0, (size.height - cornerRadius - cutSize))
      ..lineTo(0, 0)
      ..close();

    return cutStartFrom == false ? cutPathFromLeft : cutPathFromRight;
  }

  @override
  bool shouldReclip(CutRectangleClipperBottom oldClipper) => true;
}

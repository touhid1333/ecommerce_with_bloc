import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget padAt(
          {double? all,
          double? left,
          double? right,
          double? top,
          double? bottom,
          double? horizontal,
          double? vertical}) =>
      Padding(
        padding: all != null
            ? EdgeInsets.all(all)
            : (horizontal != null || vertical != null)
                ? EdgeInsets.symmetric(
                    horizontal: horizontal ?? 0, vertical: vertical ?? 0)
                : EdgeInsets.only(
                    left: left ?? 0,
                    right: right ?? 0,
                    top: top ?? 0,
                    bottom: bottom ?? 0,
                  ),
        child: this,
      );
}

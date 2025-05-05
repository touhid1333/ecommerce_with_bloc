// -----------------------------------
// Used to identify toast types
// -----------------------------------

import 'package:flutter/material.dart';

enum ToastType {
  success,
  error,
  info,
  warning;

  Color color() => switch (this) {
        success => Colors.green,
        error => Colors.red,
        info => Colors.blueAccent,
        warning => Colors.yellowAccent
      };
}

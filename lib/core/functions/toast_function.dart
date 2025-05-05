import 'package:ecommerce_with_bloc/core/enums/toast_type.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// --------------------------
/// Show Different Types of Toast
/// --------------------------
void showFlutterToast({required String message, required ToastType type}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    backgroundColor: type.color(),
    textColor: Colors.white,
    fontSize: 14,
  );
}

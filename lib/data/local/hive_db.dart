import 'dart:convert';

import 'package:ecommerce_with_bloc/data/models/cart/cart_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class HiveDB {
  late Box<dynamic> cartBox;
  final String _boxName = "_Cart_DB_";
  final String _cartKey = "_Cart_Key_";

  HiveDB() {
    init();
  }

  // -----------------------------------
  // Open Hive Box For Cart
  // -----------------------------------
  Future<void> init() async {
    cartBox = await Hive.openBox(_boxName);
  }

  // -----------------------------------
  // Get Cart
  // -----------------------------------
  CartModel get cart {
    final cart = cartBox.get(_cartKey);
    if (cart != null) {
      try {
        return CartModel.fromJson(jsonDecode(cart));
      } catch (e, tr) {
        // do nothing
        debugPrint("On Convert Error : \n $e \n $tr");
      }
    }
    return CartModel();
  }

  // -----------------------------------
  // Add Cart
  // -----------------------------------
  Future<void> addCartItem({required CartModel cartModel}) async {
    await cartBox.put(_cartKey, jsonEncode(cartModel.toJson()));
  }
}

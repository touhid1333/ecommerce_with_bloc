import 'package:ecommerce_with_bloc/core/enums/toast_type.dart';
import 'package:ecommerce_with_bloc/core/functions/toast_function.dart';
import 'package:ecommerce_with_bloc/data/local/hive_db.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_model.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/domain/cart_repository.dart';

class CartRepositoryImplementation extends CartRepository {
  final HiveDB _hiveDB;

  CartRepositoryImplementation(this._hiveDB);

  @override
  Future<void> addProductToCart({required ProductModel product}) async {
    CartModel cart = _hiveDB.cart;
    int indexAt = cart.cartItems
            ?.indexWhere((element) => element.product?.id == product.id) ??
        -1;
    if (indexAt == -1) {
      cart = cart.copyWith(
        totalCartCount: (cart.totalCartCount ?? 0) + 1,
        totalCartPrice: (cart.totalCartPrice ?? 0) + (product.price ?? 0),
        cartItems: [
          ...(cart.cartItems ?? []),
          CartItem(count: 1, product: product)
        ],
      );
      await _hiveDB.addCartItem(cartModel: cart);
      showFlutterToast(
          message: "Added product to cart.", type: ToastType.success);
      return;
    } else {
      showFlutterToast(
          message: "Product is already added.", type: ToastType.error);
    }
  }

  @override
  Future<void> clearCart() async {
    await _hiveDB.cartBox.clear();
  }

  @override
  Future<void> deleteItemFromCart({required CartItem item}) async {
    CartModel cart = _hiveDB.cart;
    int indexAt = cart.cartItems?.indexWhere(
            (element) => element.product?.id == item.product?.id) ??
        -1;
    if (indexAt != -1) {
      cart = cart.copyWith(
          totalCartPrice: (cart.totalCartPrice ?? 0) - (item.totalPrice ?? 0));
      cart.cartItems?.removeAt(indexAt);
      await _hiveDB.addCartItem(cartModel: cart);
    } else {
      showFlutterToast(message: "Item not found", type: ToastType.error);
    }
  }

  @override
  Future<void> updateProductInCart({required CartItem item}) async {
    CartModel cart = _hiveDB.cart;
    int indexAt = cart.cartItems?.indexWhere(
            (element) => element.product?.id == item.product?.id) ??
        -1;
    if (indexAt != -1) {
      cart.cartItems![indexAt] = item;
      double totalPrice = 0;
      for (var item in cart.cartItems!) {
        totalPrice = totalPrice + (item.totalPrice ?? 0);
      }
      cart = cart.copyWith(totalCartPrice: totalPrice);
      await _hiveDB.addCartItem(cartModel: cart);
    }
  }

  @override
  CartModel getCartDetails() {
    return _hiveDB.cart;
  }
}

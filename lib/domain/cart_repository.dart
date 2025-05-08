import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:ecommerce_with_bloc/data/models/cart/cart_model.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';

abstract class CartRepository {
  Future<void> addProductToCart({required ProductModel product});

  Future<void> updateProductInCart({required CartItem item});

  Future<void> deleteItemFromCart({required CartItem item});

  Future<void> clearCart();

  CartModel getCartDetails();
}

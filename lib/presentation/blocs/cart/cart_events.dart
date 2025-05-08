import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_events.freezed.dart';

@freezed
class CartEvents with _$CartEvents {
  const factory CartEvents.fetchCartDetails() = FetchCartDetails;

  const factory CartEvents.updateCartItem({required CartItem item}) =
      UpdateCartItem;

  const factory CartEvents.removeCartItem({required CartItem item}) =
      RemoveCartItem;

  const factory CartEvents.clearCart() = ClearCart;
}

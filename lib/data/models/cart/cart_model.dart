import 'package:ecommerce_with_bloc/data/models/cart/cart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: "totalCartCount")
  int? totalCartCount;
  @JsonKey(name: "totalCartPrice")
  double? totalCartPrice;
  @JsonKey(name: "cartItems")
  List<CartItem>? cartItems;

  CartModel({
    this.totalCartCount,
    this.totalCartPrice,
    this.cartItems,
  });

  CartModel copyWith({
    int? totalCartCount,
    double? totalCartPrice,
    List<CartItem>? cartItems,
  }) =>
      CartModel(
        totalCartCount: totalCartCount ?? this.totalCartCount,
        totalCartPrice: totalCartPrice ?? this.totalCartPrice,
        cartItems: cartItems ?? this.cartItems,
      );

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

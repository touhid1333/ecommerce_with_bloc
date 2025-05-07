import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "totalPrice")
  double? totalPrice;
  @JsonKey(name: "product")
  ProductModel? product;

  CartItem({
    this.count,
    this.totalPrice,
    this.product,
  });

  CartItem copyWith({
    int? count,
    double? totalPrice,
    dynamic product,
  }) =>
      CartItem(
        count: count ?? this.count,
        totalPrice: totalPrice ?? this.totalPrice,
        product: product ?? this.product,
      );

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

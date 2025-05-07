// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map json) => CartItem(
      count: (json['count'] as num?)?.toInt(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(
              Map<String, dynamic>.from(json['product'] as Map)),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'count': instance.count,
      'totalPrice': instance.totalPrice,
      'product': instance.product?.toJson(),
    };

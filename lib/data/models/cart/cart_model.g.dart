// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map json) => CartModel(
      totalCartCount: (json['totalCartCount'] as num?)?.toInt(),
      totalCartPrice: (json['totalCartPrice'] as num?)?.toDouble(),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'totalCartCount': instance.totalCartCount,
      'totalCartPrice': instance.totalCartPrice,
      'cartItems': instance.cartItems?.map((e) => e.toJson()).toList(),
    };

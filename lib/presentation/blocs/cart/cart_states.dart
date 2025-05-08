import 'package:ecommerce_with_bloc/data/models/cart/cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_states.freezed.dart';

@freezed
class CartStates with _$CartStates {
  const factory CartStates.initial() = _Initial;

  const factory CartStates.loading() = _Loading;

  const factory CartStates.loaded({
    required CartModel cartDetails,
  }) = _Loaded;
}

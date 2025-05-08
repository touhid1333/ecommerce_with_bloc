import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_states.freezed.dart';

@freezed
class HomeStates with _$HomeStates {
  const factory HomeStates.initial() = _Initial;

  const factory HomeStates.loading() = _Loading;

  const factory HomeStates.loaded({
    required List<String> categories,
    required List<ProductModel> products,
    int? addToCartIndex,
  }) = _Loaded;
}

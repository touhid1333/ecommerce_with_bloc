import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_events.freezed.dart';

@freezed
class HomeEvents with _$HomeEvents {
  ///
  /// Fetch Initial Data
  ///
  /// State Values Will be List<[String]> as categories and List<[ProductModel]> as products
  ///
  const factory HomeEvents.fetchInitialData() = FetchInitialData;
}

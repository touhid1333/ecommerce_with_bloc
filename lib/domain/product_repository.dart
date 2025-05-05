import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';

abstract class ProductRepository {
  ///
  /// ## Categories Available
  ///
  /// Response: List<[String]> i.e. all categories name.
  Future<List<String>> fetchingCategories();

  ///
  /// ## Available Products
  ///
  /// Response: List<[ProductModel]>
  Future<List<ProductModel>> fetchingProducts();

  ///
  /// ## Available Products By Category
  ///
  /// Request: [String] i.e. category name
  ///
  /// Response: List<[ProductModel]>
  Future<List<ProductModel>> fetchingProductsByCategory(
      {required String categoryName});

  ///
  /// ## Single Product
  ///
  /// Request: [int] i.e. product id
  ///
  /// Response: [ProductModel] if available else [null]
  Future<ProductModel?> fetchingProductById({required int productId});
}

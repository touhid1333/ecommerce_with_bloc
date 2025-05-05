import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/data/network/api_client.dart';
import 'package:ecommerce_with_bloc/domain/product_repository.dart';

class ProductRepositoryImplementation extends ProductRepository {
  final ApiClient _client;

  ProductRepositoryImplementation(this._client);

  @override
  Future<List<String>> fetchingCategories() {
    return _client
        .fetchCategories()
        .then((value) => value.response ?? <String>[])
        .onError((error, stackTrace) => <String>[]);
  }

  @override
  Future<ProductModel?> fetchingProductById({required int productId}) {
    return _client
        .fetchProductById(productId)
        .then((value) => value.response)
        .onError((error, stackTrace) => null);
  }

  @override
  Future<List<ProductModel>> fetchingProducts() {
    return _client
        .fetchProducts()
        .then((value) => value.response ?? <ProductModel>[])
        .onError((error, stackTrace) => <ProductModel>[]);
  }

  @override
  Future<List<ProductModel>> fetchingProductsByCategory(
      {required String categoryName}) {
    return _client
        .fetchProductsByCategory(categoryName)
        .then((value) => value.response ?? <ProductModel>[])
        .onError((error, stackTrace) => <ProductModel>[]);
  }
}

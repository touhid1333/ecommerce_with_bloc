import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:ecommerce_with_bloc/data/network/api_client.dart';
import 'package:ecommerce_with_bloc/domain/product_repository.dart';

class ProductRepositoryImplementation extends ProductRepository {
  final ApiClient _client;

  ProductRepositoryImplementation(this._client);

  @override
  Future<List<String>> fetchingCategories() async {
    return await _client.fetchCategories().then((value) {
      print("*******************8 ${value}");
      return value ?? <String>[];
    }).onError((error, stackTrace) => <String>[]);
  }

  @override
  Future<ProductModel?> fetchingProductById({required int productId}) {
    return _client.fetchProductById(productId).then((value) => value);
  }

  @override
  Future<List<ProductModel>> fetchingProducts() async {
    return await _client
        .fetchProducts()
        .then((value) => value ?? <ProductModel>[])
        .onError((error, stackTrace) {
      print("*******************8 ${error} ********** $stackTrace");
      return <ProductModel>[];
    });
  }

  @override
  Future<List<ProductModel>> fetchingProductsByCategory(
      {required String categoryName}) {
    return _client
        .fetchProductsByCategory(categoryName)
        .then((value) => value ?? <ProductModel>[])
        .onError((error, stackTrace) => <ProductModel>[]);
  }
}

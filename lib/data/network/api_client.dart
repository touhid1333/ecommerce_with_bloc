import 'package:ecommerce_with_bloc/data/models/auth/login_request.dart';
import 'package:ecommerce_with_bloc/data/models/auth/login_response.dart';
import 'package:ecommerce_with_bloc/data/models/product/product_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // -----------------------------------
  // Auth Related APIs
  // -----------------------------------
  @POST("auth/login")
  Future<LoginResponse> logInUser(@Body() LoginRequest request);

  // -----------------------------------
  // Product Related APIs
  // -----------------------------------
  @GET("products")
  Future<List<ProductModel>> fetchProducts();

  @GET("products/categories")
  Future<List<String>> fetchCategories();

  @GET("products/category/{categoryName}")
  Future<List<ProductModel>> fetchProductsByCategory(
      @Path("categoryName") String categoryName);

  @GET("products/{productId}")
  Future<ProductModel> fetchProductById(@Path("productId") int productId);
}

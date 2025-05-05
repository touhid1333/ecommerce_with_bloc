import 'package:ecommerce_with_bloc/app_config.dart';
import 'package:ecommerce_with_bloc/core/services/custom_interceptor.dart';
import 'package:ecommerce_with_bloc/data/network/api_client.dart';
import 'package:ecommerce_with_bloc/data/repositoryImplementation/auth_repository_implementation.dart';
import 'package:ecommerce_with_bloc/data/repositoryImplementation/local_storage_implementation.dart';
import 'package:ecommerce_with_bloc/data/repositoryImplementation/product_repository_implementation.dart';
import 'package:ecommerce_with_bloc/domain/auth_repository.dart';
import 'package:ecommerce_with_bloc/domain/local_storage.dart';
import 'package:ecommerce_with_bloc/domain/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

// -----------------------------------
// Global Locator Instance
// -----------------------------------
GetIt locator = GetIt.instance;

// -----------------------------------
// Initializer
// -----------------------------------
Future<void> locatorServiceInit() async {
  // local storage
  locator
      .registerLazySingleton<LocalStorage>(() => LocalStorageImplementation());

  // Rest Client
  locator.registerLazySingleton<ApiClient>(
    () => ApiClient(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: AppConfig.baseURL,
        ),
      )..interceptors.add(
          CustomInterceptors(
            dio: Dio(),
            localStorage: locator.get(),
          ),
        ),
    ),
  );

  // auth repo
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImplementation(locator.get()));

  // product repo
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImplementation(locator.get()));
}

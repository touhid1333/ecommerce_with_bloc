import 'package:ecommerce_with_bloc/app_config.dart';
import 'package:ecommerce_with_bloc/core/services/custom_interceptor.dart';
import 'package:ecommerce_with_bloc/data/network/api_client.dart';
import 'package:ecommerce_with_bloc/data/repositoryImplementation/auth_repo_impl.dart';
import 'package:ecommerce_with_bloc/data/repositoryImplementation/local_storage_impl.dart';
import 'package:ecommerce_with_bloc/domain/auth_repo.dart';
import 'package:ecommerce_with_bloc/domain/local_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart' hide Headers;

// -----------------------------------
// Global Dependency Instance
// -----------------------------------
GetIt locator = GetIt.instance;

// -----------------------------------
// Initializer
// -----------------------------------
Future<void> locatorServiceInit() async {
  // local storage
  locator.registerLazySingleton<LocalStorage>(() => LocalStorageImpl());

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
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImplementation());
}

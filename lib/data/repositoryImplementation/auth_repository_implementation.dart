import 'package:ecommerce_with_bloc/core/services/error_handler.dart';
import 'package:ecommerce_with_bloc/data/models/auth/login_request.dart';
import 'package:ecommerce_with_bloc/data/models/auth/login_response.dart';
import 'package:ecommerce_with_bloc/data/models/base_response.dart';
import 'package:ecommerce_with_bloc/data/network/api_client.dart';
import 'package:ecommerce_with_bloc/domain/auth_repository.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final ApiClient _client;

  AuthRepositoryImplementation(this._client);

  @override
  Future<LoginResponse> loggingUser({required LoginRequest request}) async {
    return _client.logInUser(request).then((value) => value);
  }
}

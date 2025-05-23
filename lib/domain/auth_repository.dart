import 'package:ecommerce_with_bloc/data/models/auth/login_request.dart';
import 'package:ecommerce_with_bloc/data/models/auth/login_response.dart';

abstract class AuthRepository{
  /// ## Log In User
  ///
  /// Request : [LoginRequest]
  ///
  /// Response : [LoginResponse]
  Future<LoginResponse> loggingUser(
      {required LoginRequest request});
}

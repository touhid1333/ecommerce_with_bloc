import 'package:ecommerce_with_bloc/data/models/auth/login_request.dart';
import 'package:ecommerce_with_bloc/data/models/auth/login_response.dart';
import 'package:ecommerce_with_bloc/data/models/base_response.dart';

abstract class AuthRepository{
  /// ## Log In User
  ///
  /// Request : [LoginRequest]
  ///
  /// Response : [LoginResponse]
  Future<BaseResponse<LoginResponse>> loggingUser(
      {required LoginRequest request});
}

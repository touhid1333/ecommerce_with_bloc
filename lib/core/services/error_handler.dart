import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_with_bloc/data/models/base_response.dart';

class ErrorHandler {
  static BaseResponse<T> error<T>(Object? error, StackTrace? stackTrace) {
    log(error.toString());
    log(stackTrace.toString());

    switch (error.runtimeType) {
      case DioException:
        final res = (error as DioException).response;
        String errorMessage = res?.statusMessage ?? '';

        // Try to extract error message from response data if it exists
        if (res?.data != null) {
          try {
            final responseData = res!.data;
            if (responseData is Map<String, dynamic>) {
              // Handle errors object if present (like in your example)
              if (responseData['errors'] != null &&
                  responseData['errors'] is Map) {
                final errors = responseData['errors'] as Map;
                // Get first error message from the errors map
                if (errors.isNotEmpty) {
                  final firstErrorKey = errors.keys.first;
                  final firstErrorList = errors[firstErrorKey] as List;
                  if (firstErrorList.isNotEmpty) {
                    errorMessage = firstErrorList.first.toString();
                  }
                }
              } else if (responseData['errors'] != null &&
                  responseData['errors'] is String) {
                errorMessage = responseData['errors'];
              }
              // Fallback to direct message if errors object not present
              else if (responseData['message'] != null) {
                errorMessage = responseData['message'].toString();
              }
            }
          } catch (e) {
            log('Error parsing error response: $e');
          }
        }

        return BaseResponse(
          success: false,
          code: res?.statusCode ?? 501,
          message: errorMessage,
        );
      default:
        return BaseResponse(
          success: false,
          code: 501,
          message: error.toString(),
        );
    }
  }
}

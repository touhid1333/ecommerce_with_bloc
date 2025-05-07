import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    required this.success,
    required this.code,
    this.response,
    this.errors,
    this.message,
  });

  @JsonKey(name: 'response')
  T? response;
  bool success;
  int code;
  dynamic errors;
  String? message;

  factory BaseResponse.fromJson(dynamic json, Function(dynamic) create) {
    if (json is List) {
      return BaseResponse(
        success: true,
        code: 200,
        response: json != null ? create(json) : null,
        errors: '',
        message: '',
      );
    }
    return BaseResponse(
      success: json['success'] ?? false,
      code: json['code'] ?? 501,
      response: json["response"] != null ? create(json["response"]) : null,
      errors: json['errors'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'code': code,
      'response': response,
      'errors': errors,
      'message': message,
    };
  }
}

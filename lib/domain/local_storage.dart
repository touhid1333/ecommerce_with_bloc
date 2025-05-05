abstract class LocalStorage {

  /// get refresh token
  String get refreshToken;

  /// set refresh token
  void setRefreshToken({required String value});

  /// get token
  String get token;

  /// set token
  void setToken(String val);

  /// get userId
  String get userId;

  /// set userId
  void setUserId(String val);

  /// get email
  String get loginEmail;

  /// set email
  void setLoginEmail(String val);

  /// get password
  String get loginPassword;

  /// set password
  void setLoginPassword(String val);

  /// clear all stored data
  void clear();
}

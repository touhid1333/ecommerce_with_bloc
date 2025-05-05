import 'package:ecommerce_with_bloc/domain/local_storage.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageImpl extends LocalStorage {
  LocalStorageImpl() {
    getStorage = GetStorage();
  }

  final _tokenKey = '_token_key_';
  final _userIdKey = '_user_id_key_';
  final _refreshToken = '_refresh_token_';
  final _loginEmail = '_login_email_';
  final _loginPassword = '_login_password_';

  late GetStorage getStorage;

  @override
  String get token => getStorage.read(_tokenKey) ?? '';

  @override
  void setToken(String val) {
    getStorage.write(_tokenKey, val);
  }

  @override
  void clear() {
    getStorage.erase();
  }

  @override
  String get refreshToken => getStorage.read(_refreshToken) ?? "";

  @override
  void setRefreshToken({required String value}) {
    getStorage.write(_refreshToken, value);
  }

  @override
  void setUserId(String val) {
    getStorage.write(_userIdKey, val);
  }

  @override
  String get userId => getStorage.read(_userIdKey) ?? "";

  @override
  String get loginEmail => getStorage.read(_loginEmail) ?? "";

  @override
  String get loginPassword => getStorage.read(_loginPassword) ?? "";

  @override
  void setLoginPassword(String val) {
    getStorage.write(_loginPassword, val);
  }

  @override
  void setLoginEmail(String val) {
    getStorage.write(_loginEmail, val);
  }
}

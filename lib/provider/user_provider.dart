import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constant.dart';
import '../model/user.dart';
import '../network/remote_data_source.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  late final SharedPreferences _preferences;

  String? get token => _token;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString(keyToken);
  }

  Future<User> login({
    required String email,
    required String password,
  }) async {
    User auth = await RemoteDataSource.login(
      email: email,
      password: password,
    );
    _token = auth.data?.token;
    if (_token != null) {
      await _preferences.setString(
        keyToken,
        _token!,
      );
    }
    notifyListeners();
    return auth;
  }

  Future<void> logout() async {
    _token = null;
    await _preferences.remove(keyToken);
    notifyListeners();
  }
}

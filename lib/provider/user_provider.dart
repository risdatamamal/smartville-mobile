import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constant.dart';
import '../model/user_response.dart';
import '../model/register_response.dart';
import '../network/remote_data_source.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  String? _imageProfile;
  String? _userName;
  late final SharedPreferences _preferences;

  String? get token => _token;
  String? get imageProfile => _imageProfile;
  String? get userName => _userName;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _token = _preferences.getString(keyToken);
    _imageProfile = _preferences.getString(keyImageProfile);
    _userName = _preferences.getString(keyUserName);
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
    _imageProfile = auth.data?.profilePic;
    _userName = auth.data?.nama;
    if (_token != null) {
      await _preferences.setString(
        keyToken,
        _token!,
      );
      await _preferences.setString(
        keyImageProfile,
        _imageProfile!,
      );
      await _preferences.setString(
        keyUserName,
        _userName!,
      );
    }
    notifyListeners();
    return auth;
  }

  Future<Register> register({
    required String nik,
    required String nama,
    required String email,
    required String password,
    required String tglLahir,
    required String tempatLahir,
    required String alamat,
    required String dusun,
    required String rt,
    required String rw,
    required int jenisKelamin,
    required String noHp,
    File? profilePic,
  }) async {
    Register register = await RemoteDataSource.register(
      nik: nik,
      nama: nama,
      email: email,
      password: password,
      tglLahir: tglLahir,
      tempatLahir: tempatLahir,
      alamat: alamat,
      dusun: dusun,
      rt: rt,
      rw: rw,
      jenisKelamin: jenisKelamin,
      noHp: noHp,
      imageProfile: profilePic,
    );
    _token = register.data.token;
    _imageProfile = register.data.profilePic;
    _userName = register.data.nama;
    if (_token != null) {
      await _preferences.setString(
        keyToken,
        _token!,
      );
      await _preferences.setString(
        keyImageProfile,
        _imageProfile!,
      );
      await _preferences.setString(
        keyUserName,
        _userName!,
      );
    }
    notifyListeners();
    return register;
  }

  Future<void> logout() async {
    _token = null;
    await _preferences.remove(keyToken);
    notifyListeners();
  }
}

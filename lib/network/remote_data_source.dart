import 'dart:io';

import 'package:dio/dio.dart';

import '../common/constant.dart';
import '../model/user_response.dart';
import '../model/register_response.dart';

class RemoteDataSource {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
      validateStatus: (int? code) {
        return true;
      },
    ),
  );

  static Future<User> login({
    required String email,
    required String password,
  }) async {
    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    Response<String> response = await _dio.post<String>(
      '/login',
      data: formData,
    );
    return userFromJson(response.data ?? "");
  }

  static Future<Register> register({
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
    File? imageProfile,
  }) async {
    var formData = FormData.fromMap({
      'nik': nik,
      'nama': nama,
      'email': email,
      'password': password,
      'tgl_lahir': tglLahir,
      'tempat_lahir': tempatLahir,
      'alamat': alamat,
      'dusun': dusun,
      'rt': rt,
      'rw': rw,
      'jenis_kelamin': jenisKelamin,
      'no_hp': noHp,
      if (imageProfile != null) 'profile_pic': imageProfile,
    });

    Response<String> response = await _dio.post<String>(
      '/register',
      data: formData,
    );
    return registerFromJson(response.data ?? "");
  }
}

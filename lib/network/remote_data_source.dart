import 'dart:io';

import 'package:dio/dio.dart';
import 'package:smartville/model/forgot_password_response.dart';
import 'package:smartville/model/otp_response.dart';
import 'package:smartville/model/pelaporan_response.dart';
import 'package:smartville/model/permohonan_surat_response.dart';

import '../common/constant.dart';
import '../model/user_response.dart';
import '../model/news_response.dart';
import '../model/register_response.dart';

class RemoteDataSource {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.plain,
      contentType: 'multipart/form-data',
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
      if (imageProfile != null)
        'profile_pic': await MultipartFile.fromFile(imageProfile.path),
    });

    Response<String> response = await _dio.post<String>(
      '/register',
      data: formData,
    );
    return registerFromJson(response.data ?? "");
  }

  static Future<List<Datum>> newsList() async {
    Response<String> response = await _dio.get<String>('/news');
    return newsFromJson(response.data ?? "").data as List<Datum>;
  }

  static Future<PermohonanSurat> permohonanSurat(String token) async {
    _dio.options.headers["authorization"] = "token $token";
    Response<String> response = await _dio.get('/introductionmail');
    return permohonanSuratFromJson(response.data ?? "");
  }

  static Future<Pelaporan> pelaporan(String token) async {
    _dio.options.headers["authorization"] = "token $token";
    Response<String> response = await _dio.get('/report');
    return pelaporanFromJson(response.data ?? "");
  }

  static Future<OtpResponse> sendOtp({required String email}) async {
    var formData = FormData.fromMap({
      'to': email,
      'subject': 'Konfirmasi Reset Password',
    });
    Response<String> response = await _dio.post<String>(
      '/user/email-verif',
      data: formData,
    );
    return otpResponseFromJson(response.data ?? "");
  }

  static Future<ForgotPasswordResponse> forgotPassword({
    required String email,
    required String newPassword,
  }) async {
    var formData = FormData.fromMap({
      'email': email,
      'new_password': newPassword,
    });
    Response<String> response = await _dio.put<String>(
      '/user/forgot-password',
      data: formData,
    );
    return forgotPasswordResponseFromJson(response.data ?? "");
  }
}

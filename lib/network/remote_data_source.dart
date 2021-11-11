import 'package:dio/dio.dart';

import '../common/constant.dart';
import '../model/user.dart';

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
}

import 'package:flutter/material.dart';

import '../network/remote_data_source.dart';
import '../model/request_support_response.dart';

class RequestSupportProvider with ChangeNotifier {
  Future<RequestSupport> submitRequestSupport({
    required String token,
    required String namaBantuan,
    required String jenisBantuan,
    required int jumlahDana,
    required int alokasiDana,
    required int danaTerealisasi,
    required int sisaDanaBantuan,
    required String registrationToken,
  }) async {
    RequestSupport requestSupport = await RemoteDataSource.requestSupport(token,
        namaBantuan,
        jenisBantuan,
        jumlahDana,
        alokasiDana,
        danaTerealisasi,
        sisaDanaBantuan,
        registrationToken);
    notifyListeners();
    return requestSupport;
  }
}

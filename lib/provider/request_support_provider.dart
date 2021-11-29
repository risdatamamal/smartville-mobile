import 'package:flutter/material.dart';
import 'package:smartville/model/request_support_response.dart';
import 'package:smartville/network/remote_data_source.dart';

class RequestSupportProvider with ChangeNotifier {
  Future<RequestSupport> submitRequestSupport({
    required String token,
    required String nama_bantuan,
    required String jenis_bantuan,
    required int jumlah_dana,
    required int alokasi_dana,
    required int dana_terealisasi,
    required int sisa_dana_bantuan,
  }) async {
    RequestSupport requestSupport = await RemoteDataSource.requestSupport(token: token,
        nama_bantuan: nama_bantuan,
        jenis_bantuan: jenis_bantuan,
        jumlah_dana: jumlah_dana,
        alokasi_dana: alokasi_dana,
        dana_terealisasi: dana_terealisasi,
        sisa_dana_bantuan: sisa_dana_bantuan);
    notifyListeners();
    return requestSupport;
  }
}

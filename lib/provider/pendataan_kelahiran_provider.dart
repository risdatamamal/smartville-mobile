import 'package:flutter/material.dart';

import '../network/remote_data_source.dart';
import '../model/pendataan_kelahiran_response.dart';

class PendataanKelahiranProvider with ChangeNotifier {
  Future<PendataanKelahiran> submitPendataanKelahiran({
    required String token,
    required String namaBayi,
    required bool jenisKelamin,
    required String namaAyah,
    required String namaIbu,
    required int anakKe,
    required String tanggalKelahiran,
    required String alamatKelahiran,
    required String registrationToken,

  }) async {
    PendataanKelahiran pendataanKelahiran =
        await RemoteDataSource.pendataanKelahiran(
      token,
      namaBayi,
      jenisKelamin,
      namaAyah,
      namaIbu,
      anakKe,
      tanggalKelahiran,
      alamatKelahiran,
      registrationToken,
    );
    notifyListeners();
    return pendataanKelahiran;
  }
}

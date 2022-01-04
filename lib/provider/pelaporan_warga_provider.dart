import 'dart:io';

import 'package:flutter/material.dart';

import '../network/remote_data_source.dart';
import '../model/pelaporan_response.dart';

class PelaporanWargaProvider with ChangeNotifier {
  Future<Pelaporan> submitLaporan({
    required String token,
    required String namaPelapor,
    required String keteranganKejadian,
    required String jenisLaporan,
    required String tanggalLaporan,
    required String noHp,
    required String alamatLaporan,
    required File dokumentasiKejadian,
    required String registrationToken,
  }) async {
    Pelaporan pelaporan = await RemoteDataSource.pelaporan(
        token,
        namaPelapor,
        keteranganKejadian,
        tanggalLaporan,
        jenisLaporan,
        noHp,
        alamatLaporan,
        dokumentasiKejadian,
        registrationToken);
    notifyListeners();
    return pelaporan;
  }
}

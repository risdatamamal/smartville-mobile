import 'package:flutter/material.dart';

import '../network/remote_data_source.dart';
import '../model/permohonan_surat_response.dart';

class PermohohonanSuratProvider with ChangeNotifier {
  Future<PermohonanSurat> submitSuratPermohonan({
    required String token,
    required String nikPemohon,
    required String namaPemohon,
    required String alamatPemohon,
    required String noHp,
    required String jenisSurat,
    required String registrationToken,
  }) async {
    PermohonanSurat permohonanSurat = await RemoteDataSource.permohonanSurat(
        token,
        nikPemohon,
        namaPemohon,
        alamatPemohon,
        noHp,
        jenisSurat,
        registrationToken);
    notifyListeners();
    return permohonanSurat;
  }
}

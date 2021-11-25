import 'package:flutter/cupertino.dart';
import 'package:smartville/model/permohonan_surat_response.dart';
import 'package:smartville/network/remote_data_source.dart';

class PermohohonanSuratProvider with ChangeNotifier {
  Future<PermohonanSurat> submitSuratPermohonan({
    required String token,
    required String nikPemohon,
    required String namaPemohon,
    required String alamatPemohon,
    required String noHp,
    required String jenisSurat,
  }) async {
    PermohonanSurat permohonanSurat =
        await RemoteDataSource.permohonanSurat(token);
    notifyListeners();
    return permohonanSurat;
  }
}

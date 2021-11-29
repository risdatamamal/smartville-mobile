import 'dart:convert';

RequestSupport requestSupportFromJson(String str) =>
    RequestSupport.fromJson(json.decode(str));

String requestSupportToJson(RequestSupport data) => json.encode(data.toJson());

class RequestSupport {
  RequestSupport({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  DataRequestSupport? data;

  factory RequestSupport.fromJson(Map<String, dynamic> json) => RequestSupport(
        error: json["error"],
        message: json["message"],
        data: DataRequestSupport.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataRequestSupport {
  int id;
  String nama_bantuan;
  String jenis_bantuan;
  int jumlah_dana;
  int alokasi_dana;
  int dana_terealisasi;
  int sisa_dana_bantuan;

  DataRequestSupport({
    required this.id,
    required this.nama_bantuan,
    required this.jenis_bantuan,
    required this.jumlah_dana,
    required this.alokasi_dana,
    required this.dana_terealisasi,
    required this.sisa_dana_bantuan,
  });

  factory DataRequestSupport.fromJson(Map<String, dynamic> json) =>
      DataRequestSupport(
        id: json['Id'],
        nama_bantuan: json["nama_bantuan"],
        jenis_bantuan: json["jenis_bantuan"],
        jumlah_dana: json["jumlah_dana"],
        alokasi_dana: json["alokasi_dana"],
        dana_terealisasi: json["dana_terealisasi"],
        sisa_dana_bantuan: json["sisa_dana_bantuan"],
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        "nama_bantuan": nama_bantuan,
        "jenis_bantuan": jenis_bantuan,
        "jumlah_dana": jumlah_dana,
        "alokasi_dana": alokasi_dana,
        "dana_terealisasi": dana_terealisasi,
        "sisa_dana_bantuan": sisa_dana_bantuan,
      };
}

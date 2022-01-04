import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/widgets/custom_scaffold.dart';

import '../common/colors.dart';
import '../common/text_styles.dart';
import '../model/notification_message.dart';
import '../model/request_support_response.dart';
import '../provider/request_support_provider.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_select_option.dart';

import 'notifikasi_berhasil_page.dart';

class RequestSupportPage extends StatefulWidget {
  const RequestSupportPage({Key? key}) : super(key: key);
  static const routeName = 'requestsupport';

  @override
  State<RequestSupportPage> createState() => _RequestSupportState();
}

class _RequestSupportState extends State<RequestSupportPage> {
  TextEditingController namaBantuanController = TextEditingController();
  TextEditingController jenisBantuanController = TextEditingController();
  TextEditingController jenisBantuanLainnyaController = TextEditingController();
  TextEditingController jumlahDanaController = TextEditingController();
  TextEditingController alokasiDanaController = TextEditingController();
  TextEditingController danaTerealisasiController = TextEditingController();
  TextEditingController sisadanaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;
  bool jenisBantuanLainnya = false;

  Future<void> _submitFinancialHelp(
      String namaBantuan,
      String jenisBantuan,
      String jumlahDana,
      String alokasiDana,
      String danaTerealisasi,
      String sisaDanaBantuan) async {
    setState(() => _onSend = true);

    var jumlahDanaParse = int.parse(jumlahDana);
    assert(jumlahDanaParse is int);
    var alokasiDanaParse = int.parse(alokasiDana);
    assert(alokasiDanaParse is int);
    var danaTerealisasiParse = int.parse(danaTerealisasi);
    assert(danaTerealisasiParse is int);
    var sisaDanaBantuanParse = int.parse(sisaDanaBantuan);
    assert(sisaDanaBantuanParse is int);

    UserProvider userProvider = context.read<UserProvider>();
    RequestSupportProvider requestSupportProvider =
        context.read<RequestSupportProvider>();
    String token = userProvider.token ?? "";
    String registrationToken = userProvider.tokenFCM ?? "";
    RequestSupport requestSupport =
        await requestSupportProvider.submitRequestSupport(
      token: token,
      namaBantuan: namaBantuan,
      jenisBantuan: jenisBantuan,
      jumlahDana: jumlahDanaParse,
      alokasiDana: alokasiDanaParse,
      danaTerealisasi: danaTerealisasiParse,
      sisaDanaBantuan: sisaDanaBantuanParse,
      registrationToken: registrationToken,
    );

    if (requestSupport.error == false) {
      NotificationMessage notificationMessage = NotificationMessage(
        imageAssets: 'assets/celebration.png',
        title: "Permohonan Terkirim!",
        message:
            "Permohonan telah dikirim. Silahkan tunggu notifikasi dari admin.",
        textButton: "Kembali ke halaman dashboard",
        navigateTo: "dashboard",
      );
      Navigator.pushNamed(context, NotifikasiBerhasilPage.routeName,
          arguments: notificationMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            requestSupport.message ?? "",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            requestSupport.message ?? "",
          ),
        ),
      );
    }
    setState(() => _onSend = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        textAppbar: "Permohonan Bantuan Desa",
        children: [
          const SizedBox(height: 15),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Bantuan',
                  style: greyText,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  textEditingController: namaBantuanController,
                  textHint: 'Masukan Nama Bantuan',
                ),
                const SizedBox(height: 20),
                Text(
                  'Jenis Bantuan',
                  style: greyText,
                ),
                CustomSelectOption(
                  items: const [
                    'Perbaikan Jalan',
                    'Perbaikan Sekolah',
                    'Perbaikan Masjid',
                    'Lainnya'
                  ],
                  onChanged: (val) {
                    jenisBantuanController.text = val ?? "";
                    if (val == "Lainnya") {
                      setState(() {
                        jenisBantuanLainnya = true;
                      });
                    } else {
                      setState(() {
                        jenisBantuanLainnya = false;
                      });
                    }
                  },
                ),
                jenisBantuanLainnya
                    ? const SizedBox(height: 20)
                    : const SizedBox(height: 0),
                jenisBantuanLainnya
                    ? Text(
                        'Isi Jenis Bantuan Lainnya',
                        style: greyText,
                      )
                    : const SizedBox(height: 0),
                jenisBantuanLainnya
                    ? CustomFormField(
                        textEditingController: jenisBantuanLainnyaController,
                        textHint: 'Masukan jenis bantuan lainnya',
                      )
                    : const SizedBox(height: 0),

                /*const SizedBox(height: 4),
                            CustomFormField(
                              textEditingController: jenisBantuanController,
                              textHint: 'Masukan Jenis Bantuan',
                            ),*/
                const SizedBox(height: 20),
                Text(
                  'Jumlah Dana',
                  style: greyText,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  textEditingController: jumlahDanaController,
                  textHint: 'Masukan Jumlah Dana',
                  typeNumber: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'Alokasi Dana',
                  style: greyText,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  textEditingController: alokasiDanaController,
                  textHint: 'Masukkan Alokasi Dana',
                  typeNumber: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'Dana Terealisasi',
                  style: greyText,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  textEditingController: danaTerealisasiController,
                  textHint: 'Masukkan Dana Yang Terealisasikan',
                  typeNumber: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'Sisa Dana Bantuan',
                  style: greyText,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  textEditingController: sisadanaController,
                  textHint: 'Masukkan Sisa Dana Bantuan',
                  typeNumber: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: _onSend
                ? const LinearProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            text:
                                "Apakah Anda yakin data yang dimasukan sudah benar ?",
                            onClick: () {
                              _submitFinancialHelp(
                                  namaBantuanController.text.toString(),
                                  jenisBantuanController.text.toString(),
                                  jumlahDanaController.text.toString(),
                                  alokasiDanaController.text.toString(),
                                  danaTerealisasiController.text.toString(),
                                  sisadanaController.text.toString());
                              Navigator.pop(context);
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Simpan',
                      style: blackText.copyWith(fontSize: 16),
                    ),
                  ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/model/notification_message.dart';
import 'package:smartville/model/permohonan_surat_response.dart';
import 'package:smartville/pages/notifikasi_berhasil_page.dart';
import 'package:smartville/provider/permohonan_surat_provider.dart';
import 'package:smartville/provider/user_provider.dart';
import 'package:smartville/widgets/custom_dialog.dart';
import 'package:smartville/widgets/custom_form_field.dart';
import 'package:smartville/widgets/custom_select_option.dart';

class PermohohonanSuratPengantarPage extends StatefulWidget {
  const PermohohonanSuratPengantarPage({Key? key}) : super(key: key);
  static const routeName = 'permohohonan_surat_pengantar_page';

  @override
  _PermohohonanSuratPengantarState createState() =>
      _PermohohonanSuratPengantarState();
}

class _PermohohonanSuratPengantarState
    extends State<PermohohonanSuratPengantarPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController suratPermohonanController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;

  Future<void> _autoFillForm() async {
    UserProvider provider = context.read<UserProvider>();
    String userName = provider.userName ?? "";
    String userTelp = provider.userTelp ?? "";
    String userNik = provider.userNik ?? "";
    String userAlamat = provider.userAlamat ?? "";

    setState(() {
      nikController.text = userNik;
      namaController.text = userName;
      noHpController.text = userTelp;
      alamatController.text = userAlamat;
    });
  }

  Future<void> _submitPermohonanSurat(String nikPemohon, String namaPemohon,
      String alamatPemohon, String noHp, String jenisSurat) async {
    setState(() => _onSend = true);

    UserProvider userProvider = context.read<UserProvider>();
    PermohohonanSuratProvider permohonanSuratProvider =
        context.read<PermohohonanSuratProvider>();
    String token = userProvider.token ?? "";
    String registrationToken = userProvider.tokenFCM ?? "";
    PermohonanSurat permohonanSurat =
        await permohonanSuratProvider.submitSuratPermohonan(
      token: token,
      nikPemohon: nikPemohon,
      namaPemohon: namaPemohon,
      alamatPemohon: alamatPemohon,
      noHp: noHp,
      jenisSurat: jenisSurat,
      registrationToken: registrationToken,
    );

    if (permohonanSurat.error == false) {
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            permohonanSurat.message ?? "",
          ),
        ),
      );
    }
    setState(() => _onSend = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70C7BA),
      appBar: AppBar(
        title: Text(
          'Permohonan Surat Pengantar',
          style: whiteText.copyWith(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF70C7BA),
        elevation: 0.0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                height: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: TextButton(
                                child: const Text(
                                    'Gunakan data saya untuk mengisi form'),
                                onPressed: () => {_autoFillForm()},
                              ),
                            ),
                            Text(
                              'NIK',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                              textEditingController: nikController,
                              textHint: 'Masukan NIK',
                              maxLength: 16,
                              isStrictLength: true,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              typeNumber: true,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Nama Lengkap',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController: namaController,
                              textHint: 'Masukan Nama Lengkap',
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Alamat',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController: alamatController,
                              textHint: 'Masukan Alamat',
                              typeMultiline: true,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No.Hp',
                              style: greyText,
                            ),
                            CustomFormField(
                              typeNumber: true,
                              textEditingController: noHpController,
                              textHint: 'Masukan No Hp',
                              maxLength: 12,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Surat Yang Dibuat',
                              style: greyText,
                            ),
                            CustomSelectOption(
                              items: const [
                                'Surat Pengantar KTP',
                                'Surat Pengantar SKCK',
                                'Surat Permohonan Kartu Keluarga',
                                'Surat Permohonan KTP'
                              ],
                              onChanged: (val) {
                                suratPermohonanController.text = val ?? "";
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                                                _submitPermohonanSurat(
                                                    nikController.text,
                                                    namaController.text,
                                                    noHpController.text,
                                                    alamatController.text,
                                                    suratPermohonanController
                                                        .text);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Submit',
                                        style: blackText.copyWith(fontSize: 16),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

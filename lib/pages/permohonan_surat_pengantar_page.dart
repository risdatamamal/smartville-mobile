import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';

import '../widgets/custom_scaffold.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';
import '../model/notification_message.dart';
import '../model/permohonan_surat_response.dart';
import '../provider/permohonan_surat_provider.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_select_option.dart';

import 'notifikasi_berhasil_page.dart';

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
  bool isChecked = false;

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

  _resetForm() {
    _formKey.currentState?.reset();
    nikController.clear();
    namaController.clear();
    noHpController.clear();
    alamatController.clear();
  }

  Future<void> _submitPermohonanSurat(
    String nikPemohon,
    String namaPemohon,
    String alamatPemohon,
    String noHp,
    String jenisSurat,
  ) async {
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
      Navigator.pushNamed(
        context,
        NotifikasiBerhasilPage.routeName,
        arguments: notificationMessage,
      );
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return const Color(0xFFF38263);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        textAppbar: 'Permohonan Surat Pengantar',
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Theme(
                    //   data: ThemeData(
                    //     unselectedWidgetColor: redColor,
                    //   ),
                    //   child: CheckboxListTile(
                    //     controlAffinity: ListTileControlAffinity.leading,
                    //     contentPadding: const EdgeInsets.all(0),
                    //     title: Text(
                    //       "Klik untuk pakai data saya",
                    //       style: orangeText.copyWith(
                    //         fontSize: 14,
                    //         decoration: TextDecoration.underline,
                    //       ),
                    //     ),
                    //     value: isChecked,
                    //     activeColor: redColor,
                    //     selectedTileColor: redColor,
                    //     onChanged: (newValue) {
                    //       setState(() {
                    //         isChecked = newValue!;
                    //         if (isChecked) {
                    //           _autoFillForm();
                    //         } else {
                    //           _resetForm();
                    //         }
                    //       });
                    //     },
                    //   ),
                    // ),
                    const SizedBox(height: 8),
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
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      typeNumber: true,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 20,
                          child: Checkbox(
                            value: isChecked,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            onChanged: (val) {
                              setState(() {
                                isChecked = val!;
                              });
                              if (isChecked) {
                                _autoFillForm();
                              } else {
                                _resetForm();
                              }
                            },
                            activeColor: Colors.white,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'Centang untuk pakai data saya',
                            style: orangeText.copyWith(
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            setState(() {
                              !isChecked;
                            });
                          },
                        ),
                      ],
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
                      maxLength: 14,
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
                                          suratPermohonanController.text,
                                        );
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

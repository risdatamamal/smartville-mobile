import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/model/register.dart';
import 'package:smartville/pages/register_page_3.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class RegisterPage2 extends StatefulWidget {
  final RegisterData user;

  const RegisterPage2({Key? key, required this.user}) : super(key: key);
  static const routeName = 'register_page_2';

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

enum JenisKelamin { L, P }

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController rtController = TextEditingController();
  TextEditingController dusunController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  bool? checkSyarat = false;

  JenisKelamin? _jenisKelamin = JenisKelamin.L;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    rtController.dispose();
    dusunController.dispose();
    emailController.dispose();
    pwController.dispose();
    pwConfirmController.dispose();
    super.dispose();
  }

  _sendData() {
    int rt = int.parse(rtController.text.split('/')[0]);
    int rw = int.parse(rtController.text.split('/')[1]);
    bool jenisKelamin = false;
    if (_jenisKelamin == JenisKelamin.L) {
      jenisKelamin = true;
    } else {
      jenisKelamin = false;
    }
    return RegisterData(
        nik: widget.user.nik,
        nama: widget.user.nama,
        tempatLahir: widget.user.tempatLahir,
        tglLahir: widget.user.tglLahir,
        alamat: widget.user.alamat,
        rt: rt,
        rw: rw,
        dusun: dusunController.text,
        email: emailController.text,
        password: pwController.text,
        jenisKelamin: jenisKelamin);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(color: primaryColor),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lanjutkan\nMembuat akun',
                    style: primaryText.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 36),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(text: 'RT/RW'),
                        const SizedBox(height: 4),
                        CustomFormField(
                          textEditingController: rtController,
                          textHint: 'Masukan RT/RW',
                        ),
                        const SizedBox(height: 20),
                        customText(text: 'Dusun'),
                        const SizedBox(height: 4),
                        CustomFormField(
                          textEditingController: dusunController,
                          textHint: 'Masukan Nama Dusun',
                        ),
                        const SizedBox(height: 20),
                        customText(text: 'Email'),
                        const SizedBox(height: 4),
                        CustomFormField(
                          textEditingController: emailController,
                          textHint: 'Masukan Email Pribadi',
                        ),
                        const SizedBox(height: 20),
                        customText(text: 'Password'),
                        const SizedBox(height: 4),
                        CustomFormField(
                          obsecureText: true,
                          textEditingController: pwController,
                          textHint: 'Masukan Password',
                        ),
                        const SizedBox(height: 4),
                        customText(
                            text:
                                'Password minimal terdiri dari 8 kata disertai\nhuruf kapital dan huruf kecil'),
                        const SizedBox(height: 20),
                        customText(text: 'Konfirmasi Password'),
                        const SizedBox(height: 4),
                        CustomFormField(
                          obsecureText: true,
                          textEditingController: pwConfirmController,
                          textHint: 'Masukkan Password',
                        ),
                        const SizedBox(height: 20),
                        customText(text: 'Jenis Kelamin'),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDEEDEB),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Radio<JenisKelamin>(
                                      value: JenisKelamin.L,
                                      groupValue: _jenisKelamin,
                                      onChanged: (JenisKelamin? value) {
                                        setState(() {
                                          _jenisKelamin = value;
                                        });
                                      },
                                    ),
                                    Text('Laki-Laki', style: greyText)
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDEEDEB),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Radio<JenisKelamin>(
                                      value: JenisKelamin.P,
                                      groupValue: _jenisKelamin,
                                      onChanged: (JenisKelamin? value) {
                                        setState(() {
                                          _jenisKelamin = value;
                                        });
                                      },
                                    ),
                                    Text('Perempuan', style: greyText)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: checkSyarat,
                                onChanged: (val) {
                                  setState(() {
                                    checkSyarat = val;
                                  });
                                },
                                activeColor: Color(0xFF019B84),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: primaryColor, fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                'Dengan membuat akun berarti Anda menyetujui '),
                                        TextSpan(
                                            text: 'syarat dan ketentuan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(text: ' serta '),
                                        TextSpan(
                                            text: 'kebijakan privasi',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700)),
                                        TextSpan(text: ' kami.'),
                                      ])),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushNamed(
                                  RegisterPage3.routeName,
                                  arguments: _sendData(),
                                );
                              }
                            },
                            child: Text(
                              'Selanjutnya',
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Padding customText({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        '$text',
        style: greyText,
      ),
    );
  }
}

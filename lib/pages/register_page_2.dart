import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/pages/register_page_1.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({Key? key}) : super(key: key);
  static const routeName = 'register_page_2'
      '';

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  TextEditingController rtController = TextEditingController();
  TextEditingController dusunController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  bool? checkSyarat = false;

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 35,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                        Row(
                          children: [
                            Checkbox(
                              value: checkSyarat,
                              onChanged: (val) {
                                setState(() {
                                  checkSyarat = val;
                                });
                              },
                              activeColor: Color(0xFF019B84),
                            ),
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 13),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Dengan membuat akun berarti Anda menyetujui\n'),
                                  TextSpan(
                                      text: 'syarat ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: 'dan '),
                                  TextSpan(
                                      text: 'ketentuan, ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: 'serta '),
                                  TextSpan(
                                      text: 'kebijakan privasi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(text: ' kami.'),
                                ])),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                            },
                            child: Text(
                              'Next',
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
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

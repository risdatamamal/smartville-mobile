import 'package:flutter/material.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';
import 'package:smartville/common/colors.dart';

class RegisterPage1 extends StatefulWidget {
  static const register_page_1 = 'register_page_1';
  const RegisterPage1({Key? key}) : super(key: key);

  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 55),
                    Text(
                      'Create your account',
                      style: primaryText.copyWith(fontSize: 22),
                    ),
                    Text(
                      'Sign up to get started!',
                      style: greyText,
                    ),
                    const SizedBox(height: 36),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NIK',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: nikController,
                            textHint: 'Masukan NIK',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Nama Lengkap',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: namaController,
                            textHint: 'Masukan Nama Lengkap',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Tempat Lahir',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: tempatLahirController,
                            textHint: 'Masukan tempat lahir',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Tanggal Lahir(dd/mm/yyyy)',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: tanggalLahirController,
                            textHint: 'Masukan Tanggal Lahir',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Alamat',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: alamatController,
                            textHint: 'Masukan alamat tempat tinggal',
                          ),
                          const SizedBox(height: 20)
                        ],
                      ),
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
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: Text(
                          'Next',
                          style: blackText.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("I'm already member"),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Go To Registration')),
                            );
                          },
                          child: TextButton(
                            child: const Text("Sign In"),
                            style: TextButton.styleFrom(textStyle: primaryText),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

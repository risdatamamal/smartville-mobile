import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:provider/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/model/forgot_password_response.dart';
import 'package:smartville/model/notification_message.dart';
import 'package:smartville/pages/login_page.dart';
import 'package:smartville/pages/notifikasi_berhasil_page.dart';
import 'package:smartville/provider/forgot_password_provider.dart';
import 'package:smartville/utils/password_string_validator.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class ChangeNewPasswordPage extends StatefulWidget {
  const ChangeNewPasswordPage({Key? key}) : super(key: key);
  static const routeName = "change_new_password";
  @override
  _ChangeNewPasswordState createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPasswordPage> {
  TextEditingController oldPwController = TextEditingController();
  TextEditingController newPwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  bool validPassword = false;
  bool _onSend = false;
  final _formKey = GlobalKey<FormState>();

  Future _changeNewPassword() async {
    ForgotPasswordProvider changePasswordProvider =
        context.read<ForgotPasswordProvider>();

    setState(() {
      _onSend = true;
    });
    if (newPwController.text != pwConfirmController.text || !validPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password tidak valid"),
        ),
      );
    } else if (oldPwController.text == newPwController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password lama tidak boleh sama dengan password baru"),
        ),
      );
    } else {
      ForgotPasswordResponse res =
          await changePasswordProvider.changeNewPassword(
        newPassword: newPwController.text,
      );

      if (res.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              res.message,
            ),
          ),
        );
      } else {
        Navigator.pop(context);
      }
    }
    setState(() {
      _onSend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/password.png'),
                    ),
                  ),
                  const Text(
                    'Atur Ulang Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          obsecureText: true,
                          textEditingController: oldPwController,
                          textHint: 'Masukan password lama',
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          obsecureText: true,
                          textEditingController: newPwController,
                          textHint: 'Masukan password baru',
                        ),
                        const SizedBox(height: 20),
                        FlutterPwValidator(
                          controller: newPwController,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          width: 400,
                          height: 60,
                          strings: PasswordStringValidator(),
                          onSuccess: () {
                            setState(() {
                              validPassword = true;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          obsecureText: true,
                          textEditingController: pwConfirmController,
                          textHint: 'Konfirmasi password baru',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _onSend
                      ? const LinearProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _changeNewPassword();
                              }
                            },
                            child: Text(
                              'Ubah Password',
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

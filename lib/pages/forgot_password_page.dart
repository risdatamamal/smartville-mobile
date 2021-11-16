import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  static const routeName = 'forgot_password';
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/lock.png'),
                  ),
                  const SizedBox(height: 27),
                  Text(
                    'Lupa\nPassword',
                    style: blackText.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 27),
                  Text(
                    'Masukan email yang Anda pakai untuk membuat akun. Kami akan mengirimkan link untuk reset password melalui email Anda.',
                    style: greyText,
                  ),
                  const SizedBox(height: 15),
                  Form(
                    key: _formKey,
                    child: CustomFormField(
                      textEditingController: _emailController,
                      textHint: 'Email',
                      prefixIcon: Icons.mail_outline,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text(
                        'Kirim link',
                        style: blackText.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Ingat password?',
                        style: blackText.copyWith(),
                      ),
                      TextButton(
                        child: Text(
                          "Masuk",
                          style: primaryText.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFF38263),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(10, 30),
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';
import './register_page_1.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                  ),
                  const SizedBox(height: 30),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Welcome!',
                              style: primaryText.copyWith(fontSize: 28),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Sign in to continue',
                              style: greyText,
                            ),
                            const SizedBox(height: 45),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFormField(
                                    textEditingController: emailController,
                                    textHint: 'Email',
                                    prefixIcon: Icons.mail_outline,
                                  ),
                                  const SizedBox(height: 30),
                                  CustomFormField(
                                    textEditingController: passwordController,
                                    textHint: 'Password',
                                    obsecureText: true,
                                    prefixIcon: Icons.lock_outline,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Forgot Password')),
                                      );
                                    },
                                    child: Text("Forgot Password?",
                                        style: primaryText),
                                  ),
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
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: blackText.copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("I'm a new user, "),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Go To Registration')),
                                    );
                                  },
                                  child: TextButton(
                                      child: const Text("Sign Up"),
                                      style: TextButton.styleFrom(
                                          textStyle: primaryText),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const RegisterPage1(),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/pages/register_page_2.dart';
import 'package:smartville/widgets/custom_form_field.dart';
import 'package:smartville/common/colors.dart';
import 'package:intl/intl.dart';

class RegisterPage1 extends StatefulWidget {
  static const routeName = 'register_page_1';
  const RegisterPage1({Key? key}) : super(key: key);

  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  DateTime _selectedDate = DateTime.now();

  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nikController.dispose();
    namaController.dispose();
    tempatLahirController.dispose();
    tanggalLahirController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    int yearNow = DateTime.parse(DateTime.now().toString()).year;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime((yearNow + 5)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        tanggalLahirController.text =
            DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
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
                    const SizedBox(height: 16),
                    Text(
                      'Buat Akun',
                      style: primaryText.copyWith(fontSize: 22),
                    ),
                    Text(
                      'Daftar untuk memulai!',
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
                            maxLength: 16,
                            isStrictLength: true,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            typeNumber: true,
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
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const RegisterPage2(),
                            ));
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

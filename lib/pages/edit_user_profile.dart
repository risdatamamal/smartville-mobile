import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/pages/register_page_2.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({Key? key}) : super(key: key);
  static const routeName = 'edituserprofile';

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController teleponController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  JenisKelamin? _jenisKelamin = JenisKelamin.L;

  final _formKey = GlobalKey<FormState>();
  final bool _onSend = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF70C7BA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 4),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 33,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Personal Data',
                    style: whiteText.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 17, top: 24),
                          padding: EdgeInsets.all(1.2),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://thispersondoesnotexist.com/image'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
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
                            'Alamat',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: alamatController,
                            textHint: 'Masukan alamat tempat tinggal',
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'No. Telepon',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: teleponController,
                            textHint: 'Masukkan nomor telepon',
                            typeNumber: true,
                            maxLength: 12,
                            isStrictLength: true,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Email',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: emailController,
                            textHint: 'Masukkan email',
                          ),

                          const SizedBox(height: 30),
                          Text(
                            'Password',
                            style: greyText,
                          ),
                          CustomFormField(
                            textEditingController: passwordController,
                            textHint: 'Password',
                            obsecureText: true,
                            prefixIcon: Icons.remove_red_eye,
                            enable: !_onSend,
                          ),

                          const SizedBox(height: 30),
                          Text(
                            'Jenis Kelamin',
                            style: greyText,
                          ),
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
                        ],
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      child: _onSend
                          ? const LinearProgressIndicator()
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //validation
                          }
                        },
                        child: Text(
                          'Simpan',
                          style: blackText.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

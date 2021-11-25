import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class RequestSupport extends StatefulWidget {
  const RequestSupport({Key? key}) : super(key: key);
  static const routeName = 'requestsupport';

  @override
  State<RequestSupport> createState() => _RequestSupportState();
}

class _RequestSupportState extends State<RequestSupport> {
  TextEditingController namaBantuanController = TextEditingController();
  TextEditingController jenisBantuanController = TextEditingController();
  TextEditingController jumlahDanaController = TextEditingController();
  TextEditingController alokasiDanaController = TextEditingController();
  TextEditingController danaTerealisasiController = TextEditingController();
  TextEditingController sisadanaController = TextEditingController();

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
                    'Permohonan Bantuan Desa',
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
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Bantuan',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: namaBantuanController,
                            textHint: 'Masukan Nama Bantuan',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Jenis Bantuan',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: jenisBantuanController,
                            textHint: 'Masukan Jenis Bantuan',
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Jumlah Dana',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: jumlahDanaController,
                            textHint: 'Masukan Jumlah Dana',
                            typeNumber: true,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Alokasi Dana',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: alokasiDanaController,
                            textHint: 'Masukkan Alokasi Dana',
                            typeMultiline: true,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Dana Terealisasi',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: danaTerealisasiController,
                            textHint: 'Masukkan Dana Yang Terealisasikan',
                            typeNumber: true,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Sisa Dana Bantuan',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: sisadanaController,
                            textHint: 'Masukkan Sisa Dana Bantuan',
                            typeNumber: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

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

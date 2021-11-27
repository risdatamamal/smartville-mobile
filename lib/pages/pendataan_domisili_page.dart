import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class PendataanDomisiliPage extends StatefulWidget {
  const PendataanDomisiliPage({Key? key}) : super(key: key);

  static const routeName = 'pendataan_domisili_page';

  @override
  _PendataanDomisiliPageState createState() => _PendataanDomisiliPageState();
}

class _PendataanDomisiliPageState extends State<PendataanDomisiliPage> {
  TextEditingController nikController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();
  TextEditingController asalDomisiliController = TextEditingController();
  TextEditingController tujuanDomisiliController = TextEditingController();

  String? tanggalFormatted;

  _selectDate(BuildContext context, TextEditingController controller) async {
    int yearNow = DateTime.parse(DateTime.now().toString()).year;
    DateTime _selectedDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime((yearNow + 5)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
        tanggalFormatted = DateFormat("yyyyMMdd").format(_selectedDate);
        print(tanggalFormatted);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70C7BA),
      appBar: AppBar(
        title: Text('Pendataan Domisili', style: whiteText),
        backgroundColor: const Color(0xFF70C7BA),
        elevation: 0.0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40.0,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NIK',
                            style: greyText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomFormField(
                            textEditingController: nikController,
                            textHint: 'Masukkan NIK',maxLength: 16, typeNumber: true,),
                          const SizedBox(height: 20),
                          Text(
                            'Nama',
                            style: greyText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomFormField(
                            textEditingController: namaController,
                            textHint: 'Masukkan Nama' ),
                          const SizedBox(height: 20),
                          Text(
                            'Tanggal Lahir',
                            style: greyText,
                          ),
                          const SizedBox(height: 4),
                          CustomFormField(
                            textEditingController: tglLahirController,
                            textHint: 'Masukan Tanggal Lahir',
                            readOnly: true,
                            onTap: () {
                              _selectDate(context, tglLahirController);
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Asal Domisili',
                            style: greyText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomFormField(
                              textEditingController: asalDomisiliController,
                              textHint: 'Masukkan Asal Domisili',typeMultiline: true,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Tujuan Domisili',
                            style: greyText,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomFormField(
                            textEditingController: tujuanDomisiliController,
                            textHint: 'Masukkan Tujuan Domisili',typeMultiline: true,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                              ),
                              onPressed: (){},
                              child: Text('Submit',  style: blackText.copyWith(fontSize: 16)),
                            ),),

                        ],
                      )
                      ,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

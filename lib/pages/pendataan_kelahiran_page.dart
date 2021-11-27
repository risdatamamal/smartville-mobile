import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class PendataanKelahiranPage extends StatefulWidget {
  const PendataanKelahiranPage({Key? key}) : super(key: key);
  static const routeName = 'pendataan_kelahiran_page';

  @override
  _PendataanKelahiranPageState createState() => _PendataanKelahiranPageState();
}

enum JenisKelamin { L, P }

class _PendataanKelahiranPageState extends State<PendataanKelahiranPage> {
  TextEditingController namaBayiController = TextEditingController();
  TextEditingController namaAyahController = TextEditingController();
  TextEditingController namaIbuController = TextEditingController();
  TextEditingController anakKeController = TextEditingController();
  TextEditingController waktuKelahiranController = TextEditingController();
  TextEditingController alamatKelahiranController = TextEditingController();
  TextEditingController tanggalKelahiranController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  JenisKelamin? _jenisKelamin = JenisKelamin.L;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF70C7BA),
        appBar: AppBar(
          title: Text('Pendataan Kelahiran', style: whiteText),
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
                              'Nama Lengkap Bayi',
                              style: greyText,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            CustomFormField(
                                textEditingController: namaBayiController,
                                textHint: 'Masukkan Nama Lengkap Bayi'),
                            const SizedBox(height: 20),
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
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Nama Ayah Kandung',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                                textEditingController: namaAyahController,
                                textHint: 'Masukkan Nama Ayah Kandung'),
                            const SizedBox(height: 20),
                            Text(
                              'Nama Ibu Kandung',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                                textEditingController: namaIbuController,
                                textHint: 'Masukkan Nama Ibu Kandung'),
                            const SizedBox(height: 20),
                            Text(
                              'Anak Ke-',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                                typeNumber: true,
                                textEditingController: anakKeController,
                                textHint: 'Anak Ke-'),
                            const SizedBox(height: 20),
                            Text(
                              'Tanggal Laporan',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                              textEditingController: tanggalKelahiranController,
                              textHint: 'Masukan Tanggal Kelahiran',
                              readOnly: true,
                              onTap: () {
                                _selectDate(context, tanggalKelahiranController);
                              },
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Alamat Kelahiran',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                              textEditingController: alamatKelahiranController,
                              textHint: 'Masukkan Alamat Kelahiran',
                              typeMultiline: true,
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
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_form_field.dart';

class PelaporanWargaPage extends StatefulWidget {
  const PelaporanWargaPage({Key? key}) : super(key: key);
  static const routeName = 'pelaporan_warga_page';

  @override
  _PelaporanWargaPageState createState() => _PelaporanWargaPageState();
}

class _PelaporanWargaPageState extends State<PelaporanWargaPage> {
  TextEditingController namaPelaporController = TextEditingController();
  TextEditingController keteranganKejadianController = TextEditingController();
  TextEditingController noHpController = TextEditingController();
  TextEditingController jenisLaporanController = TextEditingController();
  TextEditingController tanggalLaporanPermohonanController =
      TextEditingController();
  TextEditingController alamatPermohonanController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final bool _onSend = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF70C7BA),
      appBar: AppBar(
        title: Text('Permohonan Surat Pengantar', style: whiteText),
        backgroundColor: const Color(0xFF70C7BA),
        elevation: 0.0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                ),
                height: double.infinity,
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Pelapor',
                              style: greyText,
                            ),
                            const SizedBox(height: 4),
                            CustomFormField(
                              textEditingController: namaPelaporController,
                              textHint: 'Masukan Nama Pelapor',
                              maxLength: 16,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Keterangan Kejadian',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController:
                                  keteranganKejadianController,
                              textHint: 'Masukan keterangan kejadian',
                              typeMultiline: true,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Jenis Laporan',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController: jenisLaporanController,
                              textHint: 'Masukan jenis laporan',
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Tanggal Laporan',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController:
                                  tanggalLaporanPermohonanController,
                              textHint: 'Masukan tanggal laporan',
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'No. Hp',
                              style: greyText,
                            ),
                            CustomFormField(
                              typeNumber: true,
                              textEditingController:
                                  tanggalLaporanPermohonanController,
                              textHint: 'Masukan No Hp',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Alamat laporan',
                              style: greyText,
                            ),
                            CustomFormField(
                              textEditingController:
                                  keteranganKejadianController,
                              textHint: 'Masukan alamat',
                              typeMultiline: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Dokumentasi Kejadian',
                              style: greyText,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFCFD7D5),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Choose File',
                                style: blackText.copyWith(
                                    fontSize: 16,
                                    color: const Color(0xFF888A8A)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
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
                                        'Submit',
                                        style: blackText.copyWith(fontSize: 16),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';

class NotifikasiBerhasilPage extends StatefulWidget {
  const NotifikasiBerhasilPage({Key? key}) : super(key: key);

  @override
  _NotifikasiBerhasilPageState createState() => _NotifikasiBerhasilPageState();
}

class _NotifikasiBerhasilPageState extends State<NotifikasiBerhasilPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xFFB6DFD9),
            ),
            FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: 0.5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF79AFA7),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(58),
                    bottomRight: Radius.circular(58),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    color: const Color(0xFFE3F4F2),
                    borderRadius: BorderRadius.circular(26.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset('assets/celebration.png'),
                    const SizedBox(height: 8),
                    Text(
                      'Email Verifikasi Terkirim!',
                      style: greyText.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'Email verifikasi telah dikirim. Silahkan cek email Anda untuk melanjutkan pendaftaran. ',
                        textAlign: TextAlign.center,
                        style: greyText),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Aksi',
                          style: blackText.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

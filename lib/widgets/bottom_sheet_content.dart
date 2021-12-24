import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget makeDismissible({required Widget child}) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
            onTap: () => {},
            child: child,
          ),
        );
    return makeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.5,
        maxChildSize: 0.5,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: Color(0xFF017262),
          ),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Geser ke bawah untuk menutup',
                  style: primaryText.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/desa.png',
                    width: double.infinity,
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Desa Pemaron',
                  style: whiteText.copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sebuah desa yang terletak di kecamatan Brebes kabupaten Brebes ini adalah sebuah desa yang memiliki cakupan daerah paling luas' +
                    'diantara dusun lainnya di keluran Pemaron ini. Desa tersebut menurut sesepuh setempat sudah ada sejak jaman kolonial Belanda. ' +
                    'Dibuktikan dengan ditemukannya rel kereta api tua di samping sawah desa setempat. Ditinggali oleh sekitar 200 warga yang terdiri' +
                    'dari kurang lebih 40 kepala keluarga, yang mana beberapa warga ada yang bukan orang asli desa tersebut. Lokasi dari desa Pemaron' +
                    'Waru sendiri memang cukup strategis mengingat lokasinya yang dilalui oleh jalan alternatif penghubung antara kota Brebes - Jatibarang.',
                style: whiteText.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
              Text(
                  '\nSumber : https://sidesa.jatengprov.go.idhttps://triaalyasjayablog.wordpress.com',
                  style: whiteText.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 10),
                  textAlign: TextAlign.justify),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

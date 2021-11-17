import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        color: primaryColor,
      ),
      child: Column(
        children: [
          Text(
            'Informasi desa',
            style: primaryText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                'https://thispersondoesnotexist.com/image',
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
              'Desa Pemaron Waru',
              style: whiteText.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Sebuah desa yang terletak di kecamatan Brebes kabupaten Brebes ini' +
                'adalah sebuah desa yang memiliki cakupan daerah paling luas diantara dusun ' +
                'lainnya di keluran Pemaron ini. Desa tersebut menurut sesepuh setempat sudah ada sejak jaman kolonial Belanda. ',
            style: whiteText.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

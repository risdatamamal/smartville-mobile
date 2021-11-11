import 'package:flutter/material.dart';
import 'package:smartville/common/text_styles.dart';

class MenuUtama extends StatelessWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Menu 1
        TextButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF70C7BA),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  width: 4,
                  height: 35,
                  color: const Color(0xFFC4C4C4),
                ),
                TextButton(
                  child: Text(
                    'Permohonan Surat Pengantar',
                    style: primaryText.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
        ),
        //Menu 2
        const SizedBox(height: 10),
        TextButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF70C7BA),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  width: 4,
                  height: 35,
                  color: const Color(0xFFC4C4C4),
                ),
                TextButton(
                  child: Text(
                    'Pendataan Warga Desa',
                    style: primaryText.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
        ),
        //Menu 3
        const SizedBox(height: 10),
        TextButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF70C7BA),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  width: 4,
                  height: 35,
                  color: const Color(0xFFC4C4C4),
                ),
                TextButton(
                  child: Text(
                    'Permohonan Bantuan Desa',
                    style: primaryText.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
        ),
        //Menu 4
        const SizedBox(height: 10),
        TextButton(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF70C7BA),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  width: 4,
                  height: 35,
                  color: const Color(0xFFC4C4C4),
                ),
                TextButton(
                  child: Text(
                    'Pelaporan ',
                    style: primaryText.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
        ),
      ],
    );
  }
}

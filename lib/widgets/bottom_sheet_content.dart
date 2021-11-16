import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';

class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: primaryColor,
        ),
        child: Column(
          children: [
            Text(
              'Geser ke atas untuk lihat profile desa',
              style: primaryText.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

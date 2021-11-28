import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';

class HistoryWidget extends StatelessWidget {
  String title;
  DateTime date;
  HistoryWidget({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFC5E3DF),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${date.day}-${date.month}-${date.year}",
                  style: blackText.copyWith(color: redColor),
                ),
                Text(
                  "${date.hour}:${date.minute}",
                  style: blackText.copyWith(color: redColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

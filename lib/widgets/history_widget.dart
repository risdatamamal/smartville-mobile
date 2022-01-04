import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/constant.dart';
import '../common/text_styles.dart';
import '../utils/date_convert.dart';

class HistoryWidget extends StatelessWidget {
  final String title;
  final DateTime date;
  final String status;
  const HistoryWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFC5E3DF),
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(height: 5),
                  Text(
                    dateForHistory(date.toLocal()),
                    style: blackText.copyWith(color: redColor),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            height: 25,
            decoration: BoxDecoration(
              color: status == "terkirim"
                  ? Colors.blue
                  : status == "diterima"
                      ? primaryColor
                      : redColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "${status[0].toUpperCase()}${status.substring(1)}",
                style: whiteText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

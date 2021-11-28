import 'package:flutter/material.dart';
import 'package:smartville/widgets/custom_scaffold.dart';
import 'package:smartville/widgets/history_widget.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = 'history-page';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppbar: "Riwayat",
      children: [
        HistoryWidget(
          title: "Permohonan surat pengantar",
          date: DateTime.parse("2012-02-27 13:27:00"),
        ),
      ],
    );
  }
}

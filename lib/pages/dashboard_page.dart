import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/list_pengumuman.dart';
import 'package:smartville/widgets/menu_utama.dart';
import 'package:smartville/widgets/bottom_sheet_content.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'dashboard_page';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> list = ['a', 'b'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo,',
                            style: greyText,
                            textAlign: TextAlign.start,
                          ),
                          TextButton(
                            child: Text(
                              'Nama',
                              style: primaryText.copyWith(fontSize: 18),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Color(0xFF153E69),
                            child: CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2018/01/15/07/52/woman-3083390_1280.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Ada apa hari ini?
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Ada apa hari ini?',
                    style: blackText,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListPengumuman(pengumumanList: list),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Ada keperluan apa hari ini?',
                    style: blackText,
                  ),
                  const SizedBox(height: 8),
                  const MenuUtama(),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.09,
              minChildSize: 0.07,
              maxChildSize: 0.7,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: BottomSheetContent(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

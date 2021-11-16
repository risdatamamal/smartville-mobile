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
                      Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://thispersondoesnotexist.com/image')),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100.0)),
                          border: Border.all(color: Colors.blueAccent),
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
              minChildSize: 0.09,
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

class CustomScrollViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: primaryColor,
        ),
        child: CustomInnerContent(),
      ),
    );
  }
}

class CustomInnerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 12),
        CustomDraggingHandle(),
        SizedBox(height: 16),
        CustomFeaturedItem()
      ],
    );
  }
}

class CustomDraggingHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
    );
  }
}

class CustomFeaturedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

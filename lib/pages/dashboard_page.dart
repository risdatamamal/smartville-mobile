import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/model/news_response.dart';
import 'package:smartville/pages/profile_page.dart';
import 'package:smartville/provider/news_provider.dart';
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
  List<Datum> newsList = [];
  bool isLoading = false;
  Future<void> _initNewsList() async {
    setState(() => isLoading = true);
    NewsProvider provider = context.read<NewsProvider>();
    List<Datum> _newsList = await provider.listNews();
    if (_newsList.isNotEmpty) {
      newsList.addAll(_newsList);
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    _initNewsList();
    super.initState();
  }

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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProfilePage.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 17, top: 24),
                          padding: const EdgeInsets.all(1.2),
                          child: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://thispersondoesnotexist.com/image'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          height: 64,
                          width: 64,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
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
                  isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          height: 120,
                          child: ListPengumuman(pengumumanList: newsList),
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

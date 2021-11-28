import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/model/news_response.dart';
import 'package:smartville/pages/profile_page.dart';
import 'package:smartville/provider/news_provider.dart';
import 'package:smartville/provider/user_provider.dart';
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
  String _imageProfile = "";
  String _userName = "";

  Future<void> _initNewsList() async {
    setState(() => isLoading = true);
    NewsProvider provider = context.read<NewsProvider>();
    List<Datum> _newsList = await provider.listNews();
    if (_newsList.isNotEmpty) {
      newsList.addAll(_newsList);
    }
    setState(() => isLoading = false);
  }

  Future<void> _userData() async {
    UserProvider provider = context.read<UserProvider>();
    String imageProfile = provider.imageProfile ?? "";
    String userName = provider.userName ?? "";
    setState(() {
      _imageProfile = imageProfile;
      _userName = userName;
    });
  }

  @override
  void initState() {
    _userData();
    _initNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            _userName,
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
                            image: DecorationImage(
                              image: NetworkImage(_imageProfile),
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
                const SingleChildScrollView(
                  child: MenuUtama(),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Klik untuk lihat profile desa.',
                        style: whiteText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color: Color(0xFF017262),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => BottomSheetContent(),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )));
                  }),
            ),
          )
        ],
      ),
    );
  }
}

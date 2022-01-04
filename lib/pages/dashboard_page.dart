import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/src/provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../common/constant.dart';
import '../common/colors.dart';
import '../common/text_styles.dart';
import '../provider/news_provider.dart';
import '../provider/user_provider.dart';
import '../widgets/list_pengumuman.dart';
import '../widgets/menu_utama.dart';
import '../widgets/bottom_sheet_content.dart';
import '../utils/firebase_messaging.dart';
import '../model/news_response.dart';

import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = 'dashboard';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = <TargetFocus>[];

  GlobalKey profileKey = GlobalKey();
  GlobalKey newsKey = GlobalKey();
  GlobalKey menuKey = GlobalKey();
  GlobalKey infoDesaKey = GlobalKey();
  GlobalKey helpKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();
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
      if (provider.getTutorial()) {
        provider.disabledTutorial();
        Future.delayed(const Duration(seconds: 1), () {
          showTutorial();
        });
      }
    });
  }

  Future<void> _launchEmailSubmission() async {
    final Email email = Email(
      body: '',
      subject: 'Butuh bantuan',
      recipients: ['smartville.dev@gmail.com'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  void showTutorial() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: targets,
      colorShadow: Colors.red,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {},
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {},
    )..show();
  }

  void initTargets() {
    targets.clear();

    targets.add(
      TargetFocus(
        identify: "Profil",
        keyTarget: profileKey,
        color: const Color(0xFF017262),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Tekan foto profil ini untuk menuju halaman profil.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.next();
                    },
                    child: const Icon(Icons.chevron_right),
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.Circle,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Berita",
        keyTarget: newsKey,
        color: const Color(0xFF017262),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Bagian ini akan menampilkan pengumuman terbaru langsung dari balai desa.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.previous();
                        },
                        child: const Icon(Icons.chevron_left),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          controller.next();
                        },
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Menu",
        keyTarget: menuKey,
        color: const Color(0xFF017262),
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(left: 0, bottom: -10),
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Berbagai menu pendataan dan pelaporan tersedia pada bagian ini.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            _scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          controller.previous();
                        },
                        child: const Icon(Icons.chevron_left),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Info Desa",
        keyTarget: infoDesaKey,
        color: const Color(0xFF017262),
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(left: 0, bottom: 50),
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.previous();
                        },
                        child: const Icon(Icons.chevron_left),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          controller.next();
                        },
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Klik tombol di bawah ini untuk melihat profil desa.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(
      TargetFocus(
        identify: "Bantuan",
        keyTarget: helpKey,
        color: const Color(0xFF017262),
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(left: 0, bottom: 150),
            builder: (context, controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.previous();
                        },
                        child: const Icon(Icons.chevron_left),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Ada pertanyaan? hubungi kami disini.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              );
            },
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );
  }

  @override
  void initState() {
    _userData();
    _initNewsList();
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(notification.title ?? "Notifikasi baru"),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.body ?? "Anda memiliki notifikasi baru")
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  //Profile
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo,',
                                style: greyText.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                _userName.split(" ")[0],
                                style: primaryText.copyWith(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        InkResponse(
                          key: profileKey,
                          focusColor: primaryColor,
                          hoverColor: primaryColor,
                          highlightColor: primaryColor,
                          onTap: () {
                            Navigator.pushNamed(context, ProfilePage.routeName)
                                .then(
                              (value) => _userData(),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: secondaryColor,
                                width: 1.5,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: _imageProfile,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              height: 64,
                              width: 64,
                              placeholder: (context, url) => const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Ada apa hari ini?
                  const SizedBox(
                    height: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: newsKey,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultMargin,
                        ),
                        child: Text(
                          'Ada apa hari ini?',
                          style: blackText,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? AspectRatio(
                            aspectRatio: 2.0,
                            child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircularProgressIndicator(
                                        color: primaryColor),
                                    SizedBox(width: 18),
                                    Text("Loading data...")
                                  ],
                                ),
                              ),
                          )
                          : newsList.isNotEmpty
                              ? ListPengumuman(pengumumanList: newsList)
                              : Text(
                                  "Tidak ada pengumuman terbaru",
                                  style: blackText,
                                ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    key: menuKey,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        child: Text(
                          'Ada keperluan apa hari ini?',
                          style: blackText,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: MenuUtama(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Align(
                      key: helpKey,
                      child: TextButton(
                        child: Text(
                          'Butuh bantuan? Klik disini',
                          style: primaryText.copyWith(
                              decoration: TextDecoration.underline),
                        ),
                        onPressed: () => {_launchEmailSubmission()},
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Container(
                    key: infoDesaKey,
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Klik untuk lihat profile desa.',
                        style: whiteText.copyWith(fontSize: 14),
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
                      builder: (context) => const BottomSheetContent(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

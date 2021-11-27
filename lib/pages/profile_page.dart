import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/pages/edit_user_profile.dart';
import 'package:smartville/provider/user_provider.dart';
import 'package:smartville/widgets/custom_dialog.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = 'profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String _imageProfile = "";
  String _userName = "";
  String _userEmail = "";
  String _userTelp = "";
  String _userNik = "";


  Future<void> _userData() async {

    UserProvider provider = context.read<UserProvider>();
    String imageProfile = provider.imageProfile ?? "";
    String userName = provider.userName ?? "";
    String userEmail = provider.userEmail ?? "";
    String userTelp = provider.userTelp ?? "";
    String userNik = provider.userNik ?? "";


    setState(() {

      _imageProfile = imageProfile;
      _userName = userName;
      _userEmail = userEmail;
      _userTelp = userTelp;
      _userNik = userNik;
    });
  }

  @override
  void initState() {
    _userData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF70C7BA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 4),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 33,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Profil Saya',
                    style: whiteText.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 17, top: 24),
                          padding: EdgeInsets.all(1.2),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    _imageProfile),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$_userName\n',
                                  style: primaryText.copyWith(fontSize: 20)),
                              TextSpan(
                                  text: _userEmail,
                                  style: greyText.copyWith(fontSize: 15)),
                            ]),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 10),
                        child: Text(
                          'Informasi',
                          style: greyText.copyWith(fontSize: 15),
                        )),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: 'NIK\n',
                                    style: orangeText.copyWith(fontSize: 15)),
                                TextSpan(
                                    text: _userNik,
                                    style: blackText),
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            color: Colors.greenAccent,
                            width: 2,
                            height: 50,
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: 'No.Telp\n',
                                    style: orangeText.copyWith(fontSize: 15)),
                                TextSpan(text: _userTelp, style: blackText),
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: (){Navigator.pushNamed(context, EditUserProfile.routeName);},
                      child: CustomButton(
                          imageUrl: 'assets/icons/personalIcon.png',
                          text: 'Personal Data',
                          style: primaryText.copyWith(fontSize: 15)),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    InkWell(
                        onTap: () {},
                        child: CustomButton(
                            imageUrl: 'assets/icons/notifIcon.png',
                            text: 'Notifikasi',
                            style: primaryText.copyWith(fontSize: 15))),
                    const SizedBox(
                      height: 38,
                    ),
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              text:
                                  "Apakah Anda yakin ingin keluar dari akun ini?",
                              onClick: () {
                                UserProvider provider = context.read<UserProvider>();
                                provider.logout();
                                Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (route) => false);
                              },
                            ),
                          );
                        },
                        child: CustomButton(
                            imageUrl: 'assets/icons/logoutIcon.png',
                            text: 'Logout',
                            style: primaryText.copyWith(fontSize: 15))),
                  ],
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card CustomButton(
      {required String imageUrl,
      required String text,
      required TextStyle style}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.greenAccent, width: 1)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
            ),
            Expanded(
              child: Container(
                child: Image.asset(
                  imageUrl,
                  scale: 5,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  text,
                  style: style,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            )
          ],
        ),
        height: 50,
      ),
    );
  }
}

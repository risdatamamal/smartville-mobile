import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../common/colors.dart';
import '../common/text_styles.dart';
import '../provider/user_provider.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_scaffold.dart';

import 'history_page.dart';
import 'profile_edit_page.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = 'coba_page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
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
    return SafeArea(
      child: CustomScaffold(
        textAppbar: 'Profil Saya',
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 17),
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _imageProfile == ""
                          ? const AssetImage('assets/default_profile.png')
                              as ImageProvider
                          : NetworkImage(_imageProfile),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userName.split(' ').first,
                      style: primaryText.copyWith(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      _userEmail,
                      style: greyText.copyWith(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Text(
              'Informasi',
              style: greyText.copyWith(fontSize: 15),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 2),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: 'NIK\n',
                      style: orangeText.copyWith(fontSize: 15),
                    ),
                    TextSpan(text: _userNik, style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
                const VerticalDivider(
                  color: Colors.greenAccent,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                  width: 20,
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'No.Telp\n',
                        style: orangeText.copyWith(fontSize: 15)),
                    TextSpan(
                        text: _userTelp.isNotEmpty ? _userTelp : '-',
                        style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 2),
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditUserProfile.routeName).then(
                (value) => _userData(),
              );
            },
            child: customButton(
              scale: 6,
              imageUrl: 'assets/icons/personalIcon.png',
              text: 'Personal Data',
              style: primaryText.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(HistoryPage.routeName);
            },
            child: customButton(
              scale: 4,
              imageUrl: 'assets/icons/riwayat.png',
              text: 'Riwayat',
              style: primaryText.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  text: "Apakah Anda yakin ingin keluar dari akun ini?",
                  onClick: () {
                    UserProvider provider = context.read<UserProvider>();
                    provider.logout();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginPage.routeName,
                      (route) => false,
                    );
                  },
                ),
              );
            },
            child: customButton(
              scale: 6,
              imageUrl: 'assets/icons/logoutIcon.png',
              text: 'Logout',
              style: primaryText.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

Card customButton({
  required String imageUrl,
  required String text,
  required TextStyle style,
  required double scale,
}) {
  return Card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: Colors.greenAccent, width: 1),
    ),
    child: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                imageUrl,
                scale: scale,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: style,
              ),
            ),
          ),
        ],
      ),
      height: 50,
    ),
  );
}

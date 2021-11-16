import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/widgets/custom_dialog.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = 'profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF70C7BA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10,left: 4),
              child: Row(
                children: [
                 InkWell(
                   onTap: (){Navigator.of(context).pop();},
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
                          padding: EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: NetworkImage('https://thispersondoesnotexist.com/image'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all( Radius.circular(50.0)),
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
                            color: primaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(text: 'Zac Efron\n', style: primaryText.copyWith(fontSize: 20)),
                              TextSpan(
                                  text: 'zacefron@gmail.com',
                                  style: greyText.copyWith(fontSize: 15)),
                            ]),
                          ),
                        )
                      ],
                    ),
                   const SizedBox(
                      height: 30,
                    ),
                    Padding(padding:EdgeInsets.only(left: 8,bottom: 10),child: Text('Informasi',style: greyText.copyWith(fontSize: 15),)),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: 'NIK\n',style: orangeText.copyWith(fontSize: 15)),
                                  TextSpan(text: '32764162564718471',style: blackText),
                                ]
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                          Container(color: Colors.greenAccent,width: 2,height: 50,),
                          Expanded(
                            child: Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: 'No.Telp\n',style: orangeText.copyWith(fontSize: 15)),
                                  TextSpan(text: '08263517265',style: blackText),
                                ]
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  const  SizedBox(
                      height: 70,
                    ),

                    CustomButton(imageUrl: 'assets/icons/personalIcon.png',text: 'Personal Data',style: primaryText.copyWith(fontSize: 15)),
                   const SizedBox(
                      height: 38,
                    ),
                    CustomButton(imageUrl: 'assets/icons/notifIcon.png',text: 'Notifikasi',style: primaryText.copyWith(fontSize: 15)),
                 const   SizedBox(
                      height: 38,
                    ),
                    InkWell(onTap: (){ showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        text:
                        "Apakah Anda yakin ingin keluar dari akun ini?",
                        onClick: () {
                         
                        },
                      ),
                    );},child: CustomButton(imageUrl: 'assets/icons/logoutIcon.png',text: 'Logout',style: primaryText.copyWith(fontSize: 15))),
                  ],
                ),
                decoration: BoxDecoration(
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

  Card CustomButton({required String imageUrl, required String text,required TextStyle style}) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.greenAccent, width: 1)),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(width: 50,),
            Expanded(
              child: Container(
                child: Image.asset(imageUrl,scale: 5,),

              ),
            ),
            Expanded(
              child: Container(
                child: Text(text,style: style,),
              ),
            ),
           const SizedBox(width: 50,)
          ],
        ),
        height: 50,
      ),
    );
  }
}
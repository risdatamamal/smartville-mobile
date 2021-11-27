import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/pages/pendataan_domisili_page.dart';
import 'package:smartville/pages/pendataan_kelahiran_page.dart';
import 'package:smartville/pages/pendataan_kematian_page.dart';

class CitizenDataMenu extends StatefulWidget {
  const CitizenDataMenu({Key? key}) : super(key: key);
  static const routeName = 'citizen_data_menu'
      '';

  @override
  State<CitizenDataMenu> createState() => _CitizenDataMenuState();
}

class _CitizenDataMenuState extends State<CitizenDataMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const BackButton(color: primaryColor),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Pendataan Warga Desa',
                style: primaryText.copyWith(fontSize: 22),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(121, 175, 167, 1),
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              child:  InkWell(
                onTap: (){Navigator.pushNamed(context, PendataanKelahiranPage.routeName);},
                splashColor: Colors.greenAccent,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Pendataan Kelahiran",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(20),
            ),

            Material(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(121, 175, 167, 1),
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              child:  InkWell(
                onTap: (){Navigator.pushNamed(context, PendataanKematianPage.routeName);},
                splashColor: Colors.greenAccent,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Pendataan Kematian",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(121, 175, 167, 1),
              shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
              child:  InkWell(
                onTap: (){Navigator.pushNamed(context, PendataanDomisiliPage.routeName);},
                splashColor: Colors.greenAccent,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Pendataan Domisili",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

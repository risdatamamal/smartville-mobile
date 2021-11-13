import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Pendataan Warga Desa',
                    style: primaryText.copyWith(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
                Form(
                  child: Material(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                    child: const InkWell(
                      splashColor: Colors.greenAccent,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Pendataan Kelahiran",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

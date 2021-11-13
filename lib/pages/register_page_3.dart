import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartville/common/constant.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/widgets/custom_dialog.dart';
import 'package:smartville/widgets/profile_widget.dart';

class RegisterPage3 extends StatefulWidget {
  static const routeName = 'register_page_3';

  final String name;
  const RegisterPage3({Key? key, required this.name}) : super(key: key);

  @override
  _RegisterPage3State createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Satu langkah tersisa,\n${widget.name}',
                    style: primaryText.copyWith(fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 75,
                ),
                image != null
                    ? ProfileWidget(
                        typeImage: TypeImage.FILE,
                        icon: Icons.delete_outline_rounded,
                        imageFile: image,
                        onClickedImage: () => pickImage(ImageSource.gallery),
                        onClickedIcon: () => setState(() => image = null),
                      )
                    : ProfileWidget(
                        typeImage: TypeImage.ASSET,
                        imageSrc: 'assets/default_profile.png',
                        icon: Icons.edit,
                        onClickedImage: () => pickImage(ImageSource.gallery),
                        onClickedIcon: () => pickImage(ImageSource.gallery),
                      ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          text:
                              "Apakah Anda yakin data yang dimasukan sudah benar ?",
                          onClick: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Yakin",
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Daftar',
                      style: blackText.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
import 'package:smartville/common/colors.dart';
import 'package:smartville/common/text_styles.dart';
import 'package:smartville/provider/user_provider.dart';
import 'package:smartville/widgets/custom_dialog.dart';
import 'package:smartville/widgets/custom_form_field.dart';
import 'package:smartville/widgets/custom_scaffold.dart';
import 'package:smartville/widgets/profile_widget.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({Key? key}) : super(key: key);
  static const routeName = 'edituserprofile';

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

enum JenisKelamin { L, P }

class _EditUserProfileState extends State<EditUserProfile> {
  late TextEditingController nikController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late JenisKelamin jenisKelamin;
  late String imageProfile;
  late final String tempImage;
  File? image;

  final _formKey = GlobalKey<FormState>();
  final bool _onSend = false;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        imageProfile = "";
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  @override
  void initState() {
    super.initState();
    UserProvider provider = context.read<UserProvider>();
    nikController = TextEditingController(text: provider.userNik);
    nameController = TextEditingController(text: provider.userName);
    addressController = TextEditingController(text: provider.userName);
    phoneController = TextEditingController(text: provider.userTelp);
    jenisKelamin = JenisKelamin.P;
    imageProfile = provider.imageProfile ?? "";
    tempImage = imageProfile;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      textAppbar: "Edit Profil",
      children: [
        Center(
          child: imageProfile != ""
              ? ProfileWidget(
                  typeImage: TypeImage.NETWORK,
                  icon: Icons.edit,
                  imageSrc: imageProfile,
                  onClickedImage: () => pickImage(ImageSource.gallery),
                  onClickedIcon: () => pickImage(
                    ImageSource.gallery,
                  ),
                )
              : image != null
                  ? ProfileWidget(
                      typeImage: TypeImage.FILE,
                      icon: Icons.delete_outline_rounded,
                      imageFile: image,
                      onClickedImage: () => pickImage(ImageSource.gallery),
                      onClickedIcon: () => setState(() {
                        image = null;
                        imageProfile = tempImage;
                      }),
                    )
                  : ProfileWidget(
                      typeImage: TypeImage.ASSET,
                      imageSrc: 'assets/default_profile.png',
                      icon: Icons.edit,
                      onClickedImage: () => pickImage(ImageSource.gallery),
                      onClickedIcon: () => pickImage(
                        ImageSource.gallery,
                      ),
                    ),
        ),
        Text(
          'NIK',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        CustomFormField(
          textEditingController: nikController,
          textHint: 'NIK',
          enable: false,
        ),
        const SizedBox(height: 20),
        Text(
          'Nama Lengkap',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        CustomFormField(
          textEditingController: nameController,
          textHint: 'Masukkan nama lengkap',
        ),
        const SizedBox(height: 20),
        Text(
          'Alamat',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        CustomFormField(
          textEditingController: addressController,
          typeMultiline: true,
          textHint: 'Masukkan alamat tempat tinggal',
        ),
        const SizedBox(height: 20),
        Text(
          'No. Telepon',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        CustomFormField(
          textEditingController: phoneController,
          textHint: 'Masukkan No. Telepon',
        ),
        const SizedBox(height: 20),
        Text(
          'Email',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 6),
        CustomFormField(
          textEditingController: phoneController,
          textHint: 'Masukkan Email',
        ),
        const SizedBox(height: 20),
        Text(
          'Jenis kelamin',
          style: greyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFDEEDEB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Radio<JenisKelamin>(
                      value: JenisKelamin.L,
                      groupValue: jenisKelamin,
                      onChanged: (JenisKelamin? value) {
                        setState(() {
                          jenisKelamin = value!;
                        });
                      },
                    ),
                    Text('Laki-Laki', style: greyText)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFDEEDEB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Radio<JenisKelamin>(
                      value: JenisKelamin.P,
                      groupValue: jenisKelamin,
                      onChanged: (JenisKelamin? value) {
                        setState(() {
                          jenisKelamin = value!;
                        });
                      },
                    ),
                    Text('Perempuan', style: greyText)
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: _onSend
              ? const LinearProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                        text: "Apakah Anda yakin ingin mengubah data ?",
                        onClick: () {
                          // TODO
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Simpan',
                    style: blackText.copyWith(fontSize: 16),
                  ),
                ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

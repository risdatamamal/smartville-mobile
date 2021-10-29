import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartville/common/colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textHint;
  final bool typeNumber;
  final bool obsecureText;
  final IconData? prefixIcon;

  const CustomFormField({
    Key? key,
    this.prefixIcon,
    required this.textEditingController,
    required this.textHint,
    this.typeNumber = false,
    this.obsecureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: typeNumber ? TextInputType.number : TextInputType.text,
      inputFormatters:
          typeNumber == true ? [FilteringTextInputFormatter.digitsOnly] : [],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        fillColor: const Color(0xFFDEEDEB),
        filled: true,
        hintText: textHint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      ),
    );
  }
}

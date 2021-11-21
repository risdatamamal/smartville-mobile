import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartville/common/colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String textHint;
  final bool typeNumber;
  final bool obsecureText;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool isStrictLength;
  final bool enable;
  final bool typeMultiline;

  const CustomFormField({
    Key? key,
    this.prefixIcon,
    required this.textEditingController,
    required this.textHint,
    this.typeNumber = false,
    this.obsecureText = false,
    this.readOnly = false,
    this.onTap,
    this.maxLength,
    this.maxLengthEnforcement,
    this.isStrictLength = false,
    this.enable = true,
    this.typeMultiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: typeNumber
          ? TextInputType.number
          : typeMultiline
              ? TextInputType.multiline
              : TextInputType.text,
      inputFormatters:
          typeNumber == true ? [FilteringTextInputFormatter.digitsOnly] : [],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harap isi bagian ini';
        }
        if (isStrictLength) {
          if (value.length < maxLength!) {
            return 'Panjang karakter harus $maxLength digit';
          }
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
      onTap: onTap,
      enabled: enable,
      readOnly: readOnly,
      controller: textEditingController,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      minLines: typeMultiline ? 3 : 1,
      maxLines: typeMultiline ? 4 : 1,
    );
  }
}

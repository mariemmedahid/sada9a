import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constante.dart';
import 'custom_text.dart';



class CustomTextFormField extends StatelessWidget {
  final String? text;

  final String? hint;

  final String? prefix;
  bool? obscureText;
  int? maxLine;
  final Widget? suffix;

  final Function? onSave;
  final Function? validator;
  final TextInputType? keyboardtype;
  final TextEditingController? controller;

  CustomTextFormField(
      {this.text,
      this.hint,
      this.onSave,
      this.validator,
      this.keyboardtype,
      this.controller,
      this.obscureText,
      this.maxLine = 1,
      this.suffix,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: CustomText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          onSaved: onSave as void Function(String?)?,
          validator: validator as String? Function(String?)?,
          keyboardType: keyboardtype,
          obscureText: obscureText ?? false,
          maxLines: maxLine,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.all(0),

            prefixIcon: prefix != null
                ? Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: SvgPicture.asset(
                      prefix!,
                      color: Colors.grey,
                      height: 18,
                    ),
                  )
                : null,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
            suffixIcon: suffix,
            filled: true,
            fillColor: Colors.grey.shade50,
            hoverColor: primaryColor.withOpacity(0.1),
            focusColor: primaryColor,
            prefixIconColor: primaryColor,
            // filled: true,
          ),
        )
      ],
    );
  }
}

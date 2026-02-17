import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool isObsecure;
  final bool isParagraph;
  final Color? prefixIconColor;

  const CustomFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.isObsecure = false,
    this.isParagraph = false,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool isPasswordHide;

  @override
  void initState() {
    super.initState();
    isPasswordHide = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: AppStyles.mediumTextSize15White.copyWith(color: const Color(0xff5C5C5C)),
      cursorColor: const Color(0xff5C5C5C),
      cursorErrorColor: Colors.red,
      obscureText: isPasswordHide,
      maxLines: widget.isParagraph ? null : 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: widget.prefixIconColor,
        suffixIcon: widget.isObsecure
            ? InkWell(
                radius: 8,
                borderRadius: BorderRadius.circular(5),
                highlightColor: Colors.transparent,
                splashColor: const Color(0xffc8c8c8).withOpacity(0.9),
                onTap: widget.isObsecure
                    ? () {
                        setState(() {
                          isPasswordHide = !isPasswordHide;
                        });
                      }
                    : null,
                child: const SizedBox(
                  height: 10,
                  width: 10,
                  child: Icon(Icons.remove_red_eye_outlined),
                ),
              )
            : null,
        suffixIconColor: const Color(0xff5C5C5C),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: const Color(0xff7c7c7c).withOpacity(0.5),
          ), // Default border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0xff00656c),
          ), // Border color when focused
        ),
      ),
    );
  }
}

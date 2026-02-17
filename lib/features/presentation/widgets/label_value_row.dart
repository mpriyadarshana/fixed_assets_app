import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


import '../../../utils/app_styles.dart';

class LabelValueRow extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final double fontSize;

  const LabelValueRow({
    Key? key,
    required this.title,
    required this.value,
    this.color = const Color(0xff5c5c5c),
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.boldTextSize14White.copyWith(
            color: color,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppStyles.mediumTextSize14Black.copyWith(
              color: color,
              fontSize: fontSize,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

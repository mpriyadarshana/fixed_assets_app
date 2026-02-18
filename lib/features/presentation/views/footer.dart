
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
        child: Text(
          'ARTHUR C CLARKE INSTITUTE FOR MODERN\nTECHNOLOGIES (ACCIMT)',
          style: AppStyles.mediumTextSize10.copyWith(
            color: Colors.black45,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
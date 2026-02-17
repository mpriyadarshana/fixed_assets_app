import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xff5c5c5c),
              size: 20,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.78,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ARTHUR C CLARKE INSTITUTE FOR MODERN TECHNOLOGIES (ACCIMT)',
                    textAlign: TextAlign.center,
                    style: AppStyles.semiTextSize20White
                        .copyWith(color: const Color(0xff5c5c5c)),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Accelerate the introduction of modern technologies to Sri Lanka and to promote future studies in the areas of modern technologies.',
                    textAlign: TextAlign.center,
                    style: AppStyles.regularTextSize15White
                        .copyWith(color: const Color(0xff5c5c5c)),
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Contact Us',
                    textAlign: TextAlign.center,
                    style: AppStyles.mediumTextSize18White.copyWith(
                      color: const Color(0xff5c5c5c),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Katubedda, Moratuwa.',
                        textAlign: TextAlign.center,
                        style: AppStyles.lightTextSize12White
                            .copyWith(color: const Color(0xff5c5c5c)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'info@accimt.ac.lk',
                        textAlign: TextAlign.center,
                        style: AppStyles.lightTextSize12White
                            .copyWith(color: const Color(0xff5c5c5c)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '+94 112 650569',
                        textAlign: TextAlign.center,
                        style: AppStyles.lightTextSize12White
                            .copyWith(color: const Color(0xff5c5c5c)),
                      ),
                    ],
                  ),const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.fax_outlined,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '+94 112 650838',
                        textAlign: TextAlign.center,
                        style: AppStyles.lightTextSize12White
                            .copyWith(color: const Color(0xff5c5c5c)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: Center(
              child: Text(
                'ARTHUR C CLARKE INSTITUTE FOR MODERN\nTECHNOLOGIES (ACCIMT)',
                style: AppStyles.mediumTextSize10.copyWith(
                  color: Colors.black.withOpacity(0.2),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

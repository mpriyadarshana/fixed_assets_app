import 'package:fixed_assets_app/features/presentation/views/login_page.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';
import '../widgets/custom_form_field.dart';

class IpConfigView extends StatefulWidget {
  const IpConfigView({super.key});

  @override
  State<IpConfigView> createState() => _IpConfigViewState();
}

class _IpConfigViewState extends State<IpConfigView> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    TextEditingController ipController = TextEditingController(text: '192.168.87.34');

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Enter your local IP',
                        style: AppStyles.semiBoldTextSize14White.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      const SizedBox(height: 25),
                      CustomFormField(
                        prefixIconColor: const Color(0xff5C5C5C),
                        prefixIcon: const Icon(Icons.wifi),
                        controller: ipController,
                      ),
                      const SizedBox(height: 80),
                      ElevatedButton(
                        style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 15,
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.blue,
                          ),
                          elevation: WidgetStatePropertyAll(2),
                        ),
                        onPressed: () async {
                          setState(() {
                            AppConstants.ip = ipController.text;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: AppStyles.mediumTextSize16White,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 32),
              child: Text(
                'ARTHUR C CLARKE INSTITUTE FOR MODERN\nTECHNOLOGIES (ACCIMT)',
                style: AppStyles.mediumTextSize10.copyWith(
                  color: Colors.black.withOpacity(0.2),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

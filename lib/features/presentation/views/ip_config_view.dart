import 'package:flutter/material.dart';
import 'package:fixed_assets_app/features/presentation/views/login_page.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import '../../../utils/app_styles.dart';
import '../widgets/custom_form_field.dart';
import 'footer.dart';

class IpConfigView extends StatefulWidget {
  const IpConfigView({super.key});

  @override
  State<IpConfigView> createState() => _IpConfigViewState();
}

class _IpConfigViewState extends State<IpConfigView> {
  late TextEditingController _ipController;

  @override
  void initState() {
    super.initState();
    _ipController = TextEditingController();
  }

  @override
  void dispose() {
    _ipController.dispose();
    super.dispose();
  }

  void _saveAndNavigate() {
    FocusScope.of(context).unfocus(); // Hide keyboard

    final String ip = _ipController.text.trim();

    if (ip.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter an IP address")),
      );
      return;
    }

    // Save IP
    AppConstants.ip = ip;

    // Navigate
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: height - 50,
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
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 25),

                      CustomFormField(
                        prefixIconColor: const Color(0xff5C5C5C),
                        prefixIcon: const Icon(Icons.wifi),
                        controller: _ipController,
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
                          backgroundColor:
                          WidgetStatePropertyAll(Colors.blue),
                          elevation: WidgetStatePropertyAll(2),
                        ),
                        onPressed: _saveAndNavigate,
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
            const Footer(),
          ],
        ),
      ),
    );
  }
}
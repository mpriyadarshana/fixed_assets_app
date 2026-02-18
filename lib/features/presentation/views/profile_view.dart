import 'package:fixed_assets_app/features/presentation/views/footer.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xffc8c8c8).withOpacity(0.5),
                        width: 5,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://t3.ftcdn.net/jpg/04/23/59/74/360_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${AppConstants.firstname + " " + AppConstants.lastname}',
                    textAlign: TextAlign.center,
                    style: AppStyles.semiTextSize20White
                        .copyWith(color: const Color(0xff5c5c5c)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${AppConstants.email + "@accimt.ac.lk"}',
                    textAlign: TextAlign.center,
                    style: AppStyles.regularTextSize15White
                        .copyWith(color: const Color(0xff5c5c5c)),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}

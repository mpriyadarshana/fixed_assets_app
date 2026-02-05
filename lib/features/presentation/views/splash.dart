import 'dart:async';

import 'package:fixed_assets_app/features/presentation/views/ip_config_view.dart';
import 'package:fixed_assets_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const IpConfigView()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 170,
              height: 170,
              child: Lottie.asset(
                'assets/lottie/qr.json',
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 15),
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Text(
                    'Fixed Assets',
                    style: AppStyles.mediumTextSize23Black
                        .copyWith(color: const Color(0xff5c5c5c)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

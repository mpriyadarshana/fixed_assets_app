import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_styles.dart';

class CustomDialogBox extends StatelessWidget {
  CustomDialogBox({
    super.key,
    this.title,
    this.image,
    this.isTwoButton = true,
    this.negativeButtonText,
    this.positiveButtonText,
    this.negativeButtonTap,
    this.positiveButtonTap,
    this.messege,
  });

  final String? title;
  final String? messege;
  bool? image = false;
  final bool isTwoButton;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final Function? negativeButtonTap;
  final Function? positiveButtonTap;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        alignment: FractionalOffset.center,
        padding: const EdgeInsets.all(20),
        child: Material(
          color: const Color(0xff273036),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Wrap(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Lottie.asset(image! ? 'assets/lottie/successNew.json' : 'assets/lottie/failedError.json'),
                      ),
                    ),
                    SizedBox(height: title != null ? 15 : 0),
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: AppStyles.mediumTextSize18White,
                    ),
                    SizedBox(height: messege != null ? 10 : 0),
                    Text(
                      messege ?? '',
                      textAlign: TextAlign.center,
                      style: AppStyles.regularTextSize12White,
                    ),
                    SizedBox(height: messege != null ? 35 : 20),
                    Row(
                      children: [
                        if (isTwoButton)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                negativeButtonTap!();
                              },
                              style: const ButtonStyle(
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.grey,
                                ),
                                elevation: WidgetStatePropertyAll(0),
                              ),
                              child: Text(
                                negativeButtonText ?? '',
                                style: AppStyles.mediumTextSize14Black
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        if (isTwoButton) const SizedBox(width: 5),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              positiveButtonTap!();
                            },
                            style: const ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.green,
                              ),
                              elevation: WidgetStatePropertyAll(0),
                            ),
                            child: Text(
                              positiveButtonText ?? 'Done',
                              style: AppStyles.mediumTextSize14Black
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void show(
    BuildContext context, {
    String? title,
    String? message,
    bool? image,
    bool isTwoButton = true,
    String? negativeButtonText,
    String? positiveButtonText,
    VoidCallback? negativeButtonTap,
    VoidCallback? positiveButtonTap,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: false,
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CustomDialogBox(
              title: title,
              messege: message,
              image: image,
              negativeButtonText: negativeButtonText,
              positiveButtonText: positiveButtonText,
              negativeButtonTap: negativeButtonTap,
              positiveButtonTap: positiveButtonTap,
              isTwoButton: isTwoButton,
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return const SizedBox.shrink();
      },
    );
  }
}

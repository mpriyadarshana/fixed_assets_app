import 'dart:math';
import 'dart:ui';

import 'package:fixed_assets_app/features/presentation/views/Scan/scan_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:fixed_assets_app/features/presentation/bloc/item/item_bloc.dart';
import 'package:fixed_assets_app/features/presentation/bloc/login/login_bloc.dart';
import 'package:fixed_assets_app/features/presentation/views/history/history_view.dart';
import 'package:fixed_assets_app/features/presentation/views/info_view.dart';
import 'package:fixed_assets_app/features/presentation/views/item_view.dart';
import 'package:fixed_assets_app/features/presentation/views/login_page.dart';
import 'package:fixed_assets_app/features/presentation/views/profile_view.dart';
import 'package:fixed_assets_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isProgressShow = false;
  final ItemBloc bloc = ItemBloc();
  final LoginBloc loginBloc = LoginBloc();

  Barcode? _barcode;

  Widget _barcodePreview(Barcode? value) {
  if (value == null) {
  return const Text(
  'Scan something!',
  overflow: TextOverflow.fade,
  style: TextStyle(color: Colors.white),
  );
  }

  return Text(
  value.displayValue ?? 'No display value.',
  overflow: TextOverflow.fade,
  style: const TextStyle(color: Colors.white),
  );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
  if (mounted) {
  setState(() {
  _barcode = barcodes.barcodes.firstOrNull;
  });
  }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: BlocListener<ItemBloc, ItemState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ItemLoadingState) {
          } else if (state is GetLocalHistorySuccessState) {
            setState(() {
              AppConstants.historyItems = state.historyItems;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryView(
                    items: state.historyItems,
                  ),
                ),
              );
            });
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xffCADADA),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xffCADADA),
                              radius: 30,
                              backgroundImage: NetworkImage(
                                'https://t3.ftcdn.net/jpg/04/23/59/74/360_F_423597477_AKCjGMtevfCi9XJG0M8jter97kG466y7.jpg',
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Asiri Govinda',
                                  style: AppStyles.mediumTextSize18White.copyWith(
                                    color: const Color(0xff5C5C5C),
                                  ),
                                ),
                                Text(
                                  'name@gmail.com',
                                  style:
                                      AppStyles.regularTextSize12White.copyWith(
                                    color: const Color(0xff5C5C5C),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                    (route) => false);
                              },
                              icon: const Icon(
                                Icons.logout_rounded,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.05),
                        Text(
                          'Welcome to',
                          style: AppStyles.mediumTextSize20White.copyWith(
                            color: const Color(0xff5C5C5C),
                          ),
                        ),
                        Text(
                          'Fixed Assets',
                          style: AppStyles.semiBoldTextSize25White.copyWith(
                            color: const Color(0xff5C5C5C),
                          ),
                        ),
                        SizedBox(height: height * 0.06),
                        Center(
                          child: Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (await Permission.camera
                                      .request()
                                      .isGranted) {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ScanView(),
                                      ),
                                    );

                                    if (result != null) {
                                      print('Scanned QR: $result');
                                      setState(() {});
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ItemDetailsView(
                                                itemId: result as String,
                                              ),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.09),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Scan',
                                      style: AppStyles.mediumTextSize20White
                                          .copyWith(
                                              color: const Color(0xff5C5C5C)),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  bloc.add(GetHistoryItemsEvent());
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.09),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'History',
                                      style: AppStyles.mediumTextSize20White
                                          .copyWith(
                                              color: const Color(0xff5C5C5C)),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ProfileView()));
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.09),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Profile',
                                      style: AppStyles.mediumTextSize20White
                                          .copyWith(
                                              color: const Color(0xff5C5C5C)),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const AppInfoView()));
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.09),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Info',
                                      style: AppStyles.mediumTextSize20White
                                          .copyWith(
                                              color: const Color(0xff5C5C5C)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  void showProgress() {
    if (!_isProgressShow) {
      setState(() {
        _isProgressShow = true;
      });

      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    alignment: FractionalOffset.center,
                    child: Wrap(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: 150,
                          width: 150,
                          child: Lottie.asset('assets/lottie/loading3.json'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Container();
        },
      );
    }
  }

  void hideProgressBar() {
    if (_isProgressShow) {
      Navigator.pop(context);
      _isProgressShow = false;
    }
  }
}

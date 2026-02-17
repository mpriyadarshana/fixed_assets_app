import 'dart:developer';
import 'dart:ui';

import 'package:fixed_assets_app/features/data/models/response/item_details_reponse.dart';
import 'package:fixed_assets_app/features/presentation/bloc/item/item_bloc.dart';
import 'package:fixed_assets_app/features/presentation/views/item_edit_view.dart';
import 'package:fixed_assets_app/features/presentation/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_styles.dart';

class ItemDetailsView extends StatefulWidget {
  final String itemId;

  const ItemDetailsView({super.key, required this.itemId});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  final ItemBloc bloc = ItemBloc();
  bool _isProgressShow = false;

  late Datum item;
  int id = 0;
  String description = '';
  String model = '';
  String serialNo = '';
  String code = '';
  String typeId = '';
  dynamic imagePath = '';

  @override
  void initState() {
    bloc.add(GetItemEvent(itemId: widget.itemId as String));
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffc8c8c8),
      body: BlocListener<ItemBloc, ItemState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ItemLoadingState) {
            showProgress();
          } else if (state is ItemGetSuccessfulState) {
            setState(() {
              item = state.itemDetailsResponse;

              id = item.id;
              model = item.model!;
              serialNo = item.serialNo!;
              description = item.description!;
            });
            hideProgressBar();
          } else if (state is ItemGetFailedState) {
            hideProgressBar();
            CustomDialogBox.show(context,
                isTwoButton: false,
                positiveButtonText: 'OK', positiveButtonTap: () {
              Navigator.pop(context);
            });
          } else if (state is VerifyItemSuccessState) {
            hideProgressBar();
            CustomDialogBox.show(
              context,
              isTwoButton: false,
              image: true,
              title: 'Success',
              message: 'you have successfully verified the item.',
              positiveButtonText: 'OK',
              positiveButtonTap: () {
                Navigator.pop(context);
                //Navigator.pop(context);
              },
            );
          } else if (state is VerifyItemFailedState) {
            hideProgressBar();
            CustomDialogBox.show(context,
                isTwoButton: false,
                image: false,
                title: 'Something went wrong',
                message: 'you haven\'t successfully verified the item.',
                positiveButtonText: 'OK', positiveButtonTap: () {
              Navigator.pop(context);
            });
          }
        },
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.45,
              child: Image.network(
                'https://images.unsplash.com/photo-1600443546015-f9b924a5b416?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBkZXNrfGVufDB8fDB8fHww',
                fit: BoxFit.fill,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height * 0.55,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                        bottom: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Item id : ',
                                  style: AppStyles.regularTextSize12White
                                      .copyWith(
                                          color: const Color(0xff5c5c5c),
                                          fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  id.toString(),
                                  style: AppStyles.mediumTextSize12Black
                                      .copyWith(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              model,
                              style: AppStyles.semiBoldTextSize25White.copyWith(
                                  color: const Color(
                                    0xff5c5c5c,
                                  ),
                                  fontSize: 32),
                            ),
                            SizedBox(height: height * 0.03),
                            Row(
                              children: [
                                Text(
                                  'Model Number :  ',
                                  style: AppStyles.semiBoldTextSize15White
                                      .copyWith(color: const Color(0xff5c5c5c)),
                                ),
                                Text(
                                  model,
                                  style: AppStyles.regularTextSize12White
                                      .copyWith(
                                          color: const Color(0xff5c5c5c),
                                          fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Row(
                              children: [
                                Text(
                                  'Serial Number :  ',
                                  style: AppStyles.semiBoldTextSize15White
                                      .copyWith(color: const Color(0xff5c5c5c)),
                                ),
                                Text(
                                  serialNo,
                                  style: AppStyles.semiBoldTextSize30
                                      .copyWith(
                                          color: const Color(0xff5c5c5c),
                                          fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              'Description :  ',
                              style: AppStyles.semiBoldTextSize15White
                                  .copyWith(color: const Color(0xff5c5c5c)),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              description,
                              textAlign: TextAlign.justify,
                              style: AppStyles.regularTextSize12White.copyWith(
                                  color: const Color(0xff5c5c5c), fontSize: 13),
                            ),
                            SizedBox(height: height * 0.05),
                            Material(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ItemEditView(
                                                      itemId: id.toString(),
                                                      model: model,
                                                      serialNo: serialNo,
                                                      description: description,
                                                    )));
                                      },
                                      style: const ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                          EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStatePropertyAll(
                                          Colors.green,
                                        ),
                                        elevation: WidgetStatePropertyAll(0),
                                      ),
                                      child: Text(
                                        'Edit',
                                        style: AppStyles.mediumTextSize14Black
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        DateTime now = DateTime.now();
                                        DateTime currentDate = DateTime(
                                            now.year, now.month, now.day);

                                        log('------');
                                        bloc.add(
                                          VerifyItemEvent(
                                            itemId: id,
                                            date: currentDate.toString(),
                                          ),
                                        );
                                      },
                                      style: const ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                          EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                        ),
                                        backgroundColor:
                                            WidgetStatePropertyAll(
                                          Colors.blue,
                                        ),
                                        elevation: WidgetStatePropertyAll(0),
                                      ),
                                      child: Text(
                                        'Confirm',
                                        style: AppStyles.mediumTextSize14Black
                                            .copyWith(color: Colors.white),
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
                ],
              ),
            ),
          ],
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
                          // child: CircularProgressIndicator(),
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
